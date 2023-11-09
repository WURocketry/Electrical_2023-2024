/* Source file for PID controller class*/

// include class header
#include <PID_Controller.h>
#include <vlt.h>

PID_Controller::PID_Controller(){
}

double PID_Controller::control(double velocity, double altitude){
    // Calculate the current velocity (you may need to calibrate this)
    input = velocity;

    // Calculate the desired velocity from the lookup table
    setpoint = getDesiredVelocity(altitude);

    // Calculate the error
    double prevError = error

    double error = input - setpoint;
 
    double derivative = error - prevError;

    double errorDecay = errorDecayFunc(altitude);

    integral_error = (error - errorDecay) + (error - errorDecay) ;

    // Calculate the control signal
    output = Kp * error + Ki * integral_error + Kd * derivative;


    airbrakeServo.write(output * 120);// curently I just write the output directly to the servo but is there a better way to do thus
    prevInput = input;
}

void PID_Controller::pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]){
    Ki=ki;
    Kp=kp;
    Kd=kd;
    for(int x=0;x<3;x++){
      altitudeThresholds[x]=thresholds[x];
    }
    for(int y=0;y<3;y++){
      decayRates[y]=rates[y];
    }
}

double PID_Controller::getDesiredVelocity(double altitude){
    int altIndex = int(altitude/2);
    return linearInterpolation(altitude, vlt[altIndex][0], vlt[altIndex + 1][0], vlt[altIndex][1], vlt[altIndex + 1][1]);
    // Handle the case where altitude is out of range
    // return 0.0; // You can choose an appropriate default value here.
}

double PID_Controller::linearInterpolation(double x, double x0, double x1, double y0, double y1){
    // Ensure x is within the range [x0, x1]
    if (x < x0) return y0;
    if (x > x1) return y1;

    // Perform linear interpolation
    return y0 + (y1 - y0) * (x - x0) / (x1 - x0);
}

float PID_Controller::errorDecayFunc(int altitude){
    if (altitude >= altitudeThresholds[0]) {
    return decayRates[0];
  } else if (altitude >= altitudeThresholds[1]) {
    return decayRates[1];
  } else if (altitude >= altitudeThresholds[2]) {
    return decayRates[2];
  } else {
    return 0;  // Full error impact below the lowest threshold.
  }
}
