# pragma once

#include <Servo.h>

// Magic number definitions
#define VLT_LENGTH 793
#define servoPin 8

// PID constants
#define Ki 0.1
#define Kp 0.01
#define Kd 0.001

class PID_Controller{
    private:
        float velocityTable[VLT_LENGTH][2];
        Servo airbrakeServo;
        // PID Control variables
        double setpoint;
        double input;
        double output;
        double integral_error;
        double prevInput;
        // Configurable constants
        double Ki = 0.1;
        double Kp = 0.01;
        double Kd = 0.001;
        int altitudeThresholds[3]={1,2,3};
        float decayRates[3]={1,2,3};
        // Internal methods
        double getDesiredVelocity();
        double linearInterpolation();
        float errorDecayFunc(int altitude);

    public:
    // Constructor
    PID_Controller(); // Initializes velocity table, decay rates and thresholds
    // Methods
    double control(double velocity, double altitude);
    void pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]);

}
