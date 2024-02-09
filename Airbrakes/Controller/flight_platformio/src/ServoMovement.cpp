#include <ServoMovement.h>
#include <IMPORTANT_CONFIG.h>

ServoMovement::ServoMovement(): targetAngle(0), lastAngle(0), distanceThreshold(1), 
previousServoUpdate(0), servoUpdateIntervalMicros(10 * 1000), numSteps(2)
{
  // Attach servo pin to D9 (PWM len min: 900 us, max: 2050us)  // this servo library is trolling us
  // Serial.print("| Init servo PWM...");
  srv.attach(9, SRV_MIN_PWM_LEN_MICROS, SRV_MAX_PWM_LEN_MICROS);

  // Default stow airbrakes on init
  #if SERVO_INVERTED
    targetAngle = SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET;
  #else
    targetAngle = SRV_ANGLE_DEG_OFFSET;
  #endif
  srv.write(targetAngle);
  lastAngle = targetAngle;
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
}

void ServoMovement::stowAirbrakes(){
  #if SERVO_INVERTED
    targetAngle = SRV_MAX_EXTENSION_ANGLE;
  #else
    targetAngle = SRV_ANGLE_DEG_OFFSET;
  #endif
}

void ServoMovement::updateServoPosition() {
  unsigned long currentMicros = micros();
  
  if (currentMicros >= previousServoUpdate + servoUpdateIntervalMicros) {
    previousServoUpdate += servoUpdateIntervalMicros;

    int virtLastAngle = lastAngle - SRV_ANGLE_DEG_OFFSET; // Last written angle, subtract offset for virtual angle

    // Serial.print("Last virtual angle: ");
    // Serial.println(virtLastAngle);
    // Serial.print("Target virtual angle: ");
    // Serial.println(targetAngle);

    if (abs(targetAngle - virtLastAngle) > distanceThreshold) { // Only move if there is a significant difference
      int stepAngle = (targetAngle - virtLastAngle) / numSteps; // Determine virtual step size
      int writeAngle = lastAngle + stepAngle;  // Actual angle with offset
      if (writeAngle >= SRV_ANGLE_DEG_OFFSET && writeAngle <= SRV_MAX_EXTENSION_ANGLE + SRV_ANGLE_DEG_OFFSET) {
        // Serial.print("Writing to actual angle: ");
        // Serial.println(writeAngle);
        srv.write(writeAngle);
        lastAngle = writeAngle;
      }
    }
  }
}