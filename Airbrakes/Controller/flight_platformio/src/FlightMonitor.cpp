/* Source file for airbrakes flight monitor*/

// include class header
#include "FlightMonitor.h"

void FlightMonitor::calculateAvgStateVec()
{
}

FlightMonitor::FlightMonitor(AdafruitBNO085 bno085): imu(bno085)
{
}

FlightMonitor::FlightMonitor(float stateVecs[100][9], float predictedApogee): predictedApogee(predictedApogee)
{
    // TODO: if you really need to pass stateVec array in the constructor, can (maybe) do a std::copy here?
}

bool FlightMonitor::detectedLaunch()
{
    return false;
}

bool FlightMonitor::detectedUnpoweredAscent()
{
    return false;
}

bool FlightMonitor::detectedApogee()
{
    return false;
}

bool FlightMonitor::detectedLanding()
{
    return false;
}

bool FlightMonitor::detectedLean()
{
    return false;
}
