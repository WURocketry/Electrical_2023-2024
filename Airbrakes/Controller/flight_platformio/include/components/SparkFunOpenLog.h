/* Include file for SparkFun OpenLog component class */
#pragma once

/* Note this will eventually become a derived class from BaseDataStoreComponent */
// #include "BaseDataStoreComponent.h"

#include <SparkFun_Qwiic_OpenLog_Arduino_Library.h>

class SparkFunOpenLog {
private:
    OpenLog logger;
    int getNumberOfPrevFlights();
    String logfile;
public:
    bool didInit = false;
// Constructors
    SparkFunOpenLog();
// Methods
    bool init();
    void dumpSDRAMtoFile(float* baseptr, int ringBufferIndex, int rows, int cols);
};