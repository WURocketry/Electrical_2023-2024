/* Library includes */
#include <BasicLinearAlgebra.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
#include <Wire.h>
#include <Arduino.h>
#include <algorithm>

/* Our includes */
#include <FlightMonitor.h>
#include <AdafruitBNO085.h>
// include statement for Altimeter (which will tooootally happen, right? right..?)
#include <simulation.h>

// Loop rates (Hz)
#define ONE_SEC_MICROS 1000000
#define SAMPLE_LOOP_FREQ 400
#define KALMAN_LOOP_FREQ_PER_SAMPLES 4  // Compute per n=4 samples
#define CONTROL_LOOP_FREQ 1

// Configure ringBuffer for saving airbrakes sensor data
#ifdef RP2040_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for RP2040 platform"
  #define RING_BUFFER_LENGTH 4000
  float ringBuffer[RING_BUFFER_LENGTH][11]; //contrains time,stateVec, and control value
  int ringBufferIndex = 0;

#elif PORTENTA_H7_M7_PLATFORM
  #warning "CONFIG: Configuring ringBuffer for Portenta_H7 platform"
  #include <SDRAM.h>
  #define RING_BUFFER_LENGTH 12000

  SDRAMClass ram;
  float (*ringBuffer)[11] = (float (*)[11])ram.malloc(sizeof(float[RING_BUFFER_LENGTH][11]));
  int ringBufferIndex = 0;
#endif

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
const float accelXVar    = pow(1,2);
const float accelYVar    = pow(1,2);
const float accelZVar    = pow(1,2);

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

// OpenLog objects/variables
OpenLog logger;
String logfile;
bool writedata = true;

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

double currentPosition = 0.0;
double currentAcceleration = 0.0;

struct Measurement makeMeasurement() {
  // TODO: placeholder measurement values
  struct Measurement collectedData(
    0.0, 0.0, currentAcceleration, currentPosition
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

// OpenLog write to functions
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


void setup() {

  Serial.begin(38400);
  while (!Serial) {
    ;  // wait for serial port to connect. Needed for native USB port only
    //TODO REMOVE FOR FLIGHT
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

  Wire.begin();
  logger.begin();
  
  int fileCount = getNumberOfPrevFlights();
  logfile = "flight_" + String(fileCount) + "_AB.csv";
  Serial.println("Writing airbrake data to: " + logfile);

}

int counter = 0;
int counterSample=0;

void loop() {
  currentTime = micros();
  
  /* SAMPLE LOOP (400Hz) */
  currentTime = micros();
  if (currentState!=FlightState::landed && currentTime >= previousSampleTime + sampleLoopMicros) {
    previousSampleTime += sampleLoopMicros;

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

    if(counter%25==0){
      Serial << stateVec << "\n";

    }
    counter++;

    //write new information to ringBuffer
    ringBuffer[ringBufferIndex%RING_BUFFER_LENGTH][0] = micros()/1000000.0;
    for(int iter = 1; iter<10;iter++){
      ringBuffer[ringBufferIndex%RING_BUFFER_LENGTH][iter] = stateVec(iter-1);
    }

    //TODO add current value of control to eleventh element of the array

    ringBufferIndex++;

    /* Switch statement for FSM of ACE system modes */
    switch(currentState) {
      case FlightState::detectLaunch:
        //if one second has elapsed and not launched, reset kalman filter
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

  if ((currentState == FlightState::landed) && writedata) {
    dumpSDRAMtoFile(logfile);

    writedata = false;  // write data only once
  }
}
