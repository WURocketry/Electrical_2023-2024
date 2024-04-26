#include <Wire.h>
#include "Adafruit_SGP30.h"
#include <Adafruit_Sensor.h>
#include "Adafruit_BMP3XX.h"
#include <Adafruit_BNO08x.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include <Adafruit_NeoPixel.h>
#include <RadioLib.h>
#include <Adafruit_ADXL345_U.h> // our new accelerometer

// Global variables for time tracking
unsigned long lastEnvSensorPoll = 0;
const long envSensorInterval = 500;


enum LiveUpdateFields {
  XACCEL_BNO,
  YACCEL_BNO,
  ZACCEL_BNO,
  TEMPERATURE_BME,
  ALTITUDE_BME,
  VOLATILE_COMPONENT,
  LIVE_RADIO_SIZE,
};
const char* LIVE_DATA_NAMES[] = {
  "XACCEL_BNO",
  "YACCEL_BNO",
  "ZACCEL_BNO",
  "TEMPERATURE_BME",
  "ALTITUDE_BME",
  "VOLATILE_COMPONENT"
  "LIVE_RADIO_SIZE",
};

float LIVE_DATA[LIVE_RADIO_SIZE];

//Openlog
OpenLog myLog;
long randomNumber = random(0, 2147483647);
String fileName = "flight_" + String(randomNumber) + ".txt";

//BNO08x
#define BNO08X_RESET -1 
Adafruit_BNO08x bno08x(BNO08X_RESET);
//BNO Defintions
sh2_SensorValue_t sensorValue;
sh2_SensorId_t reportType = SH2_ARVR_STABILIZED_RV;
long reportIntervalUs = 5000;

/* Assign a unique ID to this accelerometer at the same time */
Adafruit_ADXL345_Unified accel = Adafruit_ADXL345_Unified(12345);

// SGP30
Adafruit_SGP30 sgp;

// BMP3XX
#define SEALEVELPRESSURE_HPA (1013.25)
Adafruit_BMP3XX bmp;


//LoRa Defintions
#define FREQ 915
#define TRANSMIT_PWR 20
#define RFM95_CS    16  // Chip select pin
#define RFM95_RST   17  // Reset pin
#define RFM95_IRQ   21  // Interrupt pin, connected to DIO0
#define RFM95_GPIO  22  // Additional GPIO, connected to DIO1
SX1276 radio = new Module(RFM95_CS, RFM95_IRQ, RFM95_RST, RFM95_GPIO);
float rfTime = 756;
unsigned long rfTimer = 0;

//Neopixel Definitions
const int pin = 4;
const int numPixels = 1;
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(numPixels, pin, NEO_GRB + NEO_KHZ800);

