#include <Arduino.h>
#include <Servo.h>
#include <Measurement.h>

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
  void updateServoPosition();
};