/* Include file for airbrakes flight monitor capability.*/
#pragma once

#include <BasicLinearAlgebra.h>
#include "AdafruitBNO085.h" // TODO: replace all AdafruitBNO085 instances with generalized BaseIMUComponent later

// Magic number definitions
#define LAUNCH_VELOCITY_THRESHOLD 5.0 // unit: m/s
#define LAUNCH_HEIGHT_THRESHOLD 2.0 // unit: m
#define APOGEE_ALTITUDE_THRESHOLD 1200.0 //unit: m
#define APOGEE_VELOCITY_THRESHOLD 10.0 //unit: m/s
#define LANDING_ALTITUDE_THRESHOLD 10 //units: m
#define LANDING_VELOCITY_THRESHOLD -10 //unit: m/s (negative because rocket is falling down)

// number of required rsequential observations to transition
#define LAUNCH_PERSISTENCE 10
#define BURNOUT_PERSISTENCE 10
#define APOGEE_PERSISTENCE 10
#define LANDING_PERSISTENCE 50

extern BLA::Matrix<9> stateVec;

/* Flight Monitor class defines flight stages relevant to airbrakes*/
class FlightMonitor {
private:
    AdafruitBNO085 imu; 
    int launchCounts; //holds number of sequential observations of met launch conditons
    int burnoutCounts; //hold number of sequential observations of motor burn out
    int apogeeCounts; //hold number of sequential observations of reaching apogee 
    int landingCounts;
public:
// Constructors
    FlightMonitor(AdafruitBNO085 imu);
    FlightMonitor(); 
// Methods
    bool detectedLaunch();
    bool detectedUnpoweredAscent();
    bool detectedApogee();
    bool detectedLanding();
    bool detectedLean();

};