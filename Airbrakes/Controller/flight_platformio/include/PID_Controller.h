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
        int altitudeThresholds[3]; // Initialize in constructor
        float decayRates[3]; // Initialize in constructor
        double setpoint;
        double input;
        double output;
        double integral;
        double prevInput;
        // Internal methods
        double getDesiredVelocity();
        float errorDecayFunc(int altitude);

    public:
    // Constructor
    PID_Controller(); // Initializes velocity table, decay rates and thresholds
    // Methods
    void control(double velocity, double altitude);

}
