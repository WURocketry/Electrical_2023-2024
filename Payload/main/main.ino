#include <algorithm>
#include <bitset>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO08x.h>
#include "Adafruit_BME680.h"
#include <Adafruit_GPS.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include "Adafruit_MAX1704X.h"
#include <RadioLib.h>
#include <Adafruit_NeoPixel.h>
#include <SoftwareSerial.h>

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
  SECONDS_SINCE_ON,
  BME_TEMPERATURE,
  BME_PRESSURE,
  BME_HUMIDITY,
  BME_GAS,
  BME_ALTITUDE,
  GPS_HOUR,
  GPS_MINUTE,
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
  "BNO_XACCEL",
  "BNO_YACCEL",
  "BNO_ZACCEL",
  "SECONDS_SINCE_ON",
  "BME_TEMPERATURE",
  "BME_PRESSURE",
  "BME_HUMIDITY",
  "BME_GAS",
  "BME_ALTITUDE",
  "GPS_HOUR",
  "GPS_MINUTE",
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

//Neopixel Definitions
const int pin = 4;
const int numPixels = 1;
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(numPixels, pin, NEO_GRB + NEO_KHZ800);

//BNO Defintions
sh2_SensorValue_t sensorValue;
sh2_SensorId_t reportType = SH2_ARVR_STABILIZED_RV;
long reportIntervalUs = 5000;

// BME680 Definitions 
#define SEALEVELPRESSURE_HPA (1013.25)

//GPS Defintions
uint32_t timer = millis();

//Openlog Defintions
const byte OpenLogAddress = 42;
String filename;
String smallFileName;

//Battery Monitor Defintions
float lastBatteryVoltage = 0.0;
unsigned long lastBatteryCheck = 0;  

//LoRa Defintions
#define FREQ 916.23
#define TRANSMIT_PWR 20
#define RFM95_CS    16  // Chip select pin
#define RFM95_RST   17  // Reset pin
#define RFM95_IRQ   21  // Interrupt pin, connected to DIO0
#define RFM95_GPIO  22  // Additional GPIO, connected to DIO1
SX1276 radio = new Module(RFM95_CS, RFM95_IRQ, RFM95_RST, RFM95_GPIO);
int16_t packetnum = 0;  

//Define timing separations for devices
float bnoTime = 342;
float bmeTime = 234;
float gpsTime = 1234;
float batteryTime = 2354;
float rfTime = 756;

unsigned long bnoTimer = 0;
unsigned long bmeTimer = 0;
unsigned long gpsTimer = 0;
unsigned long batteryTimer = 0;
unsigned long rfTimer = 0;


void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);

  //LoRa Setup
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  //LoRa Manual Reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);
  
  //Turn Radio On
  int state = radio.begin();
  if (state == RADIOLIB_ERR_NONE) {
    // no error
    Serial.println(F("Initialization successful!"));
  } else {
    ErrorLEDLoop("Failed to Init LoRa - Halting");
  }

  //Set Radio Transmit Power
  state = radio.setOutputPower(TRANSMIT_PWR, false);
  if(state == RADIOLIB_ERR_NONE) {
    Serial.print(F("Transmit Power set to: "));
    Serial.print(TRANSMIT_PWR);
    Serial.println(F(" dBm"));
  } else {
    Serial.print(F("Setting Output Power Failed:, code "));
    Serial.println(state);
  }

  //Set Radio Frequency 
  state = radio.setFrequency(FREQ);
  if(state == RADIOLIB_ERR_NONE) {
    Serial.print(F("Frequency set to: "));
    Serial.print(FREQ);
    Serial.println(F(" MHz"));
  } else {
    Serial.print(F("Setting frequency failed, code "));
    Serial.println(state);
  }

  //Initialize BNO
  if (!bno08x.begin_I2C()) {
    ErrorLEDLoop("Failed to find BNO08x IMU, Halting");
  }
  if (!bno08x.enableReport(reportType, reportIntervalUs)) {
    Serial.println("Could not enable stabilized remote vector for IMU");
  }


  //Initialize BME
  if (!bme.begin()) {
    ErrorLEDLoop("Failed to find BME680 sensor, Halting");
  }
  bme.setTemperatureOversampling(BME680_OS_8X);
  bme.setHumidityOversampling(BME680_OS_2X);
  bme.setPressureOversampling(BME680_OS_4X);
  bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
  bme.setGasHeater(320, 150);

  //Initialize GPS
  GPS.begin(0x10);  // The I2C address to use is 0x10
  GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCGGA);
  GPS.sendCommand(PMTK_SET_NMEA_UPDATE_1HZ); // 1 Hz update rate
  GPS.sendCommand(PGCMD_ANTENNA);
  delay(1000);
  GPS.println(PMTK_Q_RELEASE);

  //Initialize Openlog
  Wire.begin();
  logger.begin();
  int fileCount = getNumberOfPrevFlights();
  filename = "flight_" + String(fileCount) + ".txt";
  Serial.println("Writing this flights data to: " + filename);

  bmeTimer = millis();
  bnoTimer = millis();
  gpsTimer = millis();
  batteryTimer = millis();
  rfTimer = millis();
}

