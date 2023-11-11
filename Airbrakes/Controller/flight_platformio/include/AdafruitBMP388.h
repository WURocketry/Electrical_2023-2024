/* Include file for AdafruitBNO085 component class */
#pragma once

/* Note this will eventually become a derived class from BaseIMUComponent */
// #include "BaseIMUComponent.h"

#include <Adafruit_Sensor.h>
#include <Adafruit_BMP3XX.h>
// #include <Wire.h>

class AdafruitBMP388 {  // : public BaseAltComponent
private:
    Adafruit_BMP3XX alt_instance;
    double BASE_PRESSURE_READING = 101325;
public:
// Constructors
    AdafruitBMP388();   // default
// Methods
    bool init();
    double getPressure();
    double getRelativeAltitude();
    void printRawAltitude(int iters, int sampleFreqMicros);
};