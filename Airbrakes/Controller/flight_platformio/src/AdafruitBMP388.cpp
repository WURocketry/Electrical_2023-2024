#include <AdafruitBMP388.h>
#include <Arduino.h>

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

    return true;
}

void AdafruitBMP388::readPressure() {
    if (!alt_instance.performReading()) {
        Serial.println("Failed to sample altimeter");
        return;
    }
    Serial.print("Temperature = ");
    Serial.print(alt_instance.temperature);
    Serial.println(" *C");

    Serial.print("Pressure = ");
    Serial.print(alt_instance.pressure / 100.0);
    Serial.println(" hPa");
}

void AdafruitBMP388::getRelativeAltitude() {
    if (!alt_instance.performReading()) {
        Serial.println("Failed to sample altimeter");
        return;
    }

    Serial.print("Approx. Altitude = ");
    Serial.print(alt_instance.readAltitude(BASE_PRESSURE_READING));
    Serial.println(" m");
}