#pragma once

/* This should eventually extend a common Accelerometer component */
// #include <BaseAccelerometerComponent.h>

#include <Adafruit_ADXL345_U.h>

#define UNIQUE_SENS_ID_0 2002

namespace Sample
{
    struct Measurement;
}

class AdafruitADXL345 {
private:
    Adafruit_ADXL345_Unified instance{UNIQUE_SENS_ID_0};    // unique 2002 id for sens
public:
    bool didInit = false;
// Constructors
    AdafruitADXL345();
// Methods
    bool init();
    void getInfo();

    bool measureAcceleration(struct Sample::Measurement* measure);
};
