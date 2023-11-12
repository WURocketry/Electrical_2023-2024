#pragma once

#define ACCEL_ARRAY_LENGTH 49

float accelReplace[ACCEL_ARRAY_LENGTH][2] {{0.0,70.0},
{0.01,170.823},
{0.02,191.957},
{0.03,189.936},
{0.04,181.792},
{0.05,177.505},
{0.06,173.857},
{0.07,170.2},
{0.08,167.607},
{0.09,166.58},
{0.1,165.564},
{0.11,164.544},
{0.12,163.521},
{0.13,162.494},
{0.14,161.465},
{0.15,160.632},
{0.16,160.092},
{0.17,159.553},
{0.18,159.011},
{0.19,58.467},
{0.2,158.112},
{0.21,158.039},
{0.225,157.97},
{0.248,157.859},
{0.281,157.676},
{0.331,157.364},
{0.381,156.874},
{0.431,156.188},
{0.481,155.209},
{0.531,154.176},
{0.581,153.092},
{0.631,151.836},
{0.681,150.295},
{0.731,	148.693},
{0.781,	147.037},
{0.831,	145.254},
{0.881,	143.28},
{0.931,	141.247},
{0.981,	139.162},
{1.031,	136.82},
{1.081,	134.058},
{1.131,	131.235},
{1.181,	128.361},
{1.231,	125.42},
{1.281,	122.412},
{1.331,	120.02},
{1.381,	118.471},
{1.431,	107.351},
{1.478,	70.0}};


int SearchAccelDataByTime(float target) {
    
    int tCol = 0;    // time column
    int simDataRows = sizeof(accelReplace)/sizeof(accelReplace[0]);
    
    int lIdx = 0;
    int rIdx = simDataRows - 1;
    int mIdx = (rIdx - lIdx) / 2;
    
    while (lIdx <= rIdx) {
        if (accelReplace[mIdx][tCol] < target) {
            // right subarr
            lIdx = mIdx + 1;
        }
        else if (accelReplace[mIdx][tCol] > target) {
            // left subarr
            rIdx = mIdx - 1;
        }
        else {
            break;
        }
        
        // Update middle index
        mIdx = lIdx + (rIdx - lIdx) / 2;
    }
    
    // if not exact index was found, get index previous before closest (without exceed min bound)
    if (lIdx > rIdx && mIdx != 0) {
        --mIdx;
    }
    
    return mIdx;
}

float getReplacedAccel(float timeSinceSat){

    int accelRow = SearchAccelDataByTime(timeSinceSat);

    if(accelRow==ACCEL_ARRAY_LENGTH-1){
        return accelReplace[accelRow][1];
    }

    float x = timeSinceSat;
    float y0 = accelReplace[accelRow][1];
    float x0 = accelReplace[accelRow][0];
    float y1 = accelReplace[accelRow+1][1];
    float x1 = accelReplace[accelRow][0];

    float replaceAccel = (y0*(x1-x)+y1*(x-x0))/(x1-x0);

    return replaceAccel;

}
