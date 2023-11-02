#include <Arduino.h>
#include <simulation.h>

// Binary search for row before or on time
int SearchVltByTime(double target) {
    if (target < 0) {
        Serial.println("(SearchVltByTime) Error: Cannot have negative target time");
        return -1;
    }
    
    int resultIdx;
    
    int tCol = 0;    // time column
    int simDataRows = sizeof(simData)/sizeof(simData[0]);
    int simDataCols = sizeof(simData[0])/sizeof(simData[0][0]);
    
    int lIdx = 0;
    int rIdx = simDataRows - 1;
    int mIdx = (rIdx - lIdx) / 2;
    
    while (lIdx <= rIdx) {
        if (simData[mIdx][tCol] < target) {
            // right subarr
            lIdx = mIdx + 1;
            
        }
        else if (simData[mIdx][tCol] > target) {
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

//return array will have the position in the zeroth location, acceleration in the second
void getSimulatedData(double time, double *returnArray) {
    
    if (time>130) {
        returnArray[0] = 0.0;
        returnArray[1] = 0.0;
    }
    else {
        //get the first row where the time is less than the requested time
        int i = SearchVltByTime(time);
        
        if (i==0) {
            returnArray[0] = 0.0;
            returnArray[1] = 0.0;
        }
        else {
            double fractionToNext = (time-simData[i][0])/(simData[i+1][0]-simData[i][0]);
            
            //interpolated position
            returnArray[0] = simData[i][1]+fractionToNext*(simData[i+1][1]-simData[i][1]);
            //interpolated acceleration
            returnArray[1] = simData[i][2]+fractionToNext*(simData[i+1][2]-simData[i][2]);
        }
    }
}