/* Include file for AdafruitBNO085 component class */
#pragma once

/* Note this will eventually become a derived class from BaseIMUComponent */
// #include "BaseIMUComponent.h"

#include <Adafruit_BNO08x.h>

namespace Sample
{
    struct Measurement;
}

//define IMU pins
// #define imuINT 9 // INT not connected on portenta

class AdafruitBNO085 {  // : public BaseIMUComponent
private:
    Adafruit_BNO08x instance;
    sh2_SensorValue_t sensorValue;
    bool isCalibrated();
    bool isDataReady();
public:
    bool didInit = false;
// Constructors
    AdafruitBNO085();   // default
// Methods
    bool init();
    void getInfo();
    void readAcceleration();
    void printRawAcceleration(int iters, int sampleFreqMicros);

    bool measureIMU(struct Sample::Measurement* measure);
};