#include <Arduino.h>
// This demo explores two reports (SH2_ARVR_STABILIZED_RV and SH2_GYRO_INTEGRATED_RV) both can be used to give 
// quartenion and euler (yaw, pitch roll) angles.  Toggle the FAST_MODE define to see other report.  
// Note sensorValue.status gives calibration accuracy (which improves over time)
#include <Adafruit_BNO08x.h>
#include <BasicLinearAlgebra.h>

// For SPI mode, we need a CS pin
#define BNO08X_CS 10
#define BNO08X_INT 9
#define REPORT_FREQ_US  2500 

struct Measurement {
    /** 
     * UFS NOTE: This struct defines format for data used by
     * this flight software -- but the sampleLoop should use
     * UFS objects to actually sample data and then pack it into
     * this struct
     **/
    float xAccel;
    float yAccel;
    float zAccel;
    float qi;
    float qj;
    float qk;
    float qr;
    float altitude;
    Measurement() {}
    Measurement(float xAcc, float yAcc, float zAcc,float quer, float quei, float quej, float quek, float alt):
        xAccel(xAcc), yAccel(yAcc), zAccel(zAcc),qr(quer),qi(quei), qj(quej),qk(quek), altitude(alt) {}
};

static Measurement currentMeasurement;

BLA::Matrix<3> measuredAccel;

BLA::Matrix<3> inertialAccel;

BLA::Matrix<4> quaternions;

BLA::Matrix<3,3> rotMat;

Adafruit_BNO08x  bno08x(-1);
sh2_SensorValue_t sensorValue;

void setup(void) {

  Serial.begin(115200);
  while (!Serial) delay(10);     // will pause Zero, Leonardo, etc until serial console opens

  Serial.println("Adafruit BNO08x test!");

  // Try to initialize!
  if (!bno08x.begin_I2C()) {
  //if (!bno08x.begin_UART(&Serial1)) {  // Requires a device with > 300 byte UART buffer!
  //if (!bno08x.begin_SPI(BNO08X_CS, BNO08X_INT)) {
    Serial.println("Failed to find BNO08x chip");
    while (1) { delay(10); }
  }
  Serial.println("BNO08x Found!");


  // Initialize accelerometer report
  if(!bno08x.enableReport(SH2_LINEAR_ACCELERATION, REPORT_FREQ_US)){
      Serial.println("NOT OK! Failed to initialize accelerometer");

  }
    // Initialize rotation vector report
  if (!bno08x.enableReport(SH2_ROTATION_VECTOR, REPORT_FREQ_US)) {
      Serial.println("NOT OK! Failed to enable rotation vector");
  }
  Serial.println("OK!");

  Serial.println("Reading events");
  delay(100);
}

double speed = 0.0;
BLA::Matrix<3> velocity = {0.0,0.0,0.0};
double deetee = 1.0/50.0;

long currentTime = micros();
long prevTime = micros();

void loop() {

  if(measureIMU(&currentMeasurement)){

  quaternions = {currentMeasurement.qr,currentMeasurement.qi,currentMeasurement.qj,currentMeasurement.qk};

  measuredAccel = {currentMeasurement.xAccel,
                    currentMeasurement.yAccel,
                    currentMeasurement.zAccel};
  
  getInertialAccel();

  velocity(0) += inertialAccel(0)*deetee;
  velocity(1) += inertialAccel(1)*deetee;
  velocity(2) += inertialAccel(2)*deetee;

  speed = sqrt(sq(velocity(0))+sq(velocity(1))+sq(velocity(2)));

  Serial.print(inertialAccel(0),5);
  Serial.print("   ");
  Serial.print(inertialAccel(1),5);
  Serial.print("   ");
  Serial.print(inertialAccel(2),5);
  Serial.print("   ");
  Serial.print(speed,5);
  Serial.println();


  currentTime = micros();

  // if(currentTime-prevTime > 2600){
  //   Serial.print(currentTime-prevTime);
  //   Serial.print("   ");
  //   Serial.println("SLOW");
  // }

  prevTime = currentTime;
  }

  delayMicroseconds(REPORT_FREQ_US);
  
}

bool measureIMU(Measurement* measure) {

  if (!bno08x.getSensorEvent(&sensorValue)) {
      return false;
  }

  switch (sensorValue.sensorId) {


    case SH2_LINEAR_ACCELERATION:
      measure->xAccel = (float)sensorValue.un.linearAcceleration.x;
      measure->yAccel = (float)sensorValue.un.linearAcceleration.y;
      measure->zAccel = (float)sensorValue.un.linearAcceleration.z;
      break;

    case SH2_ROTATION_VECTOR:
      measure->qi     = (float)sensorValue.un.rotationVector.i;
      measure->qj     = (float)sensorValue.un.rotationVector.j;
      measure->qk     = (float)sensorValue.un.rotationVector.k;
      measure->qr     = (float)sensorValue.un.rotationVector.real;
      break;

  }

    return true;
}

static BLA::Matrix<4> hamiltonProduct(BLA::Matrix<4> q1, BLA::Matrix<4> q2){

  BLA::Matrix<4> returnQuat = {0.0,0.0,0.0,0.0};

  returnQuat(0) = q1(0)*q2(0) - q1(1)*q2(1) - q1(2)*q2(2) - q1(3)*q2(3);
  returnQuat(1) = q1(0)*q2(1) + q1(1)*q2(0) + q1(2)*q2(3) - q1(3)*q2(2);
  returnQuat(2) = q1(0)*q2(2) - q1(1)*q2(3) + q1(2)*q2(0) + q1(3)*q2(1);
  returnQuat(3) = q1(0)*q2(3) + q1(1)*q2(2) - q1(2)*q2(1) + q1(3)*q2(0);

  return returnQuat;
}

void getInertialAccel(){

  BLA::Matrix<4> measuredAccelQ = {0.0,measuredAccel(0),measuredAccel(1),measuredAccel(2)};

  BLA::Matrix<4> quaternionsInv = {quaternions(0),-quaternions(1),-quaternions(2),-quaternions(3)};

  BLA::Matrix<4> inertialAccelQ = hamiltonProduct(hamiltonProduct(quaternions,measuredAccelQ),quaternionsInv);

  inertialAccel(0) = inertialAccelQ(1);
  inertialAccel(1) = inertialAccelQ(2);
  inertialAccel(2) = inertialAccelQ(3);

}


