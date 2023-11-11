#include <AdafruitBNO085.h>
#include <Arduino.h>

AdafruitBNO085::AdafruitBNO085() {}

bool AdafruitBNO085::init() {
    Serial.print("| Init BNO085...");
    Wire.begin();

    // Initialize I2C bus
    if(!imu_instance.begin_I2C()){
        Serial.println("NOT OK! IMU not found");
        return false;
    }
    // Initialize accelerometer
    if(!imu_instance.enableReport(SH2_LINEAR_ACCELERATION)){
        Serial.println("NOT OK! Failed to initialize accelerometer");
        return false;
    }
    Serial.println("OK!");

    return true;
}

bool AdafruitBNO085::isCalibrated() {
    return true;
}

void AdafruitBNO085::printRawAccel(int iters, int sampleFreqMicros) {
    for (int i=0; i<iters; ++i) {
        readAcceleration();
        delay(sampleFreqMicros);
    }
}


void AdafruitBNO085::getInfo() {
    for (int n = 0; n < imu_instance.prodIds.numEntries; n++) {
        Serial.print("Part ");
        Serial.print(imu_instance.prodIds.entry[n].swPartNumber);
        Serial.print(": Version :");
        Serial.print(imu_instance.prodIds.entry[n].swVersionMajor);
        Serial.print(".");
        Serial.print(imu_instance.prodIds.entry[n].swVersionMinor);
        Serial.print(".");
        Serial.print(imu_instance.prodIds.entry[n].swVersionPatch);
        Serial.print(" Build ");
        Serial.println(imu_instance.prodIds.entry[n].swBuildNumber);
  }
}


bool AdafruitBNO085::isDataReady() {
    return true;    // interrupt pin not yet connected
}

// @brief: returns linear acceleration
void AdafruitBNO085::readAcceleration(){
    if (!imu_instance.getSensorEvent(&sensorValue)) {
        Serial.println("MISS");
        return;
    }

    if(sensorValue.sensorId == SH2_LINEAR_ACCELERATION){
        Serial.print(sensorValue.un.linearAcceleration.x, 6);
        Serial.print(",");
        Serial.print(sensorValue.un.linearAcceleration.y, 6);
        Serial.print(",");
        Serial.println(sensorValue.un.linearAcceleration.z, 6);
    } 
    else {
        return;
    }
}