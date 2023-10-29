#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO08x.h>
#include "Adafruit_BME680.h"
#include <Adafruit_GPS.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include "Adafruit_MAX1704X.h"
#include <SPI.h>
#include <RH_RF95.h>

// Define sensor objects
Adafruit_BNO08x bno08x;
Adafruit_BME680 bme;
Adafruit_GPS GPS(&Wire);
OpenLog logger;
Adafruit_MAX17048 maxlipo;


// Struct for Euler angles
struct euler_t {
  float yaw;
  float pitch;
  float roll;
} ypr;


//enum for global array indices
enum{
  BNO_YAW,
  BNO_PITCH,
  BNO_ROLL,
  BNO_XACCEL,
  BNO_YACCEL,
  BNO_ZACCEL,
  BME_TEMPERATURE,
  BME_PRESSURE,
  BME_HUMIDITY,
  BME_GAS,
  BME_ALTITUDE,
  GPS_HOUR,
  GPS_MINUTE,
  GPS_SECONDS,
  GPS_SPEED,
  GPS_LATITUDE,
  GPS_LONGITUDE,
  GPS_ALTITUDE,
  BATTERY_PERCENT,
  BATTERY_VOLTAGE,
  BATTERY_DISCHARGE_RATE,
  ENUM_SIZE, 
};

const char* ENUM_NAMES[] = {
  "BNO_YAW",
  "BNO_PITCH",
  "BNO_ROLL",
  "BME_TEMPERATURE",
  "BME_PRESSURE",
  "BME_HUMIDITY",
  "BME_GAS",
  "BME_ALTITUDE",
  "GPS_HOUR",
  "GPS_MINUTE",
  "GPS_SECONDS",
  "GPS_SPEED",
  "GPS_LATITUDE",
  "GPS_LONGITUDE",
  "GPS_ALTITUDE",
  "BATTERY_PERCENT",
  "BATTERY_VOLTAGE",
  "BATTERY_DISCHARGE_RATE_%_PER_HOUR",
};


//Global Sensor Data Array
double DATA_COMPONENT_READINGS[ENUM_SIZE];


sh2_SensorValue_t sensorValue;
sh2_SensorId_t reportType = SH2_ARVR_STABILIZED_RV;
long reportIntervalUs = 5000;

// BME680 Definitions 
#define SEALEVELPRESSURE_HPA (1013.25)

//GPS Defintions
uint32_t timer = millis();

//Openlog Defintions
const byte OpenLogAddress = 42; //Default Qwiic OpenLog I2C address
String filename;

//Battery Monitor Defintions
float lastBatteryVoltage = 0.0;
unsigned long lastBatteryCheck = 0;  

//LoRa Radio Definitions
#define RFM95_CS   16
#define RFM95_INT  21
#define RFM95_RST  17
#define RF95_FREQ 915.0
RH_RF95 rf95(RFM95_CS, RFM95_INT);
int16_t packetnum = 0;  

//Define timing separations for devices
float bnoTime = 2000;
float bmeTime = 3200;
float gpsTime = 2000;
float batteryTime = 2000;

unsigned long bnoTimer = 0;
unsigned long bmeTimer = 0;
unsigned long gpsTimer = 0;
unsigned long batteryTimer = 0;

void setup() {

  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);

  // Initialize BNO08x
  if (!bno08x.begin_I2C()) {
    ErrorLEDLoop("Failed to find BNO08x IMU, Halting");
  }
  if (!bno08x.enableReport(reportType, reportIntervalUs)) {
    Serial.println("Could not enable stabilized remote vector for IMU");
  }


  // Initialize BME680
  if (!bme.begin()) {
    ErrorLEDLoop("Failed to find BME680 sensor, Halting");
  }
  bme.setTemperatureOversampling(BME680_OS_8X);
  bme.setHumidityOversampling(BME680_OS_2X);
  bme.setPressureOversampling(BME680_OS_4X);
  bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
  bme.setGasHeater(320, 150);


  // Initialize GPS
  GPS.begin(0x10);  // The I2C address to use is 0x10
  GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCGGA);
  GPS.sendCommand(PMTK_SET_NMEA_UPDATE_1HZ); // 1 Hz update rate
  GPS.sendCommand(PGCMD_ANTENNA);
  delay(1000);
  GPS.println(PMTK_Q_RELEASE);

  //OpenLog Setup
  Wire.begin();
  logger.begin(); //Open connection to OpenLog (no pun intended)
  int fileCount = getNumberOfPrevFlights();
  filename = "flight_" + String(fileCount) +".csv";
  Serial.println("Writing this flights data to: " + filename);
  writeColumnHeaders();

  //LoRa Setup
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  //Radio Reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);
  //LoRa Init & Frequency Test
  while (!rf95.init()) {
    ErrorLEDLoop("LoRa radio init failed, Halting");
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    ErrorLEDLoop("setFrequency failed, Halting");
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);
  rf95.setTxPower(23, false); //5-23 power level, 23 is max


  initBatteryMonitor();

}

void quaternionToEulerRV(sh2_RotationVectorWAcc_t* rotational_vector, euler_t* ypr, bool degrees = false) {
  float sqr = sq(rotational_vector->real);
  float sqi = sq(rotational_vector->i);
  float sqj = sq(rotational_vector->j);
  float sqk = sq(rotational_vector->k);

  ypr->yaw = atan2(2.0 * (rotational_vector->i * rotational_vector->j + rotational_vector->k * rotational_vector->real), (sqi - sqj - sqk + sqr));
  ypr->pitch = asin(-2.0 * (rotational_vector->i * rotational_vector->k - rotational_vector->j * rotational_vector->real) / (sqi + sqj + sqk + sqr));
  ypr->roll = atan2(2.0 * (rotational_vector->j * rotational_vector->k + rotational_vector->i * rotational_vector->real), (-sqi - sqj + sqk + sqr));

  if (degrees) {
    ypr->yaw *= RAD_TO_DEG;
    ypr->pitch *= RAD_TO_DEG;
    ypr->roll *= RAD_TO_DEG;
  }
}

// Function to collect data from BNO08x
void collectDataFromBNO() {
  unsigned long currentMillis = millis();
  if (currentMillis >= bnoTime + bnoTimer) {
    bnoTimer += bnoTime;
    if (bno08x.wasReset()) {
      Serial.print("sensor was reset ");
      bno08x.enableReport(reportType, reportIntervalUs);
    }
   
    if (bno08x.getSensorEvent(&sensorValue)) {
      if (sensorValue.sensorId == reportType) {
        quaternionToEulerRV(&sensorValue.un.arvrStabilizedRV, &ypr, true);
 
        DATA_COMPONENT_READINGS[BNO_YAW] = ypr.yaw;
 


      DATA_COMPONENT_READINGS[BNO_PITCH] = ypr.pitch;

      DATA_COMPONENT_READINGS[BNO_ROLL] = ypr.roll;

      DATA_COMPONENT_READINGS[BNO_XACCEL] = sensorValue.un.accelerometer.x;
      DATA_COMPONENT_READINGS[BNO_YACCEL] = sensorValue.un.accelerometer.y;
      DATA_COMPONENT_READINGS[BNO_ZACCEL] = sensorValue.un.accelerometer.z;

      // syntax for linear acceleration
      // DATA_COMPONENT_READINGS[BNO_ZACCEL] = sensorValue.un.linearAcceleration.z;

      // syntax for raw accelerometer
      // DATA_COMPONENT_READINGS[BNO_ZACCEL] = sensorValue.un.rawAccelerometer.z;
    }
  }
}

// Function to collect data from BME680
/*
The bme.performReading() function is blocking, it takes like 3 seconds to run. The delta timing loop is useless
since the program will get stuck on the if-statement for 3 seconds before taking any other measurements. To avoid
this we updated the delta timing loop to update every 3200 milliseconds (needs more testing) and we asynchronously collect the data by using 'beginReading()' and then 'endReading()' Still needs more testing to find out what the largest time it may take to gather that data. Probably around 3000. --Chase

*/
void collectDataFromBME() {
  unsigned long currentMillis = millis();
  if (currentMillis >= bmeTime + bmeTimer) {
    bmeTimer += bmeTime;
    if (bme.beginReading()) {

      DATA_COMPONENT_READINGS[BME_TEMPERATURE] = bme.temperature;
      DATA_COMPONENT_READINGS[BME_PRESSURE] = bme.pressure;
      DATA_COMPONENT_READINGS[BME_HUMIDITY] = bme.humidity;
      DATA_COMPONENT_READINGS[BME_GAS] = bme.gas_resistance / 1000.0;
      DATA_COMPONENT_READINGS[BME_ALTITUDE] = bme.readAltitude(SEALEVELPRESSURE_HPA);

    }
     else {
      Serial.println("Failed to perform BME680 reading");
    }
    bme.endReading();
  }
}

void collectDataFromGPS() 
{
  // read data from the GPS in the 'main loop'
  char c = GPS.read();

  // if a sentence is received, we can check the checksum, parse it...
  if (GPS.newNMEAreceived()) {
    // a tricky thing here is if we print the NMEA sentence, or data
    // we end up not listening and catching other sentences!
    // so be very wary if using OUTPUT_ALLDATA and trying to print out data
    Serial.println(GPS.lastNMEA()); // this also sets the newNMEAreceived() flag to false
    if (!GPS.parse(GPS.lastNMEA())) // this also sets the newNMEAreceived() flag to false
      return; // we can fail to parse a sentence in which case we should just wait for another
  }

  // approximately every 2 seconds or so, print out the current stats
  unsigned long currentMillis = millis();
  if (currentMillis >= gpsTime + gpsTimer) {
    gpsTimer += gpsTime;

    if (GPS.fix) {
      DATA_COMPONENT_READINGS[GPS_LATITUDE] = GPS.lat;
      DATA_COMPONENT_READINGS[GPS_LONGITUDE] = GPS.lon;
      DATA_COMPONENT_READINGS[GPS_HOUR] = GPS.hour;
      DATA_COMPONENT_READINGS[GPS_SPEED] = GPS.speed;
      DATA_COMPONENT_READINGS[GPS_ALTITUDE] = GPS.altitude;
    }
    else {
      DATA_COMPONENT_READINGS[GPS_LATITUDE] = -1;
      DATA_COMPONENT_READINGS[GPS_LONGITUDE] = -1;
      DATA_COMPONENT_READINGS[GPS_HOUR] = -1;
      DATA_COMPONENT_READINGS[GPS_SPEED] = -1;
      DATA_COMPONENT_READINGS[GPS_ALTITUDE] = -1;

    }
  }
}

// Function to write column headers
void writeColumnHeaders() {
  logger.append(filename); // Open the file
  
  for (int i = 0; i < ENUM_SIZE; i++) {
    logger.print(String(ENUM_NAMES[i]));  // Write each column name
    if (i < ENUM_SIZE - 1) {
      logger.print(",");  // Add comma if it's not the last element
    }
  }
  logger.println();  // End of line after all columns are written
  
  logger.syncFile();  // Save the changes
}

// Updated writeToFile function
void writeToFile() {
  logger.append(filename);
  
  for (int i = 0; i < ENUM_SIZE; i++) {
    logger.print(String(DATA_COMPONENT_READINGS[i]));  // Write each data element
    if (i < ENUM_SIZE - 1) {
      logger.print(",");  // Add comma if it's not the last element
    }
  }
  logger.println();  // End of line after all data are written
  
  logger.syncFile();  // Save the changes
}

int getNumberOfPrevFlights(){
  int fileCount = 0;
  
  // Check if the file exists
  long sizeOfFile = logger.size("fileNum.txt");
  if (sizeOfFile > -1) {
    byte myBufferSize = 200; // Increase this buffer size to hold larger numbers
    byte myBuffer[myBufferSize];
    logger.read(myBuffer, myBufferSize, "fileNum.txt"); // Load myBuffer with contents of fileNum.txt
    
    String counterString = "";
    for (int x = 0 ; x < myBufferSize ; x++) {
      if (myBuffer[x] >= '0' && myBuffer[x] <= '9') {
        counterString += (char)myBuffer[x];
      }
    }
    fileCount = counterString.toInt();
    
  }
  
  // Increment the file count
  fileCount++;

  Serial.println(fileCount);
  
  // Overwrite the file with the new file count
  logger.remove("fileNum.txt", false);
  logger.append("fileNum.txt"); 
  logger.print(String(fileCount));
  logger.syncFile(); // Ensure data is written to SD card

  return fileCount;
}


void collectDataFromBatteryMonitor() {
  unsigned long currentMillis = millis();
  if (currentMillis >= batteryTime + batteryTimer) {
    batteryTimer += batteryTime;

    DATA_COMPONENT_READINGS[BATTERY_PERCENT] = maxlipo.cellPercent();
    DATA_COMPONENT_READINGS[BATTERY_VOLTAGE] = maxlipo.cellVoltage();
    DATA_COMPONENT_READINGS[BATTERY_DISCHARGE_RATE] = maxlipo.chargeRate();
    
  }
}

void printAllData() {
  Serial.println("--------------------------------------------------------");
  for (int i = 0; i < ENUM_SIZE; i++) {
    Serial.print(ENUM_NAMES[i]);
    Serial.print(": ");
    Serial.println(DATA_COMPONENT_READINGS[i]);
  }
}

void initBatteryMonitor(){
  if (!maxlipo.begin()) {
    ErrorLEDLoop("Couldn't find Adafruit MAX17048?\nMake sure a battery is plugged in!");
  }
  Serial.print(F("Found MAX17048"));
  Serial.print(F(" with Chip ID: 0x")); 
  Serial.println(maxlipo.getChipID(), HEX);
  
}

void transmitCurrentComponentReadings() {

    // Prepare a buffer to hold the transmitted message
    char radiopacket[256] = {0};  
    
    // Iterate through the DATA_COMPONENT_READINGS array and build the message
    for (int i = 0; i < ENUM_SIZE; i++) {
        char buffer[32];  // Temporary buffer to hold each value
        dtostrf(DATA_COMPONENT_READINGS[i], 6, 2, buffer);  // Convert double to string, adjust field width and decimal places as necessary

        // Append the value to radiopacket
        strcat(radiopacket, buffer);

        // If not the last element, append a comma
        if (i < ENUM_SIZE - 1) {
            strcat(radiopacket, ",");
        }
    }

    // Send the message via RF95
    rf95.send((uint8_t *)radiopacket, strlen(radiopacket) + 1);  // +1 to include the null terminator

    rf95.waitPacketSent();  // Wait for transmission to complete
}

void ErrorLEDLoop(const char* error_msg){
  while(true){
    Serial.println(error_msg);
    digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
    delay(1000);                      
    digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
    delay(1000);    
  }                
}




void loop() {

         
  collectDataFromBNO();  
  collectDataFromBME();  
  collectDataFromGPS();
  collectDataFromBatteryMonitor();
  writeToFile();
  printAllData();
  transmitCurrentComponentReadings();
        
}
