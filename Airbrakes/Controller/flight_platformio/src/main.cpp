
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
#include <SparkFun_Qwiic_OpenLog_Arduino_Library.h>
#include <Wire.h>

/* GLOBAL DEFINES */
// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 100
#define KALMAN_LOOP_FREQ_PER_SAMPLES 1  // Compute per n=1 samples
#define CONTROL_LOOP_FREQ 20

/* LOCAL INCLUDES */
#include <Measurement.h>
// #include <accelReplace.h>
#include <simulation.h>
#include <kalman.h>

#include <FlightMonitor.h>
#include <FSM.h>
#include <PID_Controller.h>
#include <AdafruitBMP388.h>
#include <AdafruitBNO085.h>

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
#define SRV_MAX_EXTENSION_ANGLE 80
#define SRV_ANGLE_DEG_OFFSET    20

/* STATIC VARIABLES */
// Delta timing variables
static unsigned long currentTime;
static unsigned long previousFilterReset;
static unsigned long previousSampleTime;
static unsigned int  previousComputeWaits; // counter for when compute should occur after n=1 samples
static unsigned long previousControlTime;

static const long sampleLoopMicros  = ONE_SEC_MICROS/SAMPLE_LOOP_FREQ;
static const long computeLoopMicros = KALMAN_LOOP_FREQ_PER_SAMPLES * sampleLoopMicros;
static const long controlLoopMicros = ONE_SEC_MICROS/CONTROL_LOOP_FREQ;

// Flight monitor and sensor objects/variables
static AdafruitBMP388 alt;
static AdafruitBNO085 imu;
static FlightMonitor fm_ace;
static FlightState currentState;
static bool measurementDataValid = true;

// Servo object
static Servo srv;

// PID controller object and global control
static PID_Controller pid(ACE_TARGET_APOGEE);
static double currentPIDControl = 0;

// OpenLog objects/variables
static OpenLog logger;
static String logfile;
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

// Struct for holding current measurement
static Measurement currentMeasurement;

// Debug variables
static int stateVecPrintCounter = 0;
static int counterSample = 0;
static float simSample[2] {0.0, 0.0};

static bool readMeasurement() {
  measurementDataValid = true;

  // Measure Acceleration & Rotation Quat
  if (!imu.measureIMU(&currentMeasurement)) {
    measurementDataValid = false;
  }

  // Measure Altitude
  if (!alt.measureAltitude(&currentMeasurement)) {
    measurementDataValid = false;
  }

  return measurementDataValid;
}

// OpenLog write to functions
#ifdef PORTENTA_H7_M7_PLATFORM
void dumpSDRAMtoFile(String writeto) {
    logger.append(writeto); //open the file in openlog
    
    int writeToIndex;

    if (ringBufferIndex > RING_BUFFER_LENGTH) {
      // Write entire buffer to file
      writeToIndex = RING_BUFFER_LENGTH;
    }
    else {
      // Write up to ringBufferIndex
      writeToIndex = ringBufferIndex;
    }

    for (int i=0; i<writeToIndex; ++i) {
      for (int j=0; j<RING_BUFFER_COLS; ++j) {
        logger.print((float)*(SDRAM_base + i*RING_BUFFER_COLS+j));
      }
      logger.println(); // newline at each row;
    }
  logger.syncFile();  //save changes
}
#endif

int getNumberOfPrevFlights() {
    String filename = "fileNumAB.txt";
    int fileCount = 0;

    // Check if the file exists
    long sizeOfFile = logger.size(filename);
    if (sizeOfFile > -1) {
        #define OPEN_LOG_BUFSIZE 200 // Increase this buffer size to hold larger numbers
        byte openLogBuffer[OPEN_LOG_BUFSIZE];
        logger.read(openLogBuffer, OPEN_LOG_BUFSIZE, filename); // Load openLogBuffer with contents of fileNum.txt

        String counterString = "";
        for (int x = 0; x < OPEN_LOG_BUFSIZE; x++) {
            if (openLogBuffer[x] >= '0' && openLogBuffer[x] <= '9') {
                counterString += (char)openLogBuffer[x];
            }
        }
        fileCount = counterString.toInt();
    }
    fileCount++;

    //overwrite file with new file count
    logger.remove(filename, false);
    logger.append(filename);
    logger.print(String(fileCount));
    logger.syncFile(); // save data

    return fileCount;
}


void setup() {
  Serial.begin(38400);
#if IS_FLIGHT_READY
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
  }
  delay(1000);
  Serial.println("> Initialized Serial comms!");
  Serial.println("\n\n\n\n\n");
  Serial.println("==== NOTE ====");
  Serial.println("THE ACE IS IN DEVELOPMENT MODE - PLEASE CONFIGURE FOR FLIGHT IN IMPORTANT_CONFIG.h");
#endif

#ifdef PORTENTA_H7_M7_PLATFORM
  // Initialize SDRAM
  Serial.print("| Init SDRAM...");
  ram.begin();
  delay(100);
  // ringBuffer = (float(*)[RING_BUFFER_LENGTH])ram.malloc(sizeof(float[RING_BUFFER_LENGTH][RING_BUFFER_COLS]));  // Malloc not currently used
  Serial.println("OK!");
#endif

  // Initialize FSM state
  Serial.print("| Init program state...");
  currentState = FlightState::detectLaunch;
  Serial.println("OK!");

  // Initialize I2C
  Serial.print("| Init I2C wire...");
  // Wire.begin();
  // Wire.setClock(3400000);
  Serial.println("TODO: NOT OK!");

  // Initialize sensor hardware
  alt.init();
  imu.init();
  
  // Attach servo pin to D9 (PWM len min: 900 us, max: 2050us)  // this servo library is trolling us
  Serial.print("| Init servo PWM...");
  srv.attach(9, SRV_MIN_PWM_LEN_MICROS, SRV_MAX_PWM_LEN_MICROS);
  Serial.println("OK!");

  // Initialize vectors/matrices
  Serial.print("| Init Kalman state...");
  initializeKalmanFilter();
  Serial.println("OK!");

  // Initialize OpenLog
  Serial.print("| Init OpenLog...");
  logger.begin();
  logfile = "flight_" + String(getNumberOfPrevFlights()) + "_AB.csv";
  Serial.println("> Writing airbrake data to: " + logfile);
  Serial.println("OK!");

  Serial.println("> Init ACE OK! Starting program...");

  // Update all delta timing timer variables with offset to REAL core loop start time
  delay(1000);
  previousFilterReset = micros();
  previousSampleTime = micros();
  previousComputeWaits = 0;
  previousControlTime = micros();
}


void loop() {
  
  /* SAMPLE LOOP (100Hz) */
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;
    ++previousComputeWaits;

    // Temporary test of simulated OR data
    getSimulatedData(currentTime/1000000.0+15.96, simSample);

    if(counterSample%100==0){
      Serial.print("Interp pos: ");
      Serial.println(simSample[0]);
      Serial.print("Interp acc: ");
      Serial.println(simSample[1]);
    }
    counterSample++;

    readMeasurement();  // Reads all SAMPLE loop sensors
  }

  /* COMPUTE LOOP (per 1 SAMPLEs : 100Hz) */
  if (currentState!=FlightState::landed && previousComputeWaits >= KALMAN_LOOP_FREQ_PER_SAMPLES) {
    previousComputeWaits = 0; // Reset compute counter

    quaternions = {currentMeasurement.qr,currentMeasurement.qi,currentMeasurement.qj,currentMeasurement.qk};
    measuredAccel = {currentMeasurement.xAccel,
                     currentMeasurement.yAccel,
                     currentMeasurement.zAccel};
    getInertialAccel();
    measurementVec = {currentMeasurement.altitude+simSample[0],
                      inertialAccel(0),
                      inertialAccel(1),
                      inertialAccel(2)+simSample[1]};
    //kalman filter steps
    kalmanPredict();

    if(measurementDataValid){
      kalmanUpdate();
    }

    if(stateVecPrintCounter%25==0){
      Serial.print("Statevec: ");
      {
        using namespace BLA;
        Serial << stateVec << "\n";
      }
    }
    stateVecPrintCounter++;

    // Perform SDRAM data saving
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
    
    /* Switch statement for FSM of ACE system modes */
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
        currentState = Flight_FSM::detectLaunchTransition(fm_ace, currentState);
        break;
      case FlightState::burn:
        // Next transition: deceleration detected (motor burnout) --> control
        currentState = Flight_FSM::burnTransition(fm_ace, currentState);
        break;
      case FlightState::control:
        // Next transition: reaching apogee --> stow --> separate --> coast
        currentState = Flight_FSM::controlTransition(fm_ace, currentState);
        break;
      case FlightState::controlStandby:
        // Next transition: re-stabilized --> control
        currentState = Flight_FSM::controlStandbyTransition(fm_ace, currentState);
        break;
      case FlightState::coast:
        // Next transition: z velocity apprx. 0 and altitude is low --> landed
        currentState = Flight_FSM::coastTransition(fm_ace, currentState);
        break;
      case FlightState::landed:
        // Next transition: none, continuously write data to storage
#ifdef PORTENTA_H7_M7_PLATFORM
        if (!didWriteData) {
          dumpSDRAMtoFile(logfile);
          didWriteData = true;
        }
#endif
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
}