double secondsSinceOn(){
  return millis()/1000.0;
}

void ErrorLEDLoop(const char* error_msg){
  pixels.begin();
  pixels.setBrightness(255);
  while(true){
    Serial.println(error_msg);
    pixels.setPixelColor(0, pixels.Color(255, 0, 0));
    pixels.show();
    delay(1000);                      
    pixels.setPixelColor(0, pixels.Color(0, 0, 0));
    pixels.show();
    delay(1000);    
  }                
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

        DATA_COMPONENT_READINGS[SECONDS_SINCE_ON] = secondsSinceOn();

        const char* componentName = "BNO";
        float data[6];
        data[0] = DATA_COMPONENT_READINGS[BNO_YAW];
        data[1] = DATA_COMPONENT_READINGS[BNO_PITCH];
        data[2] = DATA_COMPONENT_READINGS[BNO_ROLL];
        data[3] = DATA_COMPONENT_READINGS[BNO_XACCEL];
        data[4] = DATA_COMPONENT_READINGS[BNO_YACCEL];
        data[5] = DATA_COMPONENT_READINGS[BNO_ZACCEL];

        logData(componentName, secondsSinceOn(), data, 6); 

      }
    } 
  }
}

// Function to collect data from BME680
void collectDataFromBME() {
  unsigned long currentMillis = millis();
  if (currentMillis >= bmeTimer) {
    bmeTimer += bmeTime;
    if (bme.beginReading()) {

      DATA_COMPONENT_READINGS[BME_TEMPERATURE] = bme.temperature;
      DATA_COMPONENT_READINGS[BME_PRESSURE] = bme.pressure;
      DATA_COMPONENT_READINGS[BME_HUMIDITY] = bme.humidity;
      DATA_COMPONENT_READINGS[BME_GAS] = bme.gas_resistance / 1000.0;
      DATA_COMPONENT_READINGS[BME_ALTITUDE] = bme.readAltitude(SEALEVELPRESSURE_HPA);

      const char* componentName = "BME";
      float data[5];
      data[0] = DATA_COMPONENT_READINGS[BME_TEMPERATURE];
      data[1] = DATA_COMPONENT_READINGS[BME_PRESSURE];
      data[2] = DATA_COMPONENT_READINGS[BME_HUMIDITY];
      data[3] = DATA_COMPONENT_READINGS[BME_GAS];
      data[4] = DATA_COMPONENT_READINGS[BME_ALTITUDE];
      logData(componentName, DATA_COMPONENT_READINGS[SECONDS_SINCE_ON], data, 5); 

    }
     else {
      Serial.println("Failed to perform BME680 reading");
    }
    bme.endReading();
  }
}

void collectDataFromGPS() {
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

      const char* componentName = "GPS";
      float data[5];
      data[0] = DATA_COMPONENT_READINGS[GPS_LATITUDE];
      data[1] = DATA_COMPONENT_READINGS[GPS_LONGITUDE];
      data[2] = DATA_COMPONENT_READINGS[GPS_HOUR];
      data[3] = DATA_COMPONENT_READINGS[GPS_SPEED];
      data[4] = DATA_COMPONENT_READINGS[GPS_ALTITUDE];

      logData(componentName, secondsSinceOn(), data, 5); 

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


void logData(const char* componentName, float secondsSinceOn, float* data, int dataSize) {
  // Construct the initial part of the string to write
  String writeto = String(componentName) + "," + String(secondsSinceOn) + ",";
  // Open the file for appending
  logger.append(filename);
  // Write the initial part
  logger.print(writeto);
  // Iterate over the data array and append each value
  for (int i = 0; i < dataSize; i++) {
      logger.print(String(data[i]));  // Write data value
      if (i < dataSize - 1) {
        logger.print(",");  // Add comma if it's not the last element
      }
  }
  // End line after all data values are written
  logger.println();
  // Save changes
  logger.syncFile();
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

    const char* componentName = "BAT";
    float data[3];
    data[0] = DATA_COMPONENT_READINGS[BATTERY_PERCENT];
    data[1] = DATA_COMPONENT_READINGS[BATTERY_VOLTAGE];
    data[2] = DATA_COMPONENT_READINGS[BATTERY_DISCHARGE_RATE];
    logData(componentName, secondsSinceOn(), data, 3); 
    
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

    unsigned long currentMillis = millis();
    if (currentMillis >= rfTime + rfTimer) {
      rfTimer += rfTime;

      int state = radio.transmit((uint8_t *)radiopacket, strlen(radiopacket) + 1);  // +1 to include the null terminator

      if (state == RADIOLIB_ERR_NONE) {
        Serial.println("success!");
      } else {
        Serial.print("failed, error code: ");
        Serial.println(state);
      }
    }
}

void loop() {       

  collectDataFromBNO();  
  collectDataFromBME();  
  collectDataFromGPS();
  collectDataFromBatteryMonitor();
  transmitCurrentComponentReadings();   
}


