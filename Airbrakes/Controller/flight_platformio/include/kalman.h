#include <BasicLinearAlgebra.h>

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 100
#define KALMAN_LOOP_FREQ_PER_SAMPLES 1  // Compute per n=1 samples
#define CONTROL_LOOP_FREQ 20

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

BLA::Matrix<3> measuredAccel;

BLA::Matrix<3> inertialAccel;

BLA::Matrix<4> quaternions;

BLA::Matrix<4> innovation;

BLA::Matrix<4,4> innovationCov;

BLA::Matrix<9,4> Kkalman;


void initializeKalmanFilter(){
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

void getInertialAccel(){

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

    // Serial.print("INERT ACC VEC: ");
    // Serial.print(inertialAccel(0));
    // Serial.print(" ");
    // Serial.print(inertialAccel(1));
    // Serial.print(" ");
    // Serial.print(inertialAccel(2));
    // Serial.print(" ");
    

}