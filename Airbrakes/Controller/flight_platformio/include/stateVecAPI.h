#include <stdexcept>

#include <bits/stdc++.h>
#include <string.h>
#include <BasicLinearAlgebra.h>


void readAcc();
void readVel();
void readPos();

using namespace std;

class RingBuffer {
    private:
        static const int RING_BUFFER_LENGTH;
        static const int RING_BUFFER_COLS;
    public:
        bool insertIntoSDRAM(float* stateVec, double controlVal, int timestep, int size); 
        int& operator[](int ringBufferIndex);

}
