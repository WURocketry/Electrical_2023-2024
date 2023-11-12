/* Include file for AdafruitBNO085 component class */
#pragma once

/* Note this will eventually become a derived class from BaseIMUComponent */
// #include "BaseIMUComponent.h"

#include <Measurement.h>

#include <Adafruit_BNO08x.h>
#include <Wire.h>

//define IMU pins
// #define imuINT 9 // INT not connected on portenta

class AdafruitBNO085 {  // : public BaseIMUComponent
private:
    Adafruit_BNO08x imu_instance;
    sh2_SensorValue_t sensorValue;
    bool isCalibrated();
    bool isDataReady();
public:
// Constructors
    AdafruitBNO085();   // default
// Methods
    bool init();
    void getInfo();
    void readAcceleration();
    void printRawAcceleration(int iters, int sampleFreqMicros);

    bool measureIMU(struct Measurement* measure);
};