#include "stateVecAPI.h"

// returns a 3x1 acceleration vector
BLA::Matrix<3> getAccel(BLA::Matrix<9> stateVec) {
    float xAccel = stateVec(7);
    float yAccel = stateVec(8);
    float zAccel = stateVec(9);

    //float accelArray[3] = {xAccel, yAccel, zAccel};

    BLA::Matrix<3> accelVector;
    accelVector(0) = xAccel;
    accelVector(1) = yAccel;
    accelVector(2) = zAccel;

    return accelVector;
} 

// returns a 3X1 velocity vector 
BLA::Matrix<3> getVel(BLA::Matrix<9> stateVec) {
    float xVel = stateVec(4);
    float yVel = stateVec(5);
    float zVel = stateVec(6);
    
    BLA::Matrix<3> velVector;
    velVector(0) = xVel;
    velVector(1) = yVel;
    velVector(2) = zVel;

    return velVector;
}

float* getAccelArray(BLA::Matrix<9> stateVec) {
    float xAccel = stateVec(7);
    float yAccel = stateVec(8);
    float zAccel = stateVec(9);

    float* accelArray = new float[3];

    accelArray[0] = xAccel;
    accelArray[1] = yAccel;
    accelArray[2] = zAccel;
    
    return accelArray;
}

float* getVelArray(BLA::Matrix<9> stateVec) {
    float xVel = stateVec(4);
    float yVel = stateVec(5);
    float zVel = stateVec(6);

    float* velArray = new float[3];
    velArray[0] = xVel;
    velArray[1] = yVel;
    velArray[2] = zVel;

    return velArray;
}