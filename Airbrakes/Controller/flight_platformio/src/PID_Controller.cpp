/* Source file for PID controller class */

// include class header
#include <PID_Controller.h>

#define I_ERROR_RESET_THRESHOLD 0.1

double PID_Controller::control(double velocity, double altitude){
    // Calculate the current velocity (you may need to calibrate this)
    input = velocity;

    // Calculate the desired velocity from the lookup table
    setpoint = getDesiredVelocity(altitude);

    // Calculate proportional error
    double currError = input - setpoint;

    // Calculate integral error
    integral_error += getErrorDecay(altitude, currError);
    if (currError < I_ERROR_RESET_THRESHOLD) {
      // If current error is now close, reset integral error history
      integral_error = 0;
    }

    // Calculate derivative error (currError - prevError)
    double derivative = currError - prevError;
    prevError = currError;  // update prevError

    // Calculate the control signal
    output = Kp * currError + Ki * integral_error + Kd * derivative;

    return output;
}

void PID_Controller::pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]){
    Ki=ki;
    Kp=kp;
    Kd=kd;
    for(int i=0; i<3; i++){
      altitudeThresholds[i] = thresholds[i];
    }
    for(int i=0; i<3; i++){
      decayRates[i] = rates[i];
    }
}

// @brief: Returns a linearly interp velocity at an altitude read from the VLT table
double PID_Controller::getDesiredVelocity(double altitude){
    int altIndex = altitude/2;
    
    if (altIndex < 0 || altIndex > 793) {
      // FAULT-PROTECTION: If altitude index is OoB, (currently) return very large
      // velocity so that the airbrakes stow (ace thinks it needs to minimize drag)
      return 9999.0;
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
float PID_Controller::getErrorDecay(int altitude, double origError) {
  double decayedError = origError;

  if (altitude >= altitudeThresholds[0])
    decayedError -= decayRates[0];
  else if (altitude >= altitudeThresholds[1]) 
    decayedError -= decayRates[1];
  else if (altitude >= altitudeThresholds[2]) 
    decayedError -= decayRates[2];
  else
    return decayedError;  // Full error impact when above highest threshold, no decay on original error
  
  if (decayedError < 0) {
    // Prevent negative error decay
    return 0;
  }
  else {
    return decayedError;
  }
}