/* return absolute humidity [mg/m^3] with approximation formula
* @param temperature [°C]
* @param humidity [%RH]
*/
uint32_t getAbsoluteHumidity(float temperature, float humidity) {
    // approximation formula from Sensirion SGP30 Driver Integration chapter 3.15
    const float absoluteHumidity = 216.7f * ((humidity / 100.0f) * 6.112f * exp((17.62f * temperature) / (243.12f + temperature)) / (273.15f + temperature)); // [g/m^3]
    const uint32_t absoluteHumidityScaled = static_cast<uint32_t>(1000.0f * absoluteHumidity); // [mg/m^3]
    return absoluteHumidityScaled;
}

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
    // keep trying then blink LED
    while(state != RADIOLIB_ERR_NONE){
      int state = radio.begin();
      ErrorLEDLoop("Failed to Init LoRa - Halting");
    }
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
  /* no longer using BNO
  // Try to initialize the BNO08x sensor over I2C
  if (!bno08x.begin_I2C()) {
    ErrorLEDLoop("Failed to find BNO08x IMU, Halting");
  }
  if (bno08x.wasReset()) {
      Serial.print("sensor was reset ");
      bno08x.enableReport(reportType, reportIntervalUs);
  }
  */

   /* Initialise the accelerometer */
  while(!accel.begin())
  {
    /* There was a problem detecting the ADXL345 ... check your connections */
    ErrorLEDLoop("Failed to enable the ADXL345, Halting");
    accel = Adafruit_ADXL345_Unified(random(0, 2147483647));
  }
  /* Set the range for accelerometer */
  accel.setRange(ADXL345_RANGE_16_G); 
  // accel.setRange(ADXL345_RANGE_8_G);
  accel.setDataRate(ADXL345_DATARATE_25_HZ); // sampling rate: 25 Hz
    
  // Enable the accelerometer report
  while (!bno08x.enableReport(SH2_ACCELEROMETER)) {
    ErrorLEDLoop("Failed to enable the accelerometer, Halting");
  }

  // Initialize SGP30
  while (!sgp.begin()){
    sgp.begin();
    ErrorLEDLoop("Failed to initialize SGP30 , Halting");
  }
  Serial.print(F("Found SGP30 serial #"));
  Serial.print(sgp.serialnumber[0], HEX);
  Serial.print(sgp.serialnumber[1], HEX);
  Serial.println(sgp.serialnumber[2], HEX);

  // Initialize BMP3XX
  while (!bmp.begin_I2C()) {   // hardware I2C mode, can pass in address & alt Wire
    ErrorLEDLoop("Failed to find BMP sensor, Halting");
    bmp.begin_I2C();
  }
  
  // Set up oversampling and filter initialization for BMP3XX
  bmp.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
  bmp.setPressureOversampling(BMP3_OVERSAMPLING_4X);
  bmp.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
  bmp.setOutputDataRate(BMP3_ODR_50_HZ);

  Serial.println("Sensors initialized successfully.");

  // accelerometer 
  displaySensorDetails();
  //Init Openlog
  Wire.begin();
  myLog.begin();
}

void displaySensorDetails(void)
{
  sensor_t sensor;
  accel.getSensor(&sensor);
  Serial.println("------------------------------------");
  Serial.print  ("Sensor:       "); Serial.println(sensor.name);
  Serial.print  ("Driver Ver:   "); Serial.println(sensor.version);
  Serial.print  ("Unique ID:    "); Serial.println(sensor.sensor_id);
  Serial.print  ("Max Value:    "); Serial.print(sensor.max_value); Serial.println(" m/s^2");
  Serial.print  ("Min Value:    "); Serial.print(sensor.min_value); Serial.println(" m/s^2");
  Serial.print  ("Resolution:   "); Serial.print(sensor.resolution); Serial.println(" m/s^2");  
  Serial.println("------------------------------------");
  Serial.println("");
  delay(500);
}


void ErrorLEDLoop(const char* error_msg){
  pixels.begin();
  pixels.setPixelColor(0, pixels.Color(255, 0, 0));
  pixels.show();
  //while(true){
    Serial.println(error_msg);
    pixels.setBrightness(0);
    pixels.show();
    // delay(1000);       // i want this to flash as fast as possible forever               
    pixels.setBrightness(255);
    pixels.show();
  //}                
}


void transmitCurrentComponentReadings() {
  // Prepare a buffer to hold the transmitted message
  char radiopacket[256] = {0};  
  // Iterate through the DATA_COMPONENT_READINGS=> LIVE_DATA array and build the message
  for (int i = 0; i < LIVE_RADIO_SIZE; i++) {
    char buffer[32];  // Temporary buffer to hold each value

    // dtostrf(DATA_COMPONENT_READINGS[i], 6, 2, buffer);  // Convert double to string, adjust field width and decimal places as necessary
    dtostrf(LIVE_DATA[i], 8, 6, buffer);  // Convert float to string, adjust field width and decimal places as necessary

    // Append the value to radiopacket
    strcat(radiopacket, buffer);

    // If not the last element, append a comma
    if (i < LIVE_RADIO_SIZE - 1) {
      strcat(radiopacket, ",");
      }
    }

    unsigned long currentMillis = millis();
    if (currentMillis >= rfTime + rfTimer) {
      rfTimer += rfTime;
      
      int state = radio.transmit((uint8_t *)radiopacket, strlen(radiopacket) + 1);  // +1 to include the null terminator

      if (state == RADIOLIB_ERR_NONE) {
        // Print the content of radiopacket
        Serial.print("Content to transmit: ");
        Serial.println(radiopacket);

        Serial.println("success!");
      } else {
        Serial.print("failed, error code: ");
        Serial.println(state);
      }
    }
}

void loop() {
  unsigned long currentMillis = millis();
  myLog.append(fileName);
  if (currentMillis - lastEnvSensorPoll >= envSensorInterval) {
    lastEnvSensorPoll = currentMillis;

    // Perform BMP3XX reading
    if (!bmp.performReading()) {
      ErrorLEDLoop("Failed to find perform reading on BMP");

      return;
    }
    //Time for Gas
    myLog.print(millis()/1000.0);
    myLog.print(" s, ");

    // Print BMP3XX readings
    myLog.print(bmp.temperature);
    myLog.print(" *C, ");

    myLog.print(bmp.pressure / 100.0);
    myLog.print(" hPa, ");

    myLog.print(bmp.readAltitude(SEALEVELPRESSURE_HPA));
    myLog.println(" m");

    LIVE_DATA[TEMPERATURE_BME] = bmp.temperature;
    LIVE_DATA[ALTITUDE_BME] = bmp.readAltitude(SEALEVELPRESSURE_HPA);

    // Use temperature to adjust SGP30 readings
    float temperature = bmp.temperature; // Assume temperature from BMP3XX is the ambient temperature
    float humidity = 50.0; // Assume a default humidity value, as BMP3XX does not measure humidity
    sgp.setHumidity(getAbsoluteHumidity(temperature, humidity));

    // Perform SGP30 reading
    if (!sgp.IAQmeasure()) {
      ErrorLEDLoop("Failed to read SGP30 sensor, Halting");
      return;
    }
    myLog.print(millis()/1000.0);
    myLog.print(" s, ");

    myLog.print("TVOC: ");
    myLog.print(sgp.TVOC);
    LIVE_DATA[VOLATILE_COMPONENT] = sgp.TVOC;
    myLog.print("ppb, ");
    myLog.print("eCO2: ");
    myLog.print(sgp.eCO2);
    myLog.println("ppm");

  }

  sh2_SensorValue_t sensorValue; // Variable to hold sensor data
  /*
  // Check if new accelerometer data is available
  if (bno08x.getSensorEvent(&sensorValue)) {
    if (sensorValue.sensorId == SH2_ACCELEROMETER) {
      // Print the timestamp and accelerometer values in a single line
      myLog.print(millis()/1000.0);
      myLog.print(" s, ");
      myLog.print("X: ");
      myLog.print(sensorValue.un.accelerometer.x);
      myLog.print(", Y: ");
      myLog.print(sensorValue.un.accelerometer.y);
      myLog.print(", Z: ");
      myLog.println(sensorValue.un.accelerometer.z);

      LIVE_DATA[XACCEL_BNO] = sensorValue.un.accelerometer.x;
      LIVE_DATA[YACCEL_BNO] = sensorValue.un.accelerometer.y;
      LIVE_DATA[ZACCEL_BNO] = sensorValue.un.accelerometer.z;
      Serial.println(LIVE_DATA[ZACCEL_BNO]);
    }
  }
  */
   sensors_event_t event; 
  // units: m/s^2
  if(accel.getEvent(&event)){
    float x_accel = event.acceleration.x;
    float y_accel = event.acceleration.y;
    float z_accel = event.acceleration.z;
    myLog.print("X: ");
    myLog.print(x_accel);
    myLog.print(", Y: ");
    myLog.print(y_accel); 
    myLog.print(", Z: ");
    myLog.print(z_accel); 
    LIVE_DATA[XACCEL_BNO] = x_accel;
    LIVE_DATA[YACCEL_BNO] = y_accel;
    LIVE_DATA[ZACCEL_BNO] = z_accel;
    Serial.println(LIVE_DATA[ZACCEL_BNO]);
  }
  transmitCurrentComponentReadings();
  myLog.syncFile();
}
