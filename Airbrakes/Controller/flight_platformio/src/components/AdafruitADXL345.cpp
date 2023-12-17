#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Arduino.h>

#include <AdafruitADXL345.h>
#include <Measurement.h>

AdafruitADXL345::AdafruitADXL345() {}

bool AdafruitADXL345::init() {
    Serial.print("| Init ADXL345...");
    if(!instance.begin()) {
        Serial.println("NOT OK!");
        return false;
    }

    // Set range to 16G
    instance.setRange(ADXL345_RANGE_16_G);

    Serial.println("OK!");
    didInit = true;
    Serial.println("> Status check");
    getInfo();
    
    return true;
}


// @brief: Status check function to print sensor info
void AdafruitADXL345::getInfo() {
    if (didInit) {
        sensor_t sensor;
        instance.getSensor(&sensor);
        Serial.print  ("> Sensor:       "); Serial.println(sensor.name);
        Serial.print  ("> Driver Ver:   "); Serial.println(sensor.version);
        Serial.print  ("> Unique ID:    "); Serial.println(sensor.sensor_id);
        Serial.print  ("> Max Value:    "); Serial.print(sensor.max_value); Serial.println(" m/s^2");
        Serial.print  ("> Min Value:    "); Serial.print(sensor.min_value); Serial.println(" m/s^2");
        Serial.print  ("> Resolution:   "); Serial.print(sensor.resolution); Serial.println(" m/s^2");
    }
    else {
        Serial.println("> ADXL345: Could not get info -- Not initialized!");
    }
}


// @brief: Function to fill measurement struct with acceleration readings
bool AdafruitADXL345::measureAcceleration(Sample::Measurement* measure) {
    sensors_event_t event; 

    if (!didInit || !instance.getEvent(&event)) {
        return false;
    }

    // Already in floats from Adafruit Unified Sensor
    measure->xAccel = event.acceleration.x;
    measure->yAccel = event.acceleration.y;
    measure->zAccel = event.acceleration.z;

    return true;
}