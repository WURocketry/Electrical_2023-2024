#include <BasicLinearAlgebra.h>

// Kalman filter variables
const float kdt          = 1/((float)(SAMPLE_LOOP_FREQ/KALMAN_LOOP_FREQ_PER_SAMPLES)); //seconds
const float processVar   = pow(0.8,2);
const float altimeterVar = 0.00840866;
const float accelXVar    = 0.0003199;
const float accelYVar    = 0.0003199;
const float accelZVar    = 0.0003199;

BLA::Matrix<9> stateVec;

BLA::Matrix<9,9> Fkalman;

BLA::Matrix<4,9> Hkalman;

BLA::Matrix<9,9> Pkalman;

BLA::Matrix<9,9> Qkalman;

BLA::Matrix<4,4> Rkalman;

BLA::Matrix<4> measurementVec;

BLA::Matrix<3,3> rotMat;

BLA::Matrix<3> pointVec;

BLA::Matrix<3> measuredAccel;

BLA::Matrix<3> inertialAccel;

BLA::Matrix<4> quaternions;

BLA::Matrix<4> innovation;

BLA::Matrix<4,4> innovationCov;

BLA::Matrix<9,4> Kkalman;


bool initializeKalmanFilter(){
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

  Hkalman = {0,0,1,0,0,0,0,0,0,
            0,0,0,0,0,0,1,0,0,
            0,0,0,0,0,0,0,1,0,
            0,0,0,0,0,0,0,0,1};

  Qkalman = {processVar*pow(kdt,4)/4,0,0,processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2)/2,0,0,
            0,processVar*pow(kdt,4)/4,0,0,processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2)/2,0,
            0,0,processVar*pow(kdt,4)/4,0,0,processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2)/2,
            processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2),0,0,processVar*kdt,0,0,
            0,processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2),0,0,processVar*kdt,0,
            0,0,processVar*pow(kdt,3)/2,0,0,processVar*pow(kdt,2),0,0,processVar*kdt,
            processVar*pow(kdt,2)/2,0,0,processVar*kdt,0,0,processVar,0,0,
            0,processVar*pow(kdt,2)/2,0,0,processVar*kdt,0,0,processVar,0,
            0,0,processVar*pow(kdt,2)/2,0,0,processVar*kdt,0,0,processVar};

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
            
  return true;
}

void kalmanPredict(){

    stateVec = Fkalman*stateVec;

    Pkalman = Fkalman*(Pkalman*~Fkalman) + Qkalman;

}

void kalmanUpdate(){

    innovation = measurementVec - Hkalman*stateVec;

    innovationCov = Hkalman*(Pkalman*~Hkalman) + Rkalman;

    //invert matrix inplace for next step
    Invert(innovationCov);

    Kkalman = Pkalman*(~Hkalman*innovationCov);

    stateVec = stateVec + Kkalman*innovation;
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

  // @note: Must subtract 9.8 m/s^2 from z-axis to remove acceleration due to gravity
  inertialAccel(0) = inertialAccelQ(1);
  inertialAccel(1) = inertialAccelQ(2);
  inertialAccel(2) = inertialAccelQ(3) - 9.8; // remove gravity vector

}

void getOrientation(){
  BLA::Matrix<4> verticalQ = {0.0,-1.0,0.0,0.0}; // NOTE: Depends on initial orientation of the sensor in the rocket.

  BLA::Matrix<4> quaternionsInv = {quaternions(0),-quaternions(1),-quaternions(2),-quaternions(3)};
  BLA::Matrix<4> vertTiltQ = hamiltonProduct(hamiltonProduct(quaternions,verticalQ),quaternionsInv);

  pointVec(0) = vertTiltQ(1);
  pointVec(1) = vertTiltQ(2);
  pointVec(2) = vertTiltQ(3);

}