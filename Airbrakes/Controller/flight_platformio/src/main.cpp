/* Library includes */
#include <Arduino.h>
#include <BasicLinearAlgebra.h>

/* Our includes */
#include <FlightMonitor.h>
#include <AdafruitBNO085.h>
// include statement for Altimeter (which will tooootally happen, right? right..?)

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 400
#define KALMAN_LOOP_FREQ_PER_SAMPLES 4  // Compute per n=4 samples
#define CONTROL_LOOP_FREQ 1

using namespace BLA;

// Delta timing variables
unsigned long currentTime;
unsigned long previousFilterReset;
unsigned long previousSampleTime;
unsigned long previousComputeTime;
unsigned long previousControlTime;

const long sampleLoopMicros  = ONE_SEC_MICROS/SAMPLE_LOOP_FREQ;
const long computeLoopMicros = KALMAN_LOOP_FREQ_PER_SAMPLES * sampleLoopMicros;
const long controlLoopMicros = ONE_SEC_MICROS/CONTROL_LOOP_FREQ;

// Kalman filter variables
const float kdt          = 1/((float)(SAMPLE_LOOP_FREQ/KALMAN_LOOP_FREQ_PER_SAMPLES)); //seconds
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

// Flight monitor and sensor variables
AdafruitBNO085 adafruit_bno085;
FlightMonitor fm_ace(adafruit_bno085);

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
  controlStandby,
  coast,
  landed
};
FlightState currentState;

/**
 * TODO: Implement flight states of ACE FSM.
 *       Refer to "Airbrakes Controller State Machine"
 *       in GDrive
 * 
 * NOTE: These functions are state TRANSITIONS and 
 *       do not provide control. 
 **/
FlightState detectLaunchTransition(FlightState currentState) {
  /* Transitions: 
   * this -> burn
   * this -> detectLaunch 
   */

  // remain prior to launch (await launch detection)
  // TODO: determine launchCondition (could be from Kalman)
  if (fm_ace.detectedLaunch()) {
    return FlightState::burn;
  }
  return currentState;
}

FlightState burnTransition(FlightState currentState) {
  /* Transitions:
   * this -> control
   * this -> burn
   */
  // remain until burn acceleration ended
  // TODO: determine condition
  if (fm_ace.detectedUnpoweredAscent()) {
    return FlightState::control;
  }
  
  return currentState;
}

FlightState controlTransition(FlightState currentState) {
  /* Transitions
   * this -> coast
   * this -> burn
   * this -> controlStandby
   */
  // remain until apogee
  // TODO: determine condition
  if (fm_ace.detectedApogee()) {
    return FlightState::coast;
  }
  if (fm_ace.detectedLean()) {
    return FlightState::controlStandby;
  }

  return currentState;
}

FlightState controlStandbyTransition(FlightState currentState) {
  /* Transitions
   * this -> coast
   * this -> control
   */
  // remain until safe control conditions (implement eventually)
  // TODO: determine condition
  // if (minimalLean) {
  //   return FlightState::control;
  // }
  if (fm_ace.detectedApogee()) {
    return FlightState::coast;
  }
  return currentState;
}

FlightState coastTransition(FlightState currentState) {
  /* Transitions:
   * this -> landed
   * this -> coast
   */
  
  // remain until landing
  // TOOD: determine condition
  if (fm_ace.detectedLanding()) {
    return FlightState::landed;
  }
  return currentState;
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

  // Initialize delta timing variables
  previousFilterReset = 0;
  previousSampleTime = 0;
  previousComputeTime = 0;
  previousControlTime = 0;

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
  currentTime = micros();
  /* Switch statement for FSM of ACE system modes */
  switch(currentState) {
    case FlightState::detectLaunch:
      //if one second has elapsed and not launched, reset kalman filter
      if (currentTime >= previousFilterReset + ONE_SEC_MICROS){
        //Reset kalman filter
        //Clear data logs
        previousFilterReset = currentTime;
      }
      //if conditions met, transition to burn
      currentState = detectLaunchTransition(currentState);
      break;
    case FlightState::burn:
      //if rocket is decelerating, transition to control state
      currentState = burnTransition(currentState);
      break;
    case FlightState::control:
      //wait until apogee is reached, store airbrakes, transition to coast state
      currentState = controlTransition(currentState);
      break;
    case FlightState::controlStandby:
      //wait until rocket reverts to stable conditions, continue airbrake control
      currentState = controlStandbyTransition(currentState);
      break;
    case FlightState::coast:
      //if z velocity is very close to zero and altitude is low, then we are landed
      //transition to landed
      currentState = coastTransition(currentState);
      break;
    case FlightState::landed:
      //if you have gotten here wait forever
      break;
    default:
      // should not reach this state
      break;
  }
  
  /* SAMPLE LOOP (400Hz) */
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;
    
    /**
     * TODO: 
     *  1. Perform sensor samples here (UFS core)
     *  2. Update sample buffers
     *  3. Pack into static Measurement struct
     **/
    
  }

  /* COMPUTE LOOP (per 4 SAMPLEs) */
  currentTime = micros();
  // If no. samples is multiple of 4, i.e. previousSampleTime/sampleLoopMicros % KALMAN_LOOP_FREQ_PER_SAMPLES
  if (currentState!=FlightState::landed && previousSampleTime % computeLoopMicros == 0) {

    previousComputeTime += computeLoopMicros;

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

  }

  /* CONTROL LOOP (xHz) */
  currentTime = micros();
  if (currentState==FlightState::control && currentTime >= previousControlTime + controlLoopMicros) {
    previousControlTime += controlLoopMicros;
    // TODO: Stow airbrakes if too far from vertical below a certain altitude
    /**
     * TODO: 
     *  1. Obtain current altitude and current velocity (prediction from 
     *     K-filter)
     *  2. Index into VLT for target velocity
     *  2. Perform PID control to match current velocity to target velocity 
     *     over timesteps
     *  3. Send corresponding PWM to servo
     *     a. NOTE: PWM should be capable of set-and-forget, this loop should
     *        not be blocking
     */

  }
}
