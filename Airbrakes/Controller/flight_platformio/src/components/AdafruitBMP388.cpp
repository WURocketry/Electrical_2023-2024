#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Arduino.h>

#include <AdafruitBMP388.h>
#include <Measurement.h>

AdafruitBMP388::AdafruitBMP388() {}

bool AdafruitBMP388::init() {
    Serial.print("| Init BMP388...");
    Wire.begin();

    BASE_PRESSURE_READING = 1013.25;    // MODIFY WITH CALIBRATED BASE READING ON INIT

    // Initialize I2C bus
    if(!instance.begin_I2C()){
        Serial.println("NOT OK! Altimeter not found");
        return false;
    }
    // Configure sample
    instance.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
    instance.setPressureOversampling(BMP3_OVERSAMPLING_4X);
    instance.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
    instance.setOutputDataRate(BMP3_ODR_100_HZ);    // 50Hz?
    
    Serial.println("OK!");
    didInit = true;

    Serial.println("> Calibrating pressure readings with 100 sample average...");
    int j = 0;
    double baseAltitudes = 0;
    double bAlt = 0;
    while (j < 100) {
        bAlt = getRelativeAltitude();
        if (bAlt < 0) {
            continue;
        }
        if (j > 9) {
            baseAltitudes += bAlt;
        }
        ++j;
        delay(10);  // 100 Hz delay
    }
    BASE_ALTITUDE_OFFSET = baseAltitudes/90;
    Serial.print("> BASE_ALTITUDE_OFFSET: ");
    Serial.println(BASE_ALTITUDE_OFFSET);

    return didInit;
}


// @brief: Function to get raw pressure value
// @note: DEPRECATED FUNCTION, REFER TO `getRelativeAltitude` to obtain altitude reading
double AdafruitBMP388::getPressure() {
    if (!instance.performReading()) {
        return -1;
    }
    return instance.pressure;
}


// @brief: Obtains altitude relative to an offset (zeroed pressure at init altitude)
double AdafruitBMP388::getRelativeAltitude() {
    if (!didInit || !instance.performReading()) {
        return -1;
    }
    
    double relativeAlt = instance.readAltitude(BASE_PRESSURE_READING) - BASE_ALTITUDE_OFFSET;
    if (relativeAlt < 0) {
        return 0;
    }
    return relativeAlt;
}


// @brief: Prints "raw" (i know, misleading) relative altitudes
void AdafruitBMP388::printRawAltitude(int iters, int sampleFreqMicros) {
    int i = 0;
    while (i < iters) {
        double alt = getRelativeAltitude();

        if (alt < 0) {
            Serial.println("MISS");
            continue;
        }
        Serial.println(getRelativeAltitude(), 6);
        ++i;
        delay(sampleFreqMicros);
    }
}


// @brief: fills measurement struct with altitude data
bool AdafruitBMP388::measureAltitude(Sample::Measurement* measure) {
    double alt = getRelativeAltitude();
    if (alt < 0) {
        return false;
    }

    measure->altitude = (float)alt;

    return true;
}