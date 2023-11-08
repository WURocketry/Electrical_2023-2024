#include "stateVecAPI.h"

//returns the x velocity
float getVecocity(BLA::Matrix<9> stateVec) {
    return stateVec(4);
}

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