#include <Measurement.h>

#include <AdafruitBNO085.h>
#include <AdafruitBMP388.h>

bool Sample::readMeasurement(Sample::Measurement* currentMeasurement, AdafruitBNO085 imu, AdafruitBMP388 alt) {
    bool measurementDataValid = true;

    // Measure Acceleration & Rotation Quat
    if (!imu.measureIMU(currentMeasurement)) {
        measurementDataValid = false;
    }

    // Measure Altitude
    if (!alt.measureAltitude(currentMeasurement)) {
        measurementDataValid = false;
    }

    return measurementDataValid;
}