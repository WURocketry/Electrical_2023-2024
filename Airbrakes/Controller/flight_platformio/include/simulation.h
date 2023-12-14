#pragma once

//First number in grouping is time, second is altitude, and third is acceleration
extern double simData[733][3];

int SearchVltByTime(double target);

void getSimulatedData(double time, float* returnArray);