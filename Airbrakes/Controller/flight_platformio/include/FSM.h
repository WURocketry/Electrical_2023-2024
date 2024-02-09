#pragma once

#include <FlightMonitor.h>

// Forward declare ServoMovement class
class ServoMovement;

/* File containing Finite State Machine Variables and State Transition Functions */

enum class FlightState {
    unknown,
    detectLaunch,
    burn,
    control,
    controlStandby,
    coast,
    landed
};

namespace Flight_FSM 
{
    FlightState detectLaunchTransition(FlightMonitor* fm, FlightState currentState);

    FlightState burnTransition(FlightMonitor* fm, FlightState currentState);

    FlightState controlTransition(FlightMonitor* fm, FlightState currentState, ServoMovement*);

    FlightState controlStandbyTransition(FlightMonitor* fm, FlightState currentState);

    FlightState coastTransition(FlightMonitor* fm, FlightState currentState);
}