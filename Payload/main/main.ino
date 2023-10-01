#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO08x.h>
#include "Adafruit_BME680.h"
#include <Adafruit_GPS.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"

// Define sensor objects
Adafruit_BNO08x bno08x;
Adafruit_BME680 bme;
Adafruit_GPS GPS(&Wire);

// Struct for Euler angles
struct euler_t {
  float yaw;
  float pitch;
  float roll;
} ypr;


//enum for global array indices
enum{
  BNO_YAW = 0,
  BNO_PITCH = 1,
  BNO_ROLL = 2,
  BME_TEMPERATURE = 3,
  BME_PRESSURE = 4,
  BME_HUMIDITY = 5,
  BME_GAS = 6,
  BME_ALTITUDE = 7,
  GPS_HOUR = 8,
  GPS_MINUTE = 9,
  GPS_SECONDS = 10,
  GPS_SPEED = 11,
  GPS_LATITUDE = 12,
  GPS_LONGITUDE = 13,
  GPS_ALTITUDE = 14,
  ENUM_SIZE = 15,
};

//Declaring new global array:
double DATA_COMPONENT_READINGS[ENUM_SIZE];

sh2_SensorValue_t sensorValue;
sh2_SensorId_t reportType = SH2_ARVR_STABILIZED_RV;
long reportIntervalUs = 5000;

// BME680 Settings
#define SEALEVELPRESSURE_HPA (1013.25)

//Timer for GPS
uint32_t timer = millis();

//Create instance for OpenLog
OpenLog logger;

unsigned int flightno = 0;

void setup() {
  flightno++; //iterate flightno for filename

  String filename = "flight" + flightno + ".csv"; //new csv for each flight

  //Open connection to OpenLog
  Wire.begin();
  Wire.setclock(400000);
  logger.begin();
  
  Serial.begin(115200);
  while (!Serial) delay(10);

  // Initialize BNO08x
  if (!bno08x.begin_I2C()) {
    Serial.println("Failed to find BNO08x chip");
    while (1) { delay(10); }
  }

  if (!bno08x.enableReport(reportType, reportIntervalUs)) {
    Serial.println("Could not enable stabilized remote vector");
  }

  // Initialize BME680
  if (!bme.begin()) {
    Serial.println("Could not find a valid BME680 sensor, check wiring!");
    while (1);
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
  if (bno08x.wasReset()) {
    Serial.print("sensor was reset ");
    bno08x.enableReport(reportType, reportIntervalUs);
  }
  
  if (bno08x.getSensorEvent(&sensorValue)) {
    if (sensorValue.sensorId == reportType) {
      quaternionToEulerRV(&sensorValue.un.arvrStabilizedRV, &ypr, true);
      Serial.print("Yaw: "); Serial.print(ypr.yaw);
      DATA_COMPONENT_READINGS[BNO_YAW] = ypr.yaw;
      Serial.print("\tPitch: "); Serial.print(ypr.pitch);
      DATA_COMPONENT_READINGS[BNO_PITCH] = ypr.pitch;
      Serial.print("\tRoll: "); Serial.println(ypr.roll);
      DATA_COMPONENT_READINGS[BNO_ROLL] = ypr.roll
    }
  }
}

// Function to collect data from BME680
void collectDataFromBME() {
  if (bme.performReading()) {
    Serial.print("Temperature = "); Serial.print(bme.temperature); Serial.println(" *C");e
    DATA_COMPONENT_READINGS[BME_TEMPERATURE] = bme.temperature;
    Serial.print("Pressure = "); Serial.print(bme.pressure / 100.0); Serial.println(" hPa");
    DATA_COMPONENT_READINGS[BME_PRESSURE] = bme.pressure;
    Serial.print("Humidity = "); Serial.print(bme.humidity); Serial.println(" %");
    DATA_COMPONENT_READINGS[BME_HUMIDITY] = bme.humidity;
    Serial.print("Gas = "); Serial.print(bme.gas_resistance / 1000.0); Serial.println(" KOhms");
    DATA_COMPONENT_READINGS[BME_GAS] = bme.gas;
    Serial.print("Altitude = "); Serial.print(bme.readAltitude(SEALEVELPRESSURE_HPA)); Serial.println(" m");
    DATA_COMPONENT_READINGS[BME_ALTITUDE] = bme.readAltitude(SEALEVELPRESSURE_HPA);
  } else {
    Serial.println("Failed to perform reading :(");
  }
}

void collectDataFromGPS() {
  char c = GPS.read();
  if (GPS.newNMEAreceived()) {
    if (!GPS.parse(GPS.lastNMEA()))
      Serial.println("erro");
      return;
  }
  
  if (millis() - timer > 2000) {
    timer = millis();
    if (GPS.fix) {
      Serial.print("Time: ");
      Serial.print(GPS.hour, DEC); Serial.print(':');
      DATA_COMPONENT_READINGS[GPS_HOUR] = GPS.hour;
      Serial.print(GPS.minute, DEC); Serial.print(':');
      DATA_COMPONENT_READINGS[GPS_MINUTE] = GPS.minute;
      Serial.print(GPS.seconds, DEC); Serial.println('.');
      DATA_COMPONENT_READINGS[GPS_SECONDS] = GPS.seconds;
      
      Serial.print("Speed (knots): "); Serial.println(GPS.speed);
      DATA_COMPONENT_READINGS[GPS_SPEED] = GPS.speed;

      Serial.print("Location: ");
      Serial.print(GPS.latitude, 4); Serial.print(GPS.lat);
      DATA_COMPONENT_READINGS[GPS_LATITUDE] = GPS.lat;

      Serial.print(", ");
      Serial.print(GPS.longitude, 4); Serial.println(GPS.lon);
      DATA_COMPONENT_READINGS[GPS_LONGITUDE] = GPS.lon;

      Serial.print("GPS Altitude: "); Serial.println(GPS.altitude);
      DATA_COMPONENT_READINGS[GPS_ALTITUDE] = GPS.altitude;
    }
  }
}

  void writeToFile(double *flightdata, unsigned int n) {
      logger.append(filename);
      
      for (int i = 0; i < n; i++) {
        logger.println(flightdata [i] + ","); //log each element of array into cell
      }
      logger.println("\n");

      logger.syncFile();
  }




void loop() {
  collectDataFromBNO();  
  collectDataFromBME();  
  collectDataFromGPS();
  delay(1000);           
}

