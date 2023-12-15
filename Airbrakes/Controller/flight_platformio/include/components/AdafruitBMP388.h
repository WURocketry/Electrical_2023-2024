/* Include file for AdafruitBMP388 component class */
#pragma once

/* Note this will eventually become a derived class from BaseAltComponent */
// #include "BaseAltComponent.h"

#include <Adafruit_BMP3XX.h>

namespace Sample
{
    struct Measurement;
}

#define SEA_LEVEL_PRESSURE_PA 101325

class AdafruitBMP388 {  // : public BaseAltComponent
private:
    Adafruit_BMP3XX alt_instance;
    double BASE_PRESSURE_READING = SEA_LEVEL_PRESSURE_PA;
    double BASE_ALTITUDE_OFFSET = 0;
public:
// Constructors
    AdafruitBMP388();   // default
// Methods
    bool init();
    double getPressure();
    double getRelativeAltitude();
    void printRawAltitude(int iters, int sampleFreqMicros);

    bool measureAltitude(Sample::Measurement* measure);
};