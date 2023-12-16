
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Arduino.h>

#include <AdafruitADXL345.h>
#include <Measurement.h>


bool AdafruitADXL345::init() {
    Serial.print("Init ADXL345...");
    if(!instance.begin()) {
        Serial.println("NOT OK!");
    }
    else {
        // Set range to 16G
        instance.setRange(ADXL345_RANGE_16_G);
        
        Serial.println("OK!");
        didInit = true;
    }
    
    return didInit;
}

bool AdafruitADXL345::measureAcceleration(Sample::Measurement* measure) {
    sensors_event_t event; 
  
    if (!didInit || instance.getEvent(&event)) {
        return false;
    }

    // Already in floats from Adafruit Unified Sensor
    measure->xAccel = event.acceleration.x;
    measure->yAccel = event.acceleration.y;
    measure->zAccel = event.acceleration.z;

    return true;
}