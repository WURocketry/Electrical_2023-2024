#include <BasicLinearAlgebra.h>
#include <Servo.h>

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 400
#define KALMAN_LOOP_FREQ 100 
#define CONTROL_LOOP_FREQ 1


Servo myservo;  
int servoPin = 9; 
float currAngle = 0; // current angle of the servo, using float for finer control
unsigned long previousMillis = 0; // will store last time servo was updated
const long updateInterval = 10; // update interval...

int targetAngle = 0; // Global target 
int totalTime = 2000; // Duration for the servo movement
int totalSteps; // total number of steps to take
int stepsTaken; // number of steps already taken
float stepAngle; // angle per step


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
  if (launchCondition) {
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
  if (noBurnAccelCondition) {
    return FlightState::control;
  }
  
  return currentState;
}

FlightState controlTransition(FlightState currentState) {
  /* Transitions
   * this -> coast
   * this -> burn
   */
  // remain until apogee
  // TODO: determine condition
  if (apogeeReached) {
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
  if (landed) {
    return FlightState::landed;
  }
  return currentState;
}

void setup() {

  Serial.begin(38400);


  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
  }

  myservo.attach(servoPin);  // attach the servo on pin 9
  targetAngle = 0; // Initial target angle
  initializeMovement();

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

void initializeMovement() {
  totalSteps = totalTime / updateInterval; // total number of steps to take
  stepsTaken = 0;
  stepAngle = (float)(targetAngle - currAngle) / totalSteps;
}

void updateServo() {
  unsigned long currentMillis = millis();
  
  if (currentMillis - previousMillis >= updateInterval) {
    previousMillis = currentMillis;
    if (stepsTaken < totalSteps) {
      currAngle += stepAngle;
      myservo.write(round(currAngle));
      Serial.print("Moving to angle: ");
      Serial.println(round(currAngle));
      stepsTaken++;
    } else {
      // Ensure final position is reached
      if (round(currAngle) != targetAngle) {
        currAngle = targetAngle;
        myservo.write(currAngle);
        Serial.print("Final angle: ");
        Serial.println(currAngle);
      }
    }
  }
}

void loop() {

   updateServo();

  //example implementation to toggle the servo between 90 and 0 every three seconds... Obv we wouldn't use it this way but its a good test to have 
  // if (stepsTaken >= totalSteps) {
  //   delay(3000); // wait for a bit
  //   targetAngle = (targetAngle == 0) ? 90 : 0; // Toggle target angle
  //   initializeMovement();
  // }

  /* Switch statement for FSM of ACE system modes */
  switch(currentState) {
    case FlightState::detectLaunch:
      //if one second has elapsed and not launched, reset kalman filter
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

  }

  /* CONTROL LOOP (xHz) */
  currentTime = micros();
  if (currentTime >= previousControlTime + controlLoopMicros) {
    previousControlTime = currentTime;

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