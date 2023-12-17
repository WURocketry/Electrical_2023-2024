#include <Measurement.h>

#include <AdafruitBNO085.h>
#include <AdafruitBMP388.h>
#include <AdafruitADXL345.h>

bool Sample::readMeasurement(Sample::Measurement* currentMeasurement, 
                        AdafruitBNO085 imu, AdafruitBMP388 alt, AdafruitADXL345 acc) {
    bool measurementDataValid = true;

    // Measure Rotation Quat
    if (!imu.measureIMU(currentMeasurement)) {
        measurementDataValid = false;
    }

    // Measure Altitude
    if (!alt.measureAltitude(currentMeasurement)) {
        measurementDataValid = false;
    }

    // Measure Acceleration
    if (!acc.measureAcceleration(currentMeasurement)) {
        measurementDataValid = false;
    }

    return measurementDataValid;
}