#pragma once

// Forward declaring sensor components
class AdafruitBNO085;
class AdafruitBMP388;
class AdafruitADXL345;

namespace Sample
{
        struct Measurement {
        /** 
         * UFS NOTE: This struct defines format for data used by
         * this flight software -- but the sampleLoop should use
         * UFS objects to actually sample data and then pack it into
         * this struct
         **/
        float xAccel;
        float yAccel;
        float zAccel;
        float qi;
        float qj;
        float qk;
        float qr;
        float altitude;
        Measurement() {}
        Measurement(float xAcc, float yAcc, float zAcc,
                    float quer, float quei, float quej, float quek, 
                    float alt):
                xAccel(xAcc), yAccel(yAcc), zAccel(zAcc), 
                qi(quei), qj(quej), qk(quek), qr(quer), 
                altitude(alt) {}
        };

        bool readMeasurement(Measurement* measure, AdafruitBNO085 imu, AdafruitBMP388 alt, AdafruitADXL345 acc);
}