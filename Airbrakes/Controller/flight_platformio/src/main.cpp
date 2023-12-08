/* Library includes */
#include <Arduino.h>
#include <Servo.h>
#include <BasicLinearAlgebra.h>
#include <SparkFun_Qwiic_OpenLog_Arduino_Library.h>
#include <Wire.h>
#include <Arduino.h>
// #include <algorithm>

/* Our includes */
#include <Measurement.h>
#include <accelReplace.h>
#include <simulation.h>
#include <kalman.h>

#include <FlightMonitor.h>
#include <PID_Controller.h>
#include <AdafruitBMP388.h>
#include <AdafruitBNO085.h>

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
  float* SDRAM_base = (float*)0x60000000;  // Base pointer to DRAM start address
#endif

int ringBufferIndex = 0;

// Servo defines
#define SRV_MIN_PWM_LEN_MICROS  900
#define SRV_MAX_PWM_LEN_MICROS  2050
#define SRV_MAX_EXTENSION_ANGLE 80
#define SRV_ANGLE_DEG_OFFSET    20

float currAngle = 0; // current angle of the servo
int targetAngle = 0; 
unsigned long previousServoUpdate = 0; // last time the servo was updated
const long servoUpdateInterval = 10; // update interval for servo in milliseconds (100Hz)


// Target apogee
#define ACE_TARGET_APOGEE 1463.04

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
AdafruitBMP388 alt;
AdafruitBNO085 imu;
FlightMonitor fm_ace;

bool dataValid = true;

// Servo object
Servo srv;

// PID controller object and global control
PID_Controller pid(ACE_TARGET_APOGEE);
double currentPIDControl = 0;

// OpenLog objects/variables
OpenLog logger;
String logfile;
bool didWriteData = false;

//Struct for holding current measurement
static Measurement currentMeasurement;

//variables for AccelReplacement
float timeSinceSaturation = 0.0;
float timeOfSaturation = 0.0;
boolean imuSaturated = false;


bool readMeasurement() {
  dataValid = true;

  // Measure Acceleration & Rotation Quat
  if (!imu.measureIMU(&currentMeasurement)) {
    dataValid = false;
  }

  // Measure Altitude
  if (!alt.measureAltitude(&currentMeasurement)) {
    dataValid = false;
  }

  // Serial.print(currentMeasurement.q0);
  // Serial.print(" ");
  // Serial.print(currentMeasurement.q1);
  // Serial.print(" ");
  // Serial.print(currentMeasurement.q2);
  // Serial.print(" ");
  // Serial.println(currentMeasurement.q3);

  return dataValid;
}

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
        byte myBufferSize = 200; // Increase this buffer size to hold larger numbers
        byte myBuffer[myBufferSize];
        logger.read(myBuffer, myBufferSize, filename); // Load myBuffer with contents of fileNum.txt

        String counterString = "";
        for (int x = 0; x < myBufferSize; x++) {
            if (myBuffer[x] >= '0' && myBuffer[x] <= '9') {
                counterString += (char)myBuffer[x];
            }
        }

        fileCount = counterString.toInt();
    }

    fileCount++;
    
    Serial.println(fileCount);

    //overwrite file with new file count
    logger.remove(filename, false);
    logger.append(filename);
    logger.print(String(fileCount));
    logger.syncFile(); // save data

    return fileCount;
}

// Function to initialize servo movement parameters
void initializeServoMovement(int newTargetAngle) {
  targetAngle = newTargetAngle;
  currAngle = srv.read(); // Read current angle of servo
}

void updateServoPosition() {
  unsigned long currentMillis = micros();
  
  if (currentMillis - previousServoUpdate >= servoUpdateInterval * 1000) { // Convert to microseconds
    previousServoUpdate = currentMillis;

    if (abs(currAngle - targetAngle) > 0.5) { // Only move if there is a significant difference
      float stepAngle = (float)(targetAngle - currAngle) / 10; // Determine step size
      currAngle += stepAngle;
      srv.write(round(currAngle));
    }
  }
}

void setup() {

  Serial.begin(38400);
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
    //TODO REMOVE BEFORE FLIGHT
  }
  initializeServoMovement(0);
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

  // Initialize I2C
  Serial.print("| Init I2C wire...");
  // Wire.begin();
  // Wire.setClock(3400000);
  Serial.println("OK!");

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
  Serial.println("OK!");
  int fileCount = getNumberOfPrevFlights();
  logfile = "flight_" + String(fileCount) + "_AB.csv";
  Serial.println("> Writing airbrake data to: " + logfile);

  Serial.println("> Init ACE OK! Starting program...");
  delay(1000);

  // Update all delta timing timer variables with offset
  previousFilterReset = micros();
  previousSampleTime = micros();
  previousComputeWaits = 0;
  previousControlTime = micros();
}

int stateVecPrintCounter = 0;
int counterSample = 0;
double simSample[2] {0.0, 0.0};

void loop() {
  
  /* SAMPLE LOOP (100Hz) */
  
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;
    ++previousComputeWaits;

    updateServoPosition();

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

    // Serial.print("Performed sample loop at ");
    // Serial.println(currentTime);
  }

  /* COMPUTE LOOP (per 1 SAMPLEs : 100Hz) */
  // If num samples is multiple of 4, i.e. previousSampleTime/sampleLoopMicros % KALMAN_LOOP_FREQ_PER_SAMPLES
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

    // if((measurementVec(3) > 70.0) && (!imuSaturated)){
    //   imuSaturated = true;
    //   timeOfSaturation = micros()/1000000.0;
    // }

    // if(measurementVec(3)>70.0){
    //   timeSinceSaturation = micros()/1000000.0 - timeOfSaturation;
    //   measurementVec(3) = getReplacedAccel(timeSinceSaturation);
    // }

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
#ifdef PORTENTA_H7_M7_PLATFORM
    // Write timestamp data to SDRAM[0]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS)) = (float)currentTime; // Last currentTime should be from sample loops

    // Write stateVec data to SDRAM[1-9]
    for (int i=1; i<RING_BUFFER_COLS-1; ++i) {
        *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + i)) = (float)stateVec(i);
    }

    // Write current control value to SDRAM[10]
    *(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS + 10)) = currentPIDControl;
#endif
    // Serial.print("Wrote to ringBuffer at row ");
    // Serial.println(ringBufferIndex%RING_BUFFER_LENGTH);
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
        // Write data to OpenLog once when landed
#ifdef PORTENTA_H7_M7_PLATFORM
        if (!didWriteData) {
          dumpSDRAMtoFile(logfile);
          didWriteData = true;
        }
#endif
        
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
      int angleExtension = SRV_MAX_EXTENSION_ANGLE * currentPIDControl + 0.5 + SRV_ANGLE_DEG_OFFSET;  // +0.5 to round to nearest whole int
      srv.write(SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET - angleExtension);  // Invert angle control
    }
    
    // Serial.print("Performed control loop with signal ");
    // Serial.println(currentPIDControl);
  }
}
