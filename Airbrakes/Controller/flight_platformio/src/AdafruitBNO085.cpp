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
    if(!imu_instance.enableReport(SH2_ACCELEROMETER)){
        Serial.println("NOT OK! Failed to initialize accelerometer");
        
        return false;
    }
    // Initialize magnetometer
    if(!imu_instance.enableReport(SH2_ACCELEROMETER)){
        Serial.println("no accelerometer after reset...");
    }
    Serial.println("OK!");

    return true;
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


bool AdafruitBNO085::isData() {
    return true;    // interrupt pin not yet connected
}

void AdafruitBNO085::readAcceleration(){
    if (!imu_instance.getSensorEvent(&sensorValue)) {
        Serial.println("BNO_ERR: Not able to read");
        return;
    }

    if(sensorValue.sensorId == SH2_ACCELEROMETER){
        Serial.print("x acceleration: ");
        Serial.println(sensorValue.un.accelerometer.x);
        Serial.print("y acceleration: ");
        Serial.println(sensorValue.un.accelerometer.y);
        Serial.print("z acceleration: ");
        Serial.println(sensorValue.un.accelerometer.z);
    } else{
        return;
    }
}