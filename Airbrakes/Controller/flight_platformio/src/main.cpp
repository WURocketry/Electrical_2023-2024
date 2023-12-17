
// Note: Important to keep order of includes correct to maintain consistent linking
// 1. External 3rd party library includes
// 2. Global definitions (may be used across our project)
// 3. Local includes
// 4. Local defines (used only in main.cpp)
// 5. Static variables


/* LIBRARY INCLUDES */
#include <Arduino.h>
#include <BasicLinearAlgebra.h>
#include <Servo.h>
#include <Wire.h>

/* GLOBAL DEFINES */
// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 50 // Sample loop freq in Hz
#define KALMAN_LOOP_FREQ_PER_SAMPLES 1  // Compute per n=1 samples
#define CONTROL_LOOP_FREQ 20  // Control loop freq in Hz

/* LOCAL INCLUDES */
#include <Measurement.h>
// #include <accelReplace.h>  // Not using saturated IMU sim
#include <simulation.h>
#include <kalman.h>

#include <FlightMonitor.h>
#include <FSM.h>
#include <PID_Controller.h>
#include <AdafruitBMP388.h>
#include <AdafruitBNO085.h>
#include <AdafruitADXL345.h>
#include <SparkFunOpenLog.h>

/**********************************************
 *** CHECK CONFIG CONSTANTS PRIOR TO LAUNCH ***
 **********************************************/
#include <IMPORTANT_CONFIG.h>
/**********************************************
 **********************************************/

/* LOCAL DEFINES */
// Servo defines
#define SRV_MIN_PWM_LEN_MICROS  900
#define SRV_MAX_PWM_LEN_MICROS  2050
#define SRV_MAX_EXTENSION_ANGLE 80    // Defines MAX from 0 -> MAX (is absolute, without offset)
#define SRV_ANGLE_DEG_OFFSET    20

/* STATIC VARIABLES */
// Delta timing variables
static unsigned long currentTime;
static unsigned long previousFilterReset;
static unsigned long previousSampleTime;
static unsigned int  previousComputeCounts; // counter for when compute should occur after n=1 samples
static unsigned long previousControlTime;

static const long sampleLoopMicros  = ONE_SEC_MICROS/SAMPLE_LOOP_FREQ;
// @note: DEPRECATED - compute loop is determined by counter instead of sample loop micros (previousComputeCounts)
// static const long computeLoopMicros = KALMAN_LOOP_FREQ_PER_SAMPLES * sampleLoopMicros;
static const long controlLoopMicros = ONE_SEC_MICROS/CONTROL_LOOP_FREQ;

// Flight monitor and sensor objects/variables
static AdafruitBMP388 alt_sensor;
static AdafruitBNO085 imu_sensor;
static AdafruitADXL345 acc_sensor;
static FlightMonitor fm_ace;
static FlightState currentState;
static bool measurementDataValid;
static Sample::Measurement currentMeasurement;  // Struct for holding current measurement

// Servo object
static Servo srv;

// PID controller object and global control
static PID_Controller pid(ACE_TARGET_APOGEE);
static double currentPIDControl = 0;

// OpenLog objects/variables
static SparkFunOpenLog logger;
static bool didWriteData = false;

// SDRAM configuration
#define RING_BUFFER_COLS 11
#ifdef RP2040_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for RP2040 platform"
  #define RING_BUFFER_LENGTH 4000

  static float ringBuffer[RING_BUFFER_LENGTH][RING_BUFFER_COLS]; //contrains time,stateVec, and control value
#elif PORTENTA_H7_M7_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for Portenta_H7 platform"
  #include <SDRAM.h>
  #define RING_BUFFER_LENGTH 30000

  static SDRAMClass ram;
  // float (*ringBuffer)[RING_BUFFER_LENGTH]; // Not currently using
  static float* SDRAM_base = (float*)0x60000000;  // Base pointer to DRAM start address
#endif
static int ringBufferIndex = 0;

// Debug variables
static int stateVecPrintCounter = 0;
static int counterSample = 0;
static float simSample[2] {0.0, 0.0};


void setup() {
  int aceInitFails = 0;
  Serial.begin(38400);

#if IS_DEVELOPMENT_MODE
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
  }
  delay(1000);
  Serial.println("> Initialized Serial comms!");
  Serial.println("\n\n\n\n\n\n\n");
  Serial.println("==== NOTE ====");
  Serial.println("THE ACE IS IN DEVELOPMENT MODE - PLEASE CONFIGURE FOR FLIGHT IN IMPORTANT_CONFIG.h");
  Serial.println("\n\n\n\n\n\n\n");
#endif

#ifdef PORTENTA_H7_M7_PLATFORM
  // Initialize SDRAM
  Serial.print("| Init SDRAM...");
  if (!ram.begin()) {
    ++aceInitFails;
    Serial.println("NOT OK!");
  } else {
    delay(100);
    Serial.println("OK!");
  }

#endif

  // Initialize FSM state
  Serial.print("| Init program state...");
  currentState = FlightState::detectLaunch;
  Serial.println("OK!");

  // Initialize sensor hardware
  if (!imu_sensor.init()) {
    ++aceInitFails;
  }
  if (!alt_sensor.init()) {
    ++aceInitFails;
  }
  if (!acc_sensor.init()) {
    ++aceInitFails;
  }
  
  // Attach servo pin to D9 (PWM len min: 900 us, max: 2050us)  // this servo library is trolling us
  Serial.print("| Init servo PWM...");
  if (!srv.attach(9, SRV_MIN_PWM_LEN_MICROS, SRV_MAX_PWM_LEN_MICROS)) {
    ++aceInitFails;
    Serial.println("NOT OK!");
  } else {
    Serial.println("OK!");
#if DO_SERVO_ACTUATE_INIT_CHECK
    Serial.println("> Notice: Performing servo actuation status check in 5 seconds...");
    delay(5000);

    Serial.print("> Extending to SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET: ");
    Serial.print(SRV_MAX_EXTENSION_ANGLE);
    Serial.print(" + ");
    Serial.println(SRV_ANGLE_DEG_OFFSET);
    delay(500);
    srv.write(SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET);
    delay(1000);

    Serial.println("> Retracting to SRV_ANGLE_DEG_OFFSET: ");
    delay(500);
    srv.write(SRV_ANGLE_DEG_OFFSET);
#endif
  }

  // Initialize vectors/matrices
  Serial.print("| Init Kalman state...");
  if (!initializeKalmanFilter()) {
    ++aceInitFails;
    Serial.println("NOT OK!");
  } else {
    Serial.println("OK!");
  }

  // Initialize OpenLog
  if (!logger.init()) {
    ++aceInitFails;
  }

  // ACE initialization summary status check
  if (!aceInitFails) {
    Serial.println("> Init ACE OK! Starting program...");
  } else {
    Serial.println("\n\n\n");
    Serial.print("WARNING: ACE did not initialize successfully! There were ");
    Serial.print(aceInitFails);
    Serial.println(" fails!");
    Serial.println("> Refer to above output to view failures...");
#if CHECK_STRICT_INITIALIZATION
    for ( ; ; ); // Spin infinitely on failed init
#endif
    Serial.println("\n\n\n!!! WARNING: ACE IS CONTINUING WITH FAILED INITIALIZATIONS !!!!\n");
  }
  delay(5000);

  // Update all delta timing timer variables with offset to REAL core loop start time
  previousComputeCounts = 0;
  previousFilterReset = micros();
  previousSampleTime = micros();
  previousControlTime = micros();
}


void loop() {
  
  /* SAMPLE LOOP (50Hz) */
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;
    ++previousComputeCounts;

    // Temporary test of simulated OR data
    getSimulatedData(currentTime/1000000.0+15.96, simSample);

    if(counterSample%100==0){
      Serial.print("Interp pos: ");
      Serial.println(simSample[0]);
      Serial.print("Interp acc: ");
      Serial.println(simSample[1]);
    }
    counterSample++;

    measurementDataValid = readMeasurement(&currentMeasurement, imu_sensor, alt_sensor, acc_sensor);  // Reads all SAMPLE loop sensors
  }

  /* COMPUTE LOOP (per 1 SAMPLEs : 50Hz) */
  if (currentState!=FlightState::landed && previousComputeCounts >= KALMAN_LOOP_FREQ_PER_SAMPLES) {
    previousComputeCounts = 0; // Reset compute counter

    /* Acceleration transformation (to Earth frame) */
    quaternions = {currentMeasurement.qr,currentMeasurement.qi,currentMeasurement.qj,currentMeasurement.qk};
    measuredAccel = {currentMeasurement.xAccel,
                     currentMeasurement.yAccel,
                     currentMeasurement.zAccel};
    getInertialAccel(); // Transforms acceleration
    measurementVec = {currentMeasurement.altitude + simSample[0],
                      inertialAccel(0),
                      inertialAccel(1),
                      inertialAccel(2) + simSample[1]};

    /* Kalman filter */
    kalmanPredict();
    if(measurementDataValid){
      kalmanUpdate();
    }
    if(stateVecPrintCounter%25==0){
      Serial.print("FLIGHT STATE: ");
      Serial.println((int)currentState);
      Serial.print("Statevec: ");
      {
        using namespace BLA;
        Serial << stateVec << "\n";
      }
    }
    stateVecPrintCounter++;

    /* SDRAM data logging */
#ifdef PORTENTA_H7_M7_PLATFORM
    // Write timestamp data to SDRAM[0]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS)) = (float)currentTime; // Last currentTime should be from sample loops

    // Write stateVec data to SDRAM[1-9]
    for (int i=1; i<RING_BUFFER_COLS-1; ++i) {
        *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + i)) = (float)stateVec(i-1); // i-1 to write from beginning of stateVec
    }

    // Write current control value to SDRAM[10]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + 10)) = currentPIDControl;
#endif
    ++ringBufferIndex;
    
    /* FSM transition */
    switch(currentState) {
      case FlightState::detectLaunch:
        currentTime = micros();
        if (currentTime >= previousFilterReset + ONE_SEC_MICROS){
          // If one second has elapsed and not launched, reset kalman filter

          // THIS RESET IS VERY IMPORTANT: ensures velocity behaves well
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

          // Clear data logs
          ringBufferIndex = 0;
          previousFilterReset = currentTime;
        }
        // Next transition: acceleration detected (motor burn) --> burn
        currentState = Flight_FSM::detectLaunchTransition(&fm_ace, currentState);
        break;
      case FlightState::burn:
        // Next transition: deceleration detected (motor burnout) --> control
        currentState = Flight_FSM::burnTransition(&fm_ace, currentState);
        break;
      case FlightState::control:
        // Next transition: reaching apogee --> stow --> separate --> coast
        currentState = Flight_FSM::controlTransition(&fm_ace, currentState);
        break;
      case FlightState::controlStandby:
        // Next transition: re-stabilized --> control
        currentState = Flight_FSM::controlStandbyTransition(&fm_ace, currentState);
        break;
      case FlightState::coast:
        // Next transition: z velocity apprx. 0 and altitude is low --> landed
        currentState = Flight_FSM::coastTransition(&fm_ace, currentState);
        break;
      case FlightState::landed:
        // Next transition: none, continuously write data to storage
        break;
      default:
        // Error state
        Serial.println("FATAL-ERROR: FSM reached unknown state, resetting to standby");
        currentState = FlightState::controlStandby;
        break;
    }
  }

  /* CONTROL LOOP (1Hz) */
  currentTime = micros();
  if (currentTime >= previousControlTime + controlLoopMicros) {
    previousControlTime += controlLoopMicros;
    
    if (currentState==FlightState::control) {
      // Perform PID servo actuation
      // Note: stateVec(2) --> curr_Z_Position, stateVec(5) --> curr_Z_Velocity
      currentPIDControl = pid.control(stateVec(2), stateVec(5));
      int angleExtension = SRV_MAX_EXTENSION_ANGLE * currentPIDControl + 0.5 + SRV_ANGLE_DEG_OFFSET;  // +0.5 to round to nearest whole int
      srv.write(SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET - angleExtension);  // Invert angle control
    }
  }

  /* POST-FLIGHT PROCEDURE */
  if (currentState == FlightState::landed) {
  // Dump data upon landing
#ifdef PORTENTA_H7_M7_PLATFORM
        if (!didWriteData && logger.didInit) {
          Serial.print("Dumping data to OpenLog...");
          logger.dumpSDRAMtoFile(SDRAM_base, ringBufferIndex, RING_BUFFER_LENGTH, RING_BUFFER_COLS);
          didWriteData = true;
          Serial.println("OK!");
        }
#endif

    // ACE completed
    Serial.println("ACE completed! Sleeping...");
    for ( ; ; );
  }
}
