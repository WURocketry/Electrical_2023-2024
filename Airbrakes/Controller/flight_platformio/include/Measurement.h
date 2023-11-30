#pragma once

extern double currentPosition;
extern double currentAcceleration;

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
    Measurement(float xAcc, float yAcc, float zAcc,float quer, float quei, float quej, float quek, float alt):
        xAccel(xAcc), yAccel(yAcc), zAccel(zAcc),qr(quer),qi(quei), qj(quej),qk(quek), altitude(alt) {}
};

