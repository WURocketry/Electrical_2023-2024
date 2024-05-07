//
// Courtesy of Wikipedia: https://en.wikipedia.org/wiki/Kalman_filter
//
/* NOTE: A fair number of these variables/functions are globally accessed externally
   in other files...Which is not great, but it was how it was initially prototyped, 
   and is now stuck.

   Refer to `main.cpp` for most of the variable references/uses.
*/

#include <BasicLinearAlgebra.h>

/* Kalman filter variables */
// Step time
const float kdt          = 1/((float)(SAMPLE_LOOP_FREQ/KALMAN_LOOP_FREQ_PER_SAMPLES)); //seconds
const float processVar   = pow(0.8,2);  // process variance
const float altimeterVar = 0.00840866;  // altimeter sensor variance
const float accelXVar    = 0.0003199;   // acceleromater sensor variances (x,y,z)
const float accelYVar    = 0.0003199;
const float accelZVar    = 0.0003199;

// The 9-degree, 3-axis physical state of rocket in
// (x_position, y_position, z_position, x_velocity, y_velocity, z_velocity, x_acceleration, y_acceleration, z_acceleration)
// Note: z_position is altitude, quite important
BLA::Matrix<9> stateVec;

// State transition model
BLA::Matrix<9,9> Fkalman;

// Observation model (chooses which values from state vector readings to use)
BLA::Matrix<4,9> Hkalman;

// Covariance of process noise
BLA::Matrix<9,9> Qkalman;

// Covariance of observation noise
BLA::Matrix<4,4> Rkalman;

// Estimate covariance matrix (measures estimated accuracy of state estimate)
BLA::Matrix<9,9> Pkalman;

// Vector of measurements from sensors (z_position, x_acceleration, y_acceleration, z_acceleration)
// Note: Barometer --> z_pos == altitude, Accelerometer --> 3-axis acceleration
BLA::Matrix<4> measurementVec;

// Difference between observed value and respective predicted (a priori) state estimate values
BLA::Matrix<4> innovation;

// Innovation covariance
BLA::Matrix<4,4> innovationCov;

// Optimal Kalman gain
BLA::Matrix<9,4> Kkalman;


/* Matrices for translating body-frame of IMU to inertial-frame of Earth */
// Vector of acceleration (x,y,z) measured (globally accessed in `main.cpp`)
BLA::Matrix<3> measuredAccel;

// Earth frame acceleration to determine necessary state vector wrt Earth (things like "up" and "down" when we watch the rocket)
BLA::Matrix<3> inertialAccel;

// Temporary vectors for measured quats
BLA::Matrix<4> quaternions;

/* Matrices for tilt detection */
// Vector describing orientation of rocket in Earth inertial-frame (nosecone-pointing)
BLA::Matrix<3> pointVec;


// Method to initialize base values of Kalman filter on start
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


// Predict step
void kalmanPredict(){

    stateVec = Fkalman*stateVec;

    Pkalman = Fkalman*(Pkalman*~Fkalman) + Qkalman;

}


// Update step
void kalmanUpdate(){

    innovation = measurementVec - Hkalman*stateVec;

    innovationCov = Hkalman*(Pkalman*~Hkalman) + Rkalman;

    //invert matrix inplace for next step
    Invert(innovationCov);

    Kkalman = Pkalman*(~Hkalman*innovationCov);

    stateVec = stateVec + Kkalman*innovation;
}


// Used for multiplying quaternions
static BLA::Matrix<4> hamiltonProduct(BLA::Matrix<4> q1, BLA::Matrix<4> q2){

  BLA::Matrix<4> returnQuat = {0.0,0.0,0.0,0.0};

  returnQuat(0) = q1(0)*q2(0) - q1(1)*q2(1) - q1(2)*q2(2) - q1(3)*q2(3);
  returnQuat(1) = q1(0)*q2(1) + q1(1)*q2(0) + q1(2)*q2(3) - q1(3)*q2(2);
  returnQuat(2) = q1(0)*q2(2) - q1(1)*q2(3) + q1(2)*q2(0) + q1(3)*q2(1);
  returnQuat(3) = q1(0)*q2(3) + q1(1)*q2(2) - q1(2)*q2(1) + q1(3)*q2(0);

  return returnQuat;
}


// Get translated body-frame to inertial-frame acceleration from sensor (as mounted in rocket)
void getInertialAccel(){

  BLA::Matrix<4> measuredAccelQ = {0.0,measuredAccel(0),measuredAccel(1),measuredAccel(2)};

  BLA::Matrix<4> quaternionsInv = {quaternions(0),-quaternions(1),-quaternions(2),-quaternions(3)};

  BLA::Matrix<4> inertialAccelQ = hamiltonProduct(hamiltonProduct(quaternions,measuredAccelQ),quaternionsInv);

  // @note: Must subtract 9.8 m/s^2 from z-axis to remove acceleration due to gravity
  inertialAccel(0) = inertialAccelQ(1);
  inertialAccel(1) = inertialAccelQ(2);
  inertialAccel(2) = inertialAccelQ(3) - 9.8; // remove gravity acceleration vector

}


// External helper function for updating rocket's vertical orientation
void getOrientation(){
  // Initial orientation of sensor on rocket (avionics board) wrt inertial earth-frame 
  BLA::Matrix<4> verticalQ = {0.0,-1.0,0.0,0.0}; // NOTE: Set based on the sensors body-frame orientation (printed on the PCB x,y,z axes)

  BLA::Matrix<4> quaternionsInv = {quaternions(0),-quaternions(1),-quaternions(2),-quaternions(3)};
  BLA::Matrix<4> vertTiltQ = hamiltonProduct(hamiltonProduct(quaternions,verticalQ),quaternionsInv);

  // Update global variable
  pointVec(0) = vertTiltQ(1);
  pointVec(1) = vertTiltQ(2);
  pointVec(2) = vertTiltQ(3);
}