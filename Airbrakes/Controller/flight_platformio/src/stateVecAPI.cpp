#include "stateVecAPI.h"

// ring buffer index, onlg global variable tracked in main.cpp
int ringBufferIndex = 0;

// statevVec declerations
float stateVec[9] = {0,0,0,0,0,0,0,0,0};

float pos[3];
float vel[3];
float acc[3];

// updates global acc array
void readAcc() {
    memcpy(acc, 6+stateVec, 3*sizeof(*stateVec));
} 

// updates global vel array  
void readVel() {
    memcpy(vel, 3+stateVec, 3*sizeof(*stateVec));
}

// updates global pos array
void readPos() {
    memcpy(pos, stateVec, 3*sizeof(*stateVec));
}

class RingBuffer {
    private:
        static const int RING_BUFFER_LENGTH = 4000;
        static const int RING_BUFFER_LENGTH = 11;
        static const float* SDRAM_base = (float*) 0x60000000;
    public:

        bool insertIntoSDRAM(float* stateVec, double controlVal, int timestep, int size, int ringBufferIndex) {
            // calculate current address
            float* currAddr = (float*)(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS));

            // build array + check for expected values
            //find best method to check the size of the array is correct
            int i = 0;
            if (i > RING_BUFFER_COLS - 2) {
                return false;
            } else {
                currAddr = stateVec[i];
                i++;
                ringBufferIndex++;
            }
            currAddr = (float) controlVal;
            ringBufferIndex++;
            currAddr = (float) timestep;
            ringBufferIndex++;

            

            //insert into RAM + return
        }
        // broken for some reason, fix after normal method is done
        int& opreator[](int ringBufferIndex) {
            float* currAddr = (float*)(SDRAM_base + ((ringBufferIndex%RING_BUFFER_LENGTH)*RING_BUFFER_COLS));
            return &currAddr;
        }
}