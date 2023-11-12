#pragma once

// Magic number definitions
#define VLT_LENGTH 732
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
        double decayAltitudeThresholds[NUM_DECAY_THRESHOLDS];
        double decayRates[NUM_DECAY_THRESHOLDS];
        double maxErrorThresholds[NUM_MAX_ERROR_THRESHOLDS];
        double maxErrorValues[NUM_DECAY_THRESHOLDS];

        // Internal methods
        double getDesiredVelocity(double altitude);
        double linearInterpolation(double x, double x0, double x1, double y0, double y1);
        double getErrorDecay(int altitude, double origError);

    public:
    // Default Constructor
    PID_Controller(double targetAltitude) : 
        tgtAlt(targetAltitude),
        integral_error(0),
        prevError(0),
        Ki(0.2),
        Kp(1),
        Kd(0.05),
        decayAltitudeThresholds  {targetAltitude/4.0, targetAltitude/2.0, targetAltitude*7/8.0, targetAltitude*2.0},
        decayRates          {40.0,                    20.0,                    10.0,                      0.0},
        maxErrorThresholds  {targetAltitude*2.0/8.0,   targetAltitude*6.0/8.0,    targetAltitude*2.0},
        maxErrorValues      {30.0,                        10.0,                         3.0}
    {};

    // Methods
    double control(double currAltitude, double currVelocity);
    void pid_config(double ki, double kp, double kd, int thresholds[3], float rates[3]);

};
