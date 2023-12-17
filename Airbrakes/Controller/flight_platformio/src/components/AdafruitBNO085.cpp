
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Arduino.h>

#include <AdafruitBNO085.h>
#include <Measurement.h>

#define REPORT_FREQ_US  10000

AdafruitBNO085::AdafruitBNO085() {}

bool AdafruitBNO085::init() {
    Serial.print("| Init BNO085...");
    Wire.begin();

    // Initialize I2C bus
    if(!instance.begin_I2C()){
        Serial.println("NOT OK!");
        return false;
    }

    // Initialize rotation vector report
    if (!instance.enableReport(SH2_ROTATION_VECTOR, REPORT_FREQ_US)) {
        Serial.println("NOT OK! Failed to enable rotation vector");
        return false;
    }

    Serial.println("OK!");
    didInit = true;
    Serial.println("> Status check");
    getInfo();
    
    return true;
}

bool AdafruitBNO085::isCalibrated() {
    // TODO
    return true;
}


bool AdafruitBNO085::isDataReady() {
    return true;    // interrupt pin not yet connected
}


// @brief: Status check function to display sensor info
void AdafruitBNO085::getInfo() {
    if (didInit) {
        for (int n = 0; n < instance.prodIds.numEntries; n++) {
            Serial.print("> Part ");
            Serial.print(instance.prodIds.entry[n].swPartNumber);
            Serial.print(": Version :");
            Serial.print(instance.prodIds.entry[n].swVersionMajor);
            Serial.print(".");
            Serial.print(instance.prodIds.entry[n].swVersionMinor);
            Serial.print(".");
            Serial.print(instance.prodIds.entry[n].swVersionPatch);
            Serial.print(" Build ");
            Serial.println(instance.prodIds.entry[n].swBuildNumber);
        }
    }
    else {
        Serial.println("BNO085: Could not retrieve info -- not initialized!");
    }
}


void AdafruitBNO085::printRawAcceleration(int iters, int sampleFreqMicros) {
    for (int i=0; i<iters; ++i) {
        readAcceleration();
        delay(sampleFreqMicros);
    }
}


// @brief: prints linear acceleration
// @note: DEPRECATED FUNCTION -- defer to using accelerometer for acceleration samples
void AdafruitBNO085::readAcceleration() {
    if (!instance.getSensorEvent(&sensorValue)) {
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


// @brief: fills struct with measurement values
bool AdafruitBNO085::measureIMU(Sample::Measurement* measure) {
    if (!didInit || !instance.getSensorEvent(&sensorValue)) {
        return false;
    }

    switch (sensorValue.sensorId) {
        case SH2_ROTATION_VECTOR:
            measure->qi     = (float)sensorValue.un.rotationVector.i;
            measure->qj     = (float)sensorValue.un.rotationVector.j;
            measure->qk     = (float)sensorValue.un.rotationVector.k;
            measure->qr     = (float)sensorValue.un.rotationVector.real;
            break;

    }

    return true;
}