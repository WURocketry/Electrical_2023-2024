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
    float q0;
    float q1;
    float q2;
    float q3;
    float altitude;
    Measurement() {}
    Measurement(float xAcc, float yAcc, float zAcc,float que0, float que1, float que2, float que3, float alt):
        xAccel(xAcc), yAccel(yAcc), zAccel(zAcc),q0(que1),q1(que1), q2(que2),q3(que3), altitude(alt) {}
};

