/* Include file for airbrakes flight monitor capability.*/
#pragma once

#include "AdafruitBNO085.h" // TODO: replace all AdafruitBNO085 instances with generalized BaseIMUComponent later

// Magic number definitions
#define LAUNCH_VELOCITY_THRESHOLD 5.0 // unit: m/s
#define LAUNCH_HEIGHT_THRESHOLD 2.0 // unit: m
#define LANDING_POSITION_THRESHOLD 30.0 // unit: m
#define LANDING_VELOCITY_THRESHOLD 0.1 // unit: m/s

/* Flight Monitor class defines flight stages relevant to airbrakes*/
class FlightMonitor {
private:
    AdafruitBNO085 imu; 
    float stateVecTable[100][9];
    float orientationVec[100][3];
    float avgStateVec[9];
    float predictedApogee;
    void calculateAvgStateVec();
public:
// Constructors
    FlightMonitor(AdafruitBNO085 bno085);
    FlightMonitor(float stateVecs[100][9], float predictedApogee);  // note: revisit this, do we need to pass stateVecs to construct FM?
// Methods
    bool detectedLaunch();
    bool detectedUnpoweredAscent();
    bool detectedApogee();
    bool detectedLanding();
    bool detectedLean();

};