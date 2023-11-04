/* Source file for airbrakes flight monitor*/

// include class header
#include "FlightMonitor.h"
#include <BasicLinearAlgebra.h>

extern BLA::Matrix<9> stateVec;

FlightMonitor::FlightMonitor(AdafruitBNO085 bno085): imu(bno085)
{
}

FlightMonitor::FlightMonitor()
{

    launchCounts = 0;
    burnoutCounts = 0;
    apogeeCounts = 0;
    landingCounts = 0;
}

bool FlightMonitor::detectedLaunch()
{

    if((stateVec(2)>LAUNCH_HEIGHT_THRESHOLD)&&(stateVec(5)>LAUNCH_VELOCITY_THRESHOLD)){
        launchCounts++;
    }else{
        launchCounts = 0;
    }

    if(launchCounts>=LAUNCH_PERSISTENCE){
        return true;
    }else{
        return false;
    }

}

bool FlightMonitor::detectedUnpoweredAscent()
{

    if(stateVec(8)<0){
        burnoutCounts++;
    }else{
        burnoutCounts = 0;
    }

    if(burnoutCounts>=BURNOUT_PERSISTENCE){
        return true;
    }else{
        return false;
    }

}

bool FlightMonitor::detectedApogee()
{

    if((stateVec(2)>APOGEE_ALTITUDE_THRESHOLD)&&(stateVec(5)<APOGEE_VELOCITY_THRESHOLD)){
        apogeeCounts++;
    }else{
        apogeeCounts = 0;
    }

    if(apogeeCounts>=APOGEE_PERSISTENCE){
        return true;
    }else{
        return false;
    }

}

bool FlightMonitor::detectedLanding()
{
    if((stateVec(2)<LANDING_ALTITUDE_THRESHOLD)&&(stateVec(5)>LANDING_VELOCITY_THRESHOLD)){
        landingCounts++;
    }else{
        landingCounts = 0;
    }

    if(landingCounts>=LANDING_PERSISTENCE){
        return true;
    }else{
        return false;
    }

}

bool FlightMonitor::detectedLean()
{
    return false;
}
