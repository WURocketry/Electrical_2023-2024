/* Include file for airbrakes flight monitor capability.*/

// Magic number definitions
#define LAUNCH_VELOCITY_THRESHOLD 5.0 // unit: m/s
#define LAUNCH_HEIGHT_THRESHOLD 2.0 // unit: m
#define LANDING_POSITION_THRESHOLD 30.0 // unit: m
#define LANDING_VELOCITY_THRESHOLD 0.1 // unit: m/s

/* Flight Monitor class defines flight stages relevant to airbrakes*/
class FlightMonitor {
    private:
        float stateVecTable[100][9];
        float orientationVec[100][3];
        float avgStateVec[9];
        float predictedApogee;
        void calculateAvgStateVec();
    public:
        FlightMonitor(float stateVecs[100][9], float predictedApogee);
        bool detectedLaunch();
        bool detectedUnpoweredAscent();
        bool detectedApogee();
        bool detectedLanding();
        bool detectedLean();

};