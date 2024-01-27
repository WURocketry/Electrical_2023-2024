/* Source file for PID controller class */

// include class header
#include <PID_Controller.h>
#include <vlt.h>
#include <Arduino.h>

#define I_ERROR_RESET_THRESHOLD 0.1

// @brief: Main PID control computation that takes current
//         z-axis velocity and altitude
double PID_Controller::control(double currAltitude, double currVelocity){
    // Calculate the current velocity (you may need to calibrate this)
    input = currVelocity;

    // Calculate the desired velocity from the lookup table
    setpoint = getDesiredVelocity(currAltitude);

    // Calculate proportional error
    double currError = input - setpoint;

    //Serial.print(currError,4);
    //Serial.println(" - current Velocity Error");

    // Calculate integral error
    integral_error += getErrorDecay(currAltitude, currError);
    if (currError < I_ERROR_RESET_THRESHOLD) {
      // If current error is now close, reset integral error history
      integral_error = 0;
    }

    // Calculate derivative error (currError - prevError)
    double derivative = currError - prevError;
    prevError = currError;  // update prevError

    // Calculate the control signal
    output = Kp * currError + Ki * integral_error + Kd * derivative;

    //Serial.print("Output of PID is: ");
    //Serial.println(output,4);

    // Normalize output as a proportion of max error
    if (currAltitude >= maxErrorThresholds[2]) {
      output = output/3.0;
    }
    else if (currAltitude >= maxErrorThresholds[1]) {
      output = output/10.0;
    }
    else {
      output = output/30.0;
    }

    Serial.print("PID output after max Error is ");
    Serial.println(output,4);

    // Clamp output between 0 and 1
    if (output > 1) {
      output = 1;
    }
    else if (output < 0) {
      output = 0;
    }

    return output;
}

void PID_Controller::pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]){
    Ki=ki;
    Kp=kp;
    Kd=kd;
    for(int i=0; i<3; i++){
      decayAltitudeThresholds[i] = thresholds[i];
    }
    for(int i=0; i<3; i++){
      decayRates[i] = rates[i];
    }
}

// @brief: Returns a linearly interp velocity at an altitude read from the VLT table
double PID_Controller::getDesiredVelocity(double altitude){
    int altIndex = altitude/2;
    
    if (altIndex < 0) {
      // FAULT-PROTECTION: If altitude index is OoB, (currently) return very large
      // velocity so that the airbrakes stow (ace thinks it needs to minimize drag)
      return 9999.0;
    }

    if( altIndex > (VLT_LENGTH -1)){
      return 0.0;
    }

    return linearInterpolation(altitude, vlt[altIndex][0], vlt[altIndex + 1][0], vlt[altIndex][1], vlt[altIndex + 1][1]);
}

// @brief: Provides linear interp between two data points given independent variable x
double PID_Controller::linearInterpolation(double x, double x0, double x1, double y0, double y1){
    // Ensure x is within the range [x0, x1]
    if (x < x0) return y0;
    if (x > x1) return y1;

    // Perform linear interpolation
    return y0 + (y1 - y0) * (x - x0) / (x1 - x0);
}

// @brief: Returns a "decaying" restriction on maximum error that is seen by Intg based on altitude
//        (lower alt --> less strict --> larger errorDecay (to subtract from current integral error))
double PID_Controller::getErrorDecay(int altitude, double origError) {
  double decayedError = origError;

  if (altitude >= decayAltitudeThresholds[3])
    return decayedError;  // Full error impact when above highest threshold, no decay on original error
  else if (altitude >= decayAltitudeThresholds[2]) 
    decayedError -= decayRates[2];
  else if (altitude >= decayAltitudeThresholds[1]) 
    decayedError -= decayRates[1];
  else
    decayedError -= decayRates[0];

  if (decayedError < 0) {
    // Prevent negative error decay
    return 0;
  }
  else {
    return decayedError;
  }
}
