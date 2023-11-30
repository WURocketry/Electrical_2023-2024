#include <Arduino.h>
// This demo explores two reports (SH2_ARVR_STABILIZED_RV and SH2_GYRO_INTEGRATED_RV) both can be used to give 
// quartenion and euler (yaw, pitch roll) angles.  Toggle the FAST_MODE define to see other report.  
// Note sensorValue.status gives calibration accuracy (which improves over time)
#include <Adafruit_BNO08x.h>
#include <Adafruit_LIS3DH.h>
#include <Adafruit_Sensor.h>
#include <BasicLinearAlgebra.h>
#include <Wire.h>

// For SPI mode, we need a CS pin
#define BNO08X_CS 10
#define BNO08X_INT 9


#define REPORT_FREQ_US  2500 
#define XAXISACCELBIAS 0
#define YAXISACCELBIAS 0
#define ZAXISACCELBIAS 0

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
Adafruit_LIS3DH lis = Adafruit_LIS3DH();
sh2_SensorValue_t sensorValue;
sensors_event_t AccelEvent;

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

    // Initialize rotation vector report
  if (!bno08x.enableReport(SH2_ROTATION_VECTOR, REPORT_FREQ_US)) {
      Serial.println("NOT OK! Failed to enable rotation vector");
  }
  Serial.println("BNO OK!");

  if (! lis.begin(0x18)) {   // change this to 0x19 for alternative i2c address
    Serial.println("Couldnt start");
    while (1) yield();
  }
  Serial.println("LIS3DH found!");

  lis.setRange(LIS3DH_RANGE_4_G);   // 2, 4, 8 or 16 G!

  Serial.print("Range = "); Serial.print(2 << lis.getRange());
  Serial.println("G");

  // lis.setDataRate(LIS3DH_DATARATE_50_HZ);
  Serial.print("Data rate set to: ");
  switch (lis.getDataRate()) {
    case LIS3DH_DATARATE_1_HZ: Serial.println("1 Hz"); break;
    case LIS3DH_DATARATE_10_HZ: Serial.println("10 Hz"); break;
    case LIS3DH_DATARATE_25_HZ: Serial.println("25 Hz"); break;
    case LIS3DH_DATARATE_50_HZ: Serial.println("50 Hz"); break;
    case LIS3DH_DATARATE_100_HZ: Serial.println("100 Hz"); break;
    case LIS3DH_DATARATE_200_HZ: Serial.println("200 Hz"); break;
    case LIS3DH_DATARATE_400_HZ: Serial.println("400 Hz"); break;

    case LIS3DH_DATARATE_POWERDOWN: Serial.println("Powered Down"); break;
    case LIS3DH_DATARATE_LOWPOWER_5KHZ: Serial.println("5 Khz Low Power"); break;
    case LIS3DH_DATARATE_LOWPOWER_1K6HZ: Serial.println("16 Khz Low Power"); break;
  }

  Wire.setClock(1000000);

  Serial.println("Reading events");
  delay(100);
}

double speed = 0.0;
BLA::Matrix<3> velocity = {0.0,0.0,0.0};
double deetee = 1.0/200.0;

long currentTime = 0;
long prevTime = 0;

bool gotAccel = true;
bool gotIMU = true;

long deltaTiming = 0;

void loop() {

  currentTime = micros();

  if(currentTime-deltaTiming>5000){
    deltaTiming = currentTime;

    gotAccel = measureAccel(&currentMeasurement);
    gotIMU = measureIMU(&currentMeasurement);

    if(gotAccel || gotIMU){

    quaternions = {currentMeasurement.qr,currentMeasurement.qi,currentMeasurement.qj,currentMeasurement.qk};

    measuredAccel = {currentMeasurement.xAccel,
                      currentMeasurement.yAccel,
                      currentMeasurement.zAccel};
    
    getInertialAccel();

    inertialAccel(2) = inertialAccel(2) - 9.81;

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
    Serial.print("   ");
    //Serial.print(micros()-currentTime);
    Serial.println();

    }

  }

  
}

bool measureIMU(Measurement* measure) {

  if (!bno08x.getSensorEvent(&sensorValue)) {
      return false;
  }

  switch (sensorValue.sensorId) {

    case SH2_ROTATION_VECTOR:
      measure->qi     = (float)sensorValue.un.rotationVector.i;
      measure->qj     = (float)sensorValue.un.rotationVector.j;
      measure->qk     = (float)sensorValue.un.rotationVector.k;
      measure->qr     = (float)sensorValue.un.rotationVector.real;
      break;

  }

    return true;
}

bool measureAccel(Measurement* measure) {

  if (!lis.getEvent(&AccelEvent)) {
      return false;
  }
  measure->xAccel     = (float)AccelEvent.acceleration.x+XAXISACCELBIAS;
  measure->yAccel     = (float)AccelEvent.acceleration.y+YAXISACCELBIAS;
  measure->zAccel     = (float)AccelEvent.acceleration.z+ZAXISACCELBIAS;

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

  // BLA::Matrix<4> measuredAccelQ = {0.0,measuredAccel(0),measuredAccel(1),measuredAccel(2)};

  // BLA::Matrix<4> quaternionsInv = {quaternions(0),-quaternions(1),-quaternions(2),-quaternions(3)};

  // BLA::Matrix<4> inertialAccelQ = hamiltonProduct(hamiltonProduct(quaternions,measuredAccelQ),quaternionsInv);
  // //BLA::Matrix<4> inertialAccelQ = hamiltonProduct(hamiltonProduct(quaternionsInv,measuredAccelQ),quaternions);

  // inertialAccel(0) = inertialAccelQ(1);
  // inertialAccel(1) = inertialAccelQ(2);
  // inertialAccel(2) = inertialAccelQ(3);


    rotMat(0,0) = 1 - 2*(pow(quaternions(2),2)+pow(quaternions(3),2));
    rotMat(0,1) = 2*(quaternions(1)*quaternions(2)-quaternions(0)*quaternions(3));
    rotMat(0,2) = 2*(quaternions(1)*quaternions(3)+quaternions(0)*quaternions(2));
    rotMat(1,0) = 2*(quaternions(1)*quaternions(2)+quaternions(0)*quaternions(3));
    rotMat(1,1) = 1 - 2*(pow(quaternions(1),2)+pow(quaternions(3),2));
    rotMat(1,2) = 2*(quaternions(2)*quaternions(3)-quaternions(0)*quaternions(1));
    rotMat(2,0) = 2*(quaternions(1)*quaternions(3)-quaternions(0)*quaternions(2));
    rotMat(2,1) = 2*(quaternions(2)*quaternions(3)+quaternions(0)*quaternions(1));
    rotMat(2,2) = 1 - 2*(pow(quaternions(1),2)+pow(quaternions(2),2));

    // Serial.println(rotMat(1,1));

    inertialAccel = rotMat*measuredAccel;

}





