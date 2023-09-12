#include <BasicLinearAlgebra.h>

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 400
#define KALMAN_LOOP_FREQ 100 
#define CONTROL_LOOP_FREQ 1

using namespace BLA;

// Delta timing variables
unsigned long currentTime;
unsigned long previousSampleTime;
unsigned long previousComputeTime;
unsigned long previousControlTime;

const long sampleLoopMicros  = ONE_SEC_MICROS/SAMPLE_LOOP_FREQ;
const long computeLoopMicros = ONE_SEC_MICROS/KALMAN_LOOP_FREQ;
const long controlLoopMicros = ONE_SEC_MICROS/CONTROL_LOOP_FREQ;

// Kalman filter variables
const float kdt          = 1/KALMAN_LOOP_FREQ; //seconds
const float processVar   = pow(0.5,2);
const float altimeterVar = pow(.1,2);
const float accelXVar    = pow(2,2);
const float accelYVar    = pow(2,2);
const float accelZVar    = pow(2,2);

BLA::Matrix<9> stateVec;

BLA::Matrix<9,9> Fkalman;

BLA::Matrix<4,9> Hkalman;

BLA::Matrix<9,9> Pkalman;

BLA::Matrix<9,9> Qkalman;

BLA::Matrix<4,4> Rkalman;

BLA::Matrix<4> measurementVec;

BLA::Matrix<4> innovation;

BLA::Matrix<4,4> innovationCov;

BLA::Matrix<9,4> Kkalman;

// Peripheral helper functions/structs

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
  float altitude;
  Measurement() {}
  Measurement(float xAcc, float yAcc, float zAcc, float alt): 
    xAccel(xAcc), yAccel(yAcc), zAccel(zAcc), altitude(alt) {}
};


struct Measurement makeMeasurement() {
  // TODO: placeholder measurement values
  struct Measurement collectedData(
    .1, .1, 0, 10
  );

  return collectedData;
}

//Struct for holding current measurement
struct Measurement currentMeasurement;

//Finite State Machine Variables and State Transition Functions
enum class FlightState {
  unknown,
  detectLaunch,
  burn,
  control,
  coast,
  landed
};
FlightState currentState;

/**
 * TODO: Implement flight states of ACE FSM.
 *       Refer to "Airbrakes Controller State Machine"
 *       in GDrive
 **/

FlightState detectLaunchTransition() {
  return FlightState::unknown;
}

FlightState burnTransition() {
  return FlightState::unknown;
}

FlightState controlTransition() {
  return FlightState::unknown;
}

FlightState coastTransition() {
  return FlightState::unknown;
}

void setup() {

  Serial.begin(38400);
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
  }

  // prints title with ending line break
  Serial.println(F("Starting program"));
  Serial.println(kdt);

  // Initialize FSM state
  currentState = FlightState::detectLaunch;

  // Initialize vectors/matrices
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

void loop() {
  /* SAMPLE LOOP (400Hz) */
  currentTime = micros();
  if (currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime = currentTime;
    
    /**
     * TODO: 
     *  1. Perform sensor samples here (UFS core)
     *  2. Update sample buffers
     *  3. Pack into static Measurement struct
     **/
    
  }

  /* COMPUTE LOOP (100Hz) */
  currentTime = micros();
  if (currentTime >= previousComputeTime + computeLoopMicros) {

    previousComputeTime = currentTime;

    currentMeasurement = makeMeasurement();

    measurementVec = {currentMeasurement.altitude,
                      currentMeasurement.xAccel,
                      currentMeasurement.yAccel,
                      currentMeasurement.zAccel};

    //kalman filter steps
    stateVec = Fkalman*stateVec;

    Pkalman = Fkalman*(Pkalman*~Fkalman) + Qkalman;

    innovation = measurementVec - Hkalman*stateVec;

    innovationCov = Hkalman*(Pkalman*~Hkalman) + Rkalman;

    //invert matrix inplace for next step
    Invert(innovationCov);

    Kkalman = Pkalman*(~Hkalman*innovationCov);

    stateVec = stateVec + Kkalman*innovation;

    Serial << stateVec <<"\n";

    //switch statement for transition of system modes
    switch(currentState) {
      case FlightState::detectLaunch:
        //if one second has elapsed and not launched, reset kalman filter
        //if conditions met, transition to burn
        currentState = detectLaunchTransition();
        break;
      case FlightState::burn:
        //if rocket is decelerating, transition to control state
        currentState = burnTransition();
        break;
      case FlightState::control:
        //wait until apogee is reached, store airbrakes, transition to coast state
        currentState = controlTransition();
        break;
      case FlightState::coast:
        //if z velocity is very close to zero and altitude is low, then we are landed
        //transition to landed
        currentState = coastTransition();
        break;
      case FlightState::landed:
        //if you have gotten here somehow, wait forever
        break;
      default:
        break;
    }

  }

  /* CONTROL LOOP (xHz) */
  currentTime = micros();
  if (currentTime >= previousControlTime + controlLoopMicros) {
    previousControlTime = currentTime;

    /**
     * TODO: 
     *  1. Read actuation level from CONTROL loop PID controller
     *  2. Send corresponding PWM to servo
     *     a. NOTE: PWM should be set-and-forget to servo, no need
     *        for blocking
     */

  }
}
