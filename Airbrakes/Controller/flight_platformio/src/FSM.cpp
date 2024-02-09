
#include <Arduino.h>

#include <FSM.h>
#include <ServoMovement.h>

FlightState Flight_FSM::detectLaunchTransition(FlightMonitor* fm, FlightState currentState) {
  /* Transitions: 
   * this -> burn
   * this -> detectLaunch 
   */

  // remain prior to launch (await launch detection)
  if (fm->detectedLaunch()) {
    Serial.println("**** TRANSITION TO BURN ****\n");
    return FlightState::burn;
  }
  return currentState;
}

FlightState Flight_FSM::burnTransition(FlightMonitor* fm, FlightState currentState) {
  /* Transitions:
   * this -> control
   * this -> burn
   */
  // remain until burn acceleration ended
  if (fm->detectedUnpoweredAscent()) {
    Serial.println("**** TRANSITION TO CONTROL ****\n");
    return FlightState::control;
  }
  
  return currentState;
}

FlightState Flight_FSM::controlTransition(FlightMonitor* fm, FlightState currentState, ServoMovement* srv) {
  /* Transitions
   * this -> coast
   * this -> burn
   * this -> controlStandby
   */
  // remain until apogee
  if (fm->detectedApogee()) {
    Serial.println(" **** APOGEE REACHED. TRANSITION TO COAST ****\n");
    srv->stowAirbrakes();
    return FlightState::coast;
  }
  if (fm->detectedLean()) {
    Serial.println("**** CRITICAL TILT DETECTED. TRANSITION TO STANDBY ****\n");
    srv->stowAirbrakes();
    return FlightState::controlStandby;
  }

  return currentState;
}

FlightState Flight_FSM::controlStandbyTransition(FlightMonitor* fm, FlightState currentState) {
  /* Transitions
   * this -> coast
   * this -> control
   */
  // TODO: remain until safe control conditions (implement eventually)
  // if (minimalLean) {
  //   return FlightState::control;
  // }
  Serial.println("**** IN STANBY. WILL TRANSITION WHEN IN NOMINAL STATE ****\n");
  return currentState;
}

FlightState Flight_FSM::coastTransition(FlightMonitor* fm, FlightState currentState) {
  /* Transitions:
   * this -> landed
   * this -> coast
   */
  
  // remain until landing
  if (fm->detectedLanding()) {
    Serial.println("**** LANDING DETECTED ****\n");
    return FlightState::landed;
  }
  return currentState;
}