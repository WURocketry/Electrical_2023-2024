/* Include file for airbrakes flight monitor capability.*/
#pragma once

#include <BasicLinearAlgebra.h>

// Magic number definitions
#define LAUNCH_VELOCITY_THRESHOLD 5.0       // unit: m/s
#define LAUNCH_HEIGHT_THRESHOLD 2.0         // unit: m
// #define APOGEE_ALTITUDE_THRESHOLD 1200.0    // unit: m  DEPRECATED
#define APOGEE_VELOCITY_THRESHOLD 10.0      // unit: m/s
#define LANDING_ALTITUDE_THRESHOLD 10       // unit: m
#define LANDING_VELOCITY_THRESHOLD -40      // unit: m/s (negative because rocket is falling down) - problem with kalman filter (doesn't like landings)
#define TILT_THRESHOLD 0.35 // unit: radians

// number of required sequential observations to transition
#define LAUNCH_PERSISTENCE 10
#define BURNOUT_PERSISTENCE 10
#define APOGEE_PERSISTENCE 10
#define LANDING_PERSISTENCE 50
#define TILT_PERSISTENCE 20

extern BLA::Matrix<9> stateVec;

/* Flight Monitor class provides underlying logic for FSM flight stage transitions */
class FlightMonitor {
private:
    int launchCounts;   // holds number of sequential observations of met launch conditons
    int burnoutCounts;  // holds number of sequential observations of motor burn out
    int apogeeCounts;   // holds number of sequential observations of reaching apogee 
    int landingCounts;
    int tiltCounts;
public:
// Constructors
    FlightMonitor(); 
// Methods
    bool detectedLaunch();
    bool detectedUnpoweredAscent();
    bool detectedApogee();
    bool detectedLanding();
    bool detectedLean();
};