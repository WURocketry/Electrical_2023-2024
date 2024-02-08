#include <ServoMovement.h>
#include <IMPORTANT_CONFIG.h>

ServoMovement::ServoMovement(Servo &currSrv): targetAngle(0), currAngle(0), distanceThreshold(0.5), 
previousServoUpdate(0), servoUpdateIntervalMicros(10 * 1000), numSteps(10), servoMaxAngle(140), servoMinAngle(20), srv(currSrv)
{
}

ServoMovement::~ServoMovement()
{
}


// Function to initialize servo movement parameters
void ServoMovement::setServoPosition(int newTargetAngle) {
  #if SERVO_INVERTED
    targetAngle = SRV_MAX_EXTENSION_ANGLE - newTargetAngle;
  #else
    targetAngle = newTargetAngle;
  #endif
  currAngle = srv.read(); // Read current angle of servo
}

void ServoMovement::stowAirbrakes(){
  #if SERVO_INVERTED
    targetAngle = SRV_MAX_EXTENSION_ANGLE;
  #else
    targetAngle = 0;
  #endif
  currAngle = srv.read();
}

void ServoMovement::updateServoPosition() {
  unsigned long currentMicros = micros();
  
  if (currentMicros >= previousServoUpdate + servoUpdateIntervalMicros) {
    previousServoUpdate += servoUpdateIntervalMicros;

    if (abs(currAngle - targetAngle) > distanceThreshold) { // Only move if there is a significant difference
      float stepAngle = (float)(targetAngle - currAngle) / numSteps; // Determine step size
      currAngle += stepAngle;
      if (currAngle >= servoMinAngle && currAngle <= servoMaxAngle){
      srv.write(round(currAngle));
      }
    }
  }
}