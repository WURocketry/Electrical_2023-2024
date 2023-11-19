#include <BasicLinearAlgebra.h>

BLA::Matrix<3> getAccel(BLA::Matrix<9> stateVec);

BLA::Matrix<3> getVel(BLA::Matrix<9> stateVec);

float* getVelArray(BLA::Matrix<9> stateVec);

float* getAccelArray(BLA::Matrix<9> stateVec);