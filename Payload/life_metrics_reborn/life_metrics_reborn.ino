#include <Wire.h>
#include "Adafruit_SGP30.h"
#include <Adafruit_Sensor.h>
#include "Adafruit_BMP3XX.h"
#include <Adafruit_BNO08x.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include <Adafruit_NeoPixel.h>
#include <RadioLib.h>

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
long randomNumber;
String fileName;

//BNO08x
#define BNO08X_RESET -1 
Adafruit_BNO08x bno08x(BNO08X_RESET);

// SGP30
Adafruit_SGP30 sgp;

// BMP3XX
#define SEALEVELPRESSURE_HPA (1013.25)
Adafruit_BMP3XX bmp;


float rf_channel = 4;
float currentFrequency = 915 + rf_channel * 0.1;

//LoRa Defintions
#define FREQ currentFrequency
#define TRANSMIT_PWR 23
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


  //Init Openlog
  Wire.begin();
  myLog.begin();
  randomSeed(analogRead(A3));
  Serial.println(analogRead(A3));
  randomNumber = random(0, 2147483647);
  randomNumber = random(0, 2147483647);
  Serial.println(randomNumber);
  fileName = "flight_" + String(randomNumber) + ".txt";
  Serial.println(fileName);

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

  // Try to initialize the BNO08x sensor over I2C
  if (!bno08x.begin_I2C()) {
    ErrorLEDLoop("Failed to find BNO08x IMU, Halting");
    while (1) {
      delay(10); // Infinite loop if the sensor is not found
    }
  }

  // Enable the accelerometer report
  if (!bno08x.enableReport(SH2_ACCELEROMETER)) {
    ErrorLEDLoop("Failed to enable the accelerometer, Halting");
  }

  // Initialize SGP30
  if (!sgp.begin()){
    ErrorLEDLoop("Failed to initialize SGP30 , Halting");
    while (1);
  }
  // If you have a baseline measurement from before you can assign it to start, to 'self-calibrate'
  sgp.setIAQBaseline(0x8CDB, 0x8F41); 
  Serial.print(F("Found SGP30 serial #"));
  Serial.print(sgp.serialnumber[0], HEX);
  Serial.print(sgp.serialnumber[1], HEX);
  Serial.println(sgp.serialnumber[2], HEX);

  // Initialize BMP3XX
  if (!bmp.begin_I2C()) {   // hardware I2C mode, can pass in address & alt Wire
    ErrorLEDLoop("Failed to find BMP sensor, Halting");
    while (1);
  }
  
  // Set up oversampling and filter initialization for BMP3XX
  bmp.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
  bmp.setPressureOversampling(BMP3_OVERSAMPLING_4X);
  bmp.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
  bmp.setOutputDataRate(BMP3_ODR_50_HZ);

  Serial.println("Sensors initialized successfully.");
}

void ErrorLEDLoop(const char* error_msg){
  pixels.begin();
  pixels.setPixelColor(0, pixels.Color(255, 0, 0));
  pixels.show();
  while(true){
    Serial.println(error_msg);
    pixels.setBrightness(0);
    pixels.show();
    delay(1000);                      
    pixels.setBrightness(255);
    pixels.show();
    delay(1000);    
  }                
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
  transmitCurrentComponentReadings();
  myLog.syncFile();
}