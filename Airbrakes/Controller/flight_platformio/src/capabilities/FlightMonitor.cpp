/* Source file for airbrakes flight monitor*/

// include class header
#include "FlightMonitor.h"

extern BLA::Matrix<9> stateVec;
extern BLA::Matrix<3> pointVec;
float tiltAngle;

FlightMonitor::FlightMonitor()
{
    launchCounts = 0;
    burnoutCounts = 0;
    apogeeCounts = 0;
    landingCounts = 0;
    tiltCounts=0;
}

bool FlightMonitor::detectedLaunch()
{
    if ((stateVec(2) > LAUNCH_HEIGHT_THRESHOLD) && (stateVec(5) > LAUNCH_VELOCITY_THRESHOLD)) {
        launchCounts += 1;
        Serial.print("launch counted: ");
     } else {
        Serial.print("reset launchCounts...");
        launchCounts = 0;
    }

    Serial.println(launchCounts);

    if (launchCounts >= LAUNCH_PERSISTENCE){
        return true;
    } else {
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
    tiltAngle = acos((stateVec(3)*pointVec(0) + stateVec(4)*pointVec(1) + stateVec(5)*pointVec(2))/(sqrt(pow(stateVec(3),2)+pow(stateVec(4),2)+pow(stateVec(5),2))));
    Serial.print("Point vec: ");
    Serial.print(pointVec(0));
    Serial.print(",");
    Serial.print(pointVec(1));
    Serial.print(",");
    Serial.println(pointVec(2));
    Serial.println(tiltAngle*RAD_TO_DEG,5);
    if(tiltAngle>TILT_THRESHOLD){
        tiltCounts++;
    }else{
        tiltCounts=0;
    }
    
    if(tiltCounts>=TILT_PERSISTENCE){
        return true;
    }
    else{
        return false;
    }
}
