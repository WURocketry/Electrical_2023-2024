#include <BasicLinearAlgebra.h>


using namespace BLA;

//delta timing variables
long currentTime = 0;
long previousTime = 0;
long timeDiff = 0;

long kalmanLoopFreq = 1; //Hz
long kalmanLoopMicros = 1000000/kalmanLoopFreq;

//Kalman filter variables
const float kdt = 1/kalmanLoopFreq; //seconds
const float processVar = pow(0.5,2);
const float altimeterVar = pow(.1,2);
const float accelXVar = pow(2,2);
const float accelYVar = pow(2,2);
const float accelZVar = pow(2,2);

BLA::Matrix<9> stateVec;

BLA::Matrix<9,9> Fkalman;

BLA::Matrix<9,3> Gkalman;

BLA::Matrix<4,9> Hkalman;

BLA::Matrix<9,9> Pkalman;

BLA::Matrix<9,9> Qkalman;

BLA::Matrix<4,4> Rkalman;

BLA::Matrix<4> measurementVec;

BLA::Matrix<4> innovation;

BLA::Matrix<4,4> innovationCov;

BLA::Matrix<9,4> Kkalman;

//helper functions/structs
struct measurement {
  float xAccel;
  float yAccel;
  float zAccel;
  float altitude;
};

struct measurement makeMeasurement(){
  struct measurement collectedData;

  collectedData.xAccel = .1;
  collectedData.yAccel = .1;
  collectedData.zAccel = .1;
  collectedData.altitude = 10;

  return collectedData;
}


void setup() {
  // put your setup code here, to run once:

  Serial.begin(38400);
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
  }

  // prints title with ending line break
  Serial.println("Starting program");

  delay(1000);

  stateVec = {0,0,0,0,0,0,0,0,0};

  Fkalman = {1,0,0,kdt,0,0,1/2*kdt*kdt,0,0,
             0,1,0,0,kdt,0,0,1/2*kdt*kdt,0,
             0,0,1,0,0,kdt,0,0,1/2*kdt*kdt,
             0,0,0,1,0,0,kdt,0,0,
             0,0,0,0,1,0,0,kdt,0,
             0,0,0,0,0,1,0,0,kdt,
             0,0,0,0,0,0,1,0,0,
             0,0,0,0,0,0,0,1,0,
             0,0,0,0,0,0,0,0,1};
  
  Gkalman = {1/2*kdt*kdt,0,0,
             0,1/2*kdt*kdt,0,
             0,0,1/2*kdt*kdt,
             kdt,0,0,
             0,kdt,0,
             0,0,kdt,
             1,0,0,
             0,1,0,
             0,0,1};

  Hkalman = {0,0,1,0,0,0,0,0,0,
             0,0,0,0,0,0,1,0,0,
             0,0,0,0,0,0,0,1,0,
             0,0,0,0,0,0,0,0,1};

  Qkalman = (Gkalman * ~Gkalman);

  //finish creating the Q matrix by multiplying the matrix by the process variation
//   for(int i = 0; i < Qkalman.Rows * Qkalman.Cols; i++){
//     Qkalman(i) = processVar*Qkalman;
//   }

  Qkalman = Qkalman * processVar;
  //Serial <<"Qkalman: "<< Qkalman<<"\n";

  Rkalman = {altimeterVar,0,0,0,
             0,accelXVar,0,0,
             0,0,accelYVar,0,
             0,0,0,accelZVar};

  Pkalman = {10,0,0,0,0,0,0,0,0,
             0,10,0,0,0,0,0,0,0,
             0,0,10,0,0,0,0,0,0,
             0,0,0,10,0,0,0,0,0,
             0,0,0,0,10,0,0,0,0,
             0,0,0,0,0,10,0,0,0,
             0,0,0,0,0,0,10,0,0,
             0,0,0,0,0,0,0,10,0,
             0,0,0,0,0,0,0,0,10};

  measurementVec = {0,0,0,0};

  innovationCov = {0,0,0,0,
                   0,0,0,0,
                   0,0,0,0,
                   0,0,0,0};

  Kkalman = {0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0,
             0,0,0,0};
}

void loop() {
  // put your main code here, to run repeatedly:

  //loop runs at 100 hertz
  currentTime = micros();

  if((currentTime-previousTime)>kalmanLoopMicros){
    timeDiff = currentTime - previousTime-kalmanLoopMicros;
    Serial.println(timeDiff);
    previousTime = currentTime;

    struct measurement current = makeMeasurement();

    measurementVec = {current.altitude,current.xAccel,current.yAccel,current.zAccel};

    //kalman filter steps
    stateVec = Fkalman*stateVec;

    Pkalman = Fkalman*(Pkalman*~Fkalman) + Qkalman;

    innovation = measurementVec - Hkalman*stateVec;

    innovationCov = Hkalman*(Pkalman*~Hkalman) + Rkalman;

    //invert matrix inplace for next step
    Invert(innovationCov);

    Kkalman = Pkalman*(~Hkalman*innovationCov);

    stateVec = stateVec + Kkalman*innovation;

  }

}
