#pragma once

#include <Arduino.h>
#include "Servo.h"
#include <Measurement.h>

// Servo defines
#define SRV_MIN_PWM_LEN_MICROS  900
#define SRV_MAX_PWM_LEN_MICROS  2050
#define SRV_MAX_EXTENSION_ANGLE 165 // Defines MAX from 0 -> MAX (is without offset e.g. MAX=120 --> REAL=140 with +20 offset)
#define SRV_ANGLE_DEG_OFFSET    5

class ServoMovement
{
private:
  int targetAngle;
  int lastAngle;
  int distanceThreshold;
  unsigned long previousServoUpdate;
  const long servoUpdateIntervalMicros;
  int numSteps;
  Servo srv;
public:
  ServoMovement();
  ~ServoMovement();

  void setServoPosition(int newTargetAngle);
  void stowAirbrakes();
  void updateServoPosition();
};