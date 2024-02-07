#include <Arduino.h>
#include <Servo.h>
#include <Measurement.h>

// Servo defines
#define SRV_MIN_PWM_LEN_MICROS  900
#define SRV_MAX_PWM_LEN_MICROS  2050
#define SRV_MAX_EXTENSION_ANGLE 100    // Defines MAX from 0 -> MAX (is absolute, without offset)
#define SRV_ANGLE_DEG_OFFSET    20

class ServoMovement
{
private:
  float targetAngle;
  float currAngle;
  float distanceThreshold;
  unsigned long previousServoUpdate;
  const long servoUpdateIntervalMicros;
  int numSteps;
  int servoMaxAngle;
  int servoMinAngle;
  Servo srv;
public:
  ServoMovement(Servo &currSrv);
  ~ServoMovement();

  void initializeServoMovement(int newTargetAngle);
  void stowAirbrakes();
  void updateServoPosition();
};