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
    if(!alt_instance.begin_I2C()){
        Serial.println("NOT OK! Altimeter not found");
        return false;
    }
    // Configure sample
    alt_instance.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
    alt_instance.setPressureOversampling(BMP3_OVERSAMPLING_4X);
    alt_instance.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
    alt_instance.setOutputDataRate(BMP3_ODR_100_HZ);    // 50Hz?
    Serial.println("OK!");

    Serial.println("Calibrating pressure readings with 100 sample average...");
    
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

    return true;
}


double AdafruitBMP388::getPressure() {
    if (!alt_instance.performReading()) {
        return -1;
    }
    return alt_instance.pressure;
}


double AdafruitBMP388::getRelativeAltitude() {
    if (!alt_instance.performReading()) {
        return -1;
    }
    double relativeAlt = alt_instance.readAltitude(BASE_PRESSURE_READING) - BASE_ALTITUDE_OFFSET;
    if (relativeAlt < 0) {
        return 0;
    }
    return relativeAlt;
}


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