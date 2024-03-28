#include <Wire.h>
#include "Adafruit_SGP30.h"
#include <Adafruit_Sensor.h>
#include "Adafruit_BMP3XX.h"
#include <Adafruit_BNO08x.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include <Adafruit_NeoPixel.h>

// Global variables for time tracking
unsigned long lastEnvSensorPoll = 0;
const long envSensorInterval = 500;

//Openlog
OpenLog myLog;
long randomNumber = random(0, 2147483647);
String fileName = "flight_" + String(randomNumber) + ".txt";

//BNO08x
#define BNO08X_RESET -1 
Adafruit_BNO08x bno08x(BNO08X_RESET);

// SGP30
Adafruit_SGP30 sgp;

// BMP3XX
#define SEALEVELPRESSURE_HPA (1013.25)
Adafruit_BMP3XX bmp;


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
  while (!Serial); // Wait for serial console to open!
  pinMode(LED_BUILTIN, OUTPUT);


  //Init Openlog
  Wire.begin();
  myLog.begin();

  // Try to initialize the BNO08x sensor over I2C
  if (!bno08x.begin_I2C()) {
    ErrorLEDLoop("Failed to find BNO08x IMU, Halting");
    Serial.println(F("Failed to find BNO08x chip"));
    while (1) {
      delay(10); // Infinite loop if the sensor is not found
    }
  }

  // Enable the accelerometer report
  if (!bno08x.enableReport(SH2_ACCELEROMETER)) {
    Serial.println(F("Could not enable accelerometer report"));
    ErrorLEDLoop("Failed to enable the accelerometer, Halting");
  }

  // Initialize SGP30
  if (!sgp.begin()){
    Serial.println(F("SGP30 sensor not found :("));
    while (1);
  }
  Serial.print(F("Found SGP30 serial #"));
  Serial.print(sgp.serialnumber[0], HEX);
  Serial.print(sgp.serialnumber[1], HEX);
  Serial.println(sgp.serialnumber[2], HEX);

  // Initialize BMP3XX
  if (!bmp.begin_I2C()) {   // hardware I2C mode, can pass in address & alt Wire
    ErrorLEDLoop("Failed to find BMP sensor, Halting");
    Serial.println(F("Could not find a valid BMP3XX sensor, check wiring!"));
    while (1);
  }
  
  // Set up oversampling and filter initialization for BMP3XX
  bmp.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
  bmp.setPressureOversampling(BMP3_OVERSAMPLING_4X);
  bmp.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
  bmp.setOutputDataRate(BMP3_ODR_50_HZ);

  Serial.println(F("Sensors initialized successfully."));
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

void loop() {
  unsigned long currentMillis = millis();
  myLog.append(fileName);

  if (currentMillis - lastEnvSensorPoll >= envSensorInterval) {
    lastEnvSensorPoll = currentMillis;

    // Perform BMP3XX reading
    if (!bmp.performReading()) {
      Serial.println("BMP3XX: Failed to perform reading :(");
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

    // Use temperature to adjust SGP30 readings
    float temperature = bmp.temperature; // Assume temperature from BMP3XX is the ambient temperature
    float humidity = 50.0; // Assume a default humidity value, as BMP3XX does not measure humidity
    sgp.setHumidity(getAbsoluteHumidity(temperature, humidity));

    // Perform SGP30 reading
    if (! sgp.IAQmeasure()) {
      ErrorLEDLoop("Failed to read SGP30 sensor, Halting");
      Serial.println(F("SGP30: Measurement failed"));
      return;
    }
    myLog.print(millis()/1000.0);
    myLog.print(" s, ");

    myLog.print("TVOC: ");
    myLog.print(sgp.TVOC);
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
    }
  }

  myLog.syncFile();
}
