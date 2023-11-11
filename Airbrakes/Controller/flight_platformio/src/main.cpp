/* Library includes */
#include <Arduino.h>
#include <Servo.h>
#include <BasicLinearAlgebra.h>

/* Our includes */
#include <FlightMonitor.h>
#include <AdafruitBNO085.h>
#include <PID_Controller.h>
// include statement for Altimeter (which will tooootally happen, right? right..?)
#include <simulation.h>
#include <kalman.h>

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 100
#define KALMAN_LOOP_FREQ_PER_SAMPLES 1  // Compute per n=1 samples
#define CONTROL_LOOP_FREQ 20

// Configure ringBuffer for saving airbrakes sensor data
#define RING_BUFFER_COLS 11
#ifdef RP2040_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for RP2040 platform"
  #define RING_BUFFER_LENGTH 4000

  float ringBuffer[RING_BUFFER_LENGTH][RING_BUFFER_COLS]; //contrains time,stateVec, and control value
#elif PORTENTA_H7_M7_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for Portenta_H7 platform"
  #include <SDRAM.h>
  #define RING_BUFFER_LENGTH 30000

  SDRAMClass ram;
  // float (*ringBuffer)[RING_BUFFER_LENGTH]; // Not currently using
#endif
float* SDRAM_base = (float*)0x60000000;  // Base pointer to DRAM start address
int ringBufferIndex = 0;

// Servo defines
#define SRV_MIN_PWM_LEN_MICROS  900
#define SRV_MAX_PWM_LEN_MICROS  2050
#define SRV_MAX_EXTENSION_ANGLE 120

// Target apogee
#define ACE_TARGET_APOGEE 5120

using namespace BLA;

// Delta timing variables
unsigned long currentTime;
unsigned long previousFilterReset;
unsigned long previousSampleTime;
unsigned int  previousComputeWaits; // counter for when compute should occur after n=1 samples
unsigned long previousControlTime;

const long sampleLoopMicros  = ONE_SEC_MICROS/SAMPLE_LOOP_FREQ;
const long computeLoopMicros = KALMAN_LOOP_FREQ_PER_SAMPLES * sampleLoopMicros;
const long controlLoopMicros = ONE_SEC_MICROS/CONTROL_LOOP_FREQ;

// Flight monitor and sensor objects
AdafruitBNO085 adafruit_bno085;
FlightMonitor fm_ace(adafruit_bno085);

bool dataValid = true;

// Servo object
Servo srv;

// PID controller object and global control
PID_Controller pid(ACE_TARGET_APOGEE);
double currentPIDControl = 0;

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
  float q0;
  float q1;
  float q2;
  float q3;
  float altitude;
  Measurement() {}
  Measurement(float xAcc, float yAcc, float zAcc,float que0, float que1, float que2, float que3, float alt): 
    xAccel(xAcc), yAccel(yAcc), zAccel(zAcc),q0(que1),q1(que1), q2(que2),q3(que3), altitude(alt) {}
};

double currentPosition = 0.0;
double currentAcceleration = 0.0;

struct Measurement makeMeasurement() {
  // TODO: placeholder measurement values

  dataValid = true;

  struct Measurement collectedData(
    0.0, 0.0, currentAcceleration,0.0,0.0,0.0,0.0,currentPosition
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
    Serial << "**** TRANSITION TO BURN ****\n";
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
    Serial << "**** TRANSITION TO CONTROL ****\n";
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
    Serial << " **** APOGEE REACHED. TRANSITION TO COAST ****\n";
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
    Serial << " **** APOGEE REACHED. TRANSITION TO COAST ****\n";
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
    Serial << "**** LANDING DETECTED ****\n";
    return FlightState::landed;
  }
  return currentState;
}


void setup() {

  Serial.begin(38400);
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
    //TODO REMOVE FOR FLIGHT
  }
  delay(1000);
  Serial.println("> Initialized Serial comms!");

#ifdef PORTENTA_H7_M7_PLATFORM

  // Initialize SDRAM
  Serial.print("| Init SDRAM...");
  ram.begin();
  delay(100);
  // ringBuffer = (float(*)[RING_BUFFER_LENGTH])ram.malloc(sizeof(float[RING_BUFFER_LENGTH][RING_BUFFER_COLS]));  // Not currently used
  Serial.println("OK!");

#endif
  // Initialize FSM state
  Serial.print("| Init program state...");
  currentState = FlightState::detectLaunch;
  Serial.println("OK!");

  // Attach servo pin to PWM7 (D0 --> PWM len min: 900 us, max: 2050us)
  Serial.print("| Init servo PWM...");
  srv.attach(0, SRV_MIN_PWM_LEN_MICROS, SRV_MAX_PWM_LEN_MICROS);
  Serial.println("OK!");

  // Initialize vectors/matrices
  Serial.print("| Init Kalman state...");

  initializeKalmanFilter();
  
  Serial.println("OK!");

  Serial.println("> Init ACE OK! Starting program...");
  delay(1000);

  // Update all delta timing timer variables with offset
  previousFilterReset = micros();
  previousSampleTime = micros();
  previousComputeWaits = 0;
  previousControlTime = micros();
}

