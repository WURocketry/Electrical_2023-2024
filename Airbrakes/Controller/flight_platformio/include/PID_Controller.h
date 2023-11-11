#pragma once

// Magic number definitions
#define VLT_LENGTH 781
#define servoPin 8

class PID_Controller{
    private:
        double tgtAlt;
        // PID Control variables
        double setpoint;
        double input;
        double output;
        double integral_error;
        double prevError;
        // Configurable constants
        double Ki;
        double Kp;
        double Kd;
        int altitudeThresholds[3];
        float decayRates[3];
        // Internal methods
        double getDesiredVelocity(double altitude);
        double linearInterpolation(double x, double x0, double x1, double y0, double y1);
        float getErrorDecay(int altitude, double origError);

    public:
    // Default Constructor
    PID_Controller(double targetAltitude) : 
        tgtAlt(targetAltitude),
        integral_error(0),
        prevError(0),
        Ki(0.1),
        Kp(0.01),
        Kd(0.001),
        altitudeThresholds  {(int)targetAltitude/2, 7/8*(int)targetAltitude, 2*(int)targetAltitude},
        decayRates          {6,                1.5,                0}
    {};

    // Methods
    double control(double currAltitude, double currVelocity);
    void pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]);

};
