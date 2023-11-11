#pragma once

// Magic number definitions
#define VLT_LENGTH 781
#define servoPin 8  // D8 PWM digital

#define NUM_DECAY_THRESHOLDS 4
#define NUM_MAX_ERROR_THRESHOLDS 3

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
        int decayAltitudeThresholds[NUM_DECAY_THRESHOLDS];
        int decayRates[NUM_DECAY_THRESHOLDS];
        int maxErrorThresholds[NUM_MAX_ERROR_THRESHOLDS];
        int maxErrorValues[NUM_DECAY_THRESHOLDS];

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
        decayAltitudeThresholds  {(int)targetAltitude/4, (int)targetAltitude/2, (int)targetAltitude*7/8, (int)targetAltitude*2},
        decayRates          {40,                    20,                    10,                      0},
        maxErrorThresholds  {(int)targetAltitude*2/8,   (int)targetAltitude*6/8,    (int)targetAltitude*2},
        maxErrorValues      {30,                        10,                         3}
    {};

    // Methods
    double control(double currAltitude, double currVelocity);
    void pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]);

};