int stateVecPrintCounter = 0;
int counterSample=0;

void loop() {
  
  /* SAMPLE LOOP (100Hz) */
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;
    ++previousComputeWaits;

    // Temporary test of simulated OR data
    double simSample[2];
    getSimulatedData(currentTime/1000000.0+15.96, simSample);

    if(counterSample%100==0){
      Serial.print("Interp pos: ");
      Serial.println(simSample[0]);
      Serial.print("Interp acc: ");
      Serial.println(simSample[1]);
    }
    counterSample++;

    currentPosition = simSample[0];
    currentAcceleration = simSample[1];
    
    /**
     * TODO: 
     *  1. Perform sensor samples here (UFS core)
     *  2. Update sample buffers
     *  3. Pack into static Measurement struct
     **/

    // Serial.print("Performed sample loop at ");
    // Serial.println(currentTime);
  }

  /* COMPUTE LOOP (per 1 SAMPLEs : 100Hz) */
  // If num samples is multiple of 4, i.e. previousSampleTime/sampleLoopMicros % KALMAN_LOOP_FREQ_PER_SAMPLES
  if (currentState!=FlightState::landed && previousComputeWaits >= KALMAN_LOOP_FREQ_PER_SAMPLES) {
    previousComputeWaits = 0; // Reset compute counter

    currentMeasurement = makeMeasurement();

    quaternions = {currentMeasurement.q0,currentMeasurement.q1,currentMeasurement.q2,currentMeasurement.q3};

    measuredAccel = {currentMeasurement.xAccel,
                     currentMeasurement.yAccel,
                     currentMeasurement.zAccel};
    
    getIntertialAccel();

    measurementVec = {currentMeasurement.altitude,
                      intertialAccel(0),
                      intertialAccel(1),
                      intertialAccel(2)};

    //kalman filter steps
    kalmanPredict();

    if(dataValid){

      kalmanUpdate();

    }

    if(stateVecPrintCounter%25==0){
      Serial << stateVec << "\n";

    }
    stateVecPrintCounter++;

    // Perform SDRAM data saving
    // Write timestamp data to SDRAM[0]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS)) = (float)currentTime; // Last currentTime should be from sample loops

    // Write stateVec data to SDRAM[1-9]
    for (int i=1; i<RING_BUFFER_COLS-1; ++i) {
        *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + i)) = (float)stateVec(i);
    }

    // Write current control value to SDRAM[10]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + 10)) = currentPIDControl;

    Serial.print("Wrote to ringBuffer at row ");
    Serial.println(ringBufferIndex%RING_BUFFER_LENGTH);
    ++ringBufferIndex;
    

    /* Switch statement for FSM of ACE system modes */
    switch(currentState) {
      case FlightState::detectLaunch:
        //if one second has elapsed and not launched, reset kalman filter
        currentTime = micros();
        if (currentTime >= previousFilterReset + ONE_SEC_MICROS){
          //Reset kalman filter

          //THIS IS VERY IMPORTANT  
          //if this is not done velocity acts very badly
          Pkalman = {10,0,0,0,0,0,0,0,0,
                    0,10,0,0,0,0,0,0,0,
                    0,0,10,0,0,0,0,0,0,
                    0,0,0,10,0,0,0,0,0,
                    0,0,0,0,10,0,0,0,0,
                    0,0,0,0,0,10,0,0,0,
                    0,0,0,0,0,0,10,0,0,
                    0,0,0,0,0,0,0,10,0,
                    0,0,0,0,0,0,0,0,10};
          
          stateVec = {0,0,0,0,0,0,0,0,0};

          //Clear data logs
          ringBufferIndex = 0;

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
  
    // Serial.print("Performed compute loop at ");
    // Serial.println(currentTime);
  }

  /* CONTROL LOOP (1Hz) */
  currentTime = micros();
  if (currentTime >= previousControlTime + controlLoopMicros) {
    previousControlTime += controlLoopMicros;

    // FAULT-PROTECTION: Stow airbrakes if too far from vertical below a certain altitude
    
    if (currentState==FlightState::control) {
      // Perform PID servo actuation
      // Note: stateVec(2) --> curr_Z_Position, stateVec(5) --> curr_Z_Velocity
      currentPIDControl = pid.control(stateVec(2), stateVec(5));
      int angleExtension = SRV_MAX_EXTENSION_ANGLE * currentPIDControl + 0.5;  // +0.5 to round to nearest whole int
      srv.write(angleExtension);
    }
    else {
      // Keep servo in stowed position if not in control
      srv.write(0);
    }
    
    Serial.print("Performed control loop at ");
    Serial.println(currentTime);
  }
}
