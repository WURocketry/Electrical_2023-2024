
#include <SparkFunOpenLog.h>

SparkFunOpenLog::SparkFunOpenLog() {}

bool SparkFunOpenLog::init() {
    Serial.print("| Init OpenLog...");
    didInit = instance.begin();

    if (didInit) {
        logfile = "flight_" + String(getNumberOfPrevFlights()) + "_AB.csv";
        Serial.println("| Writing airbrake data to: " + logfile);
        Serial.println("OK!");
    }
    else {
        logfile = "FAILED_INIT.log";
        Serial.println("NOT OK!");
    }

    return didInit;   
}

int SparkFunOpenLog::getNumberOfPrevFlights() {
    String filename = "fileNumAB.txt";
    int fileCount = 0;

    // Check if the file exists
    long sizeOfFile = instance.size(filename);
    if (sizeOfFile > -1) {
        #define OPEN_LOG_BUFSIZE 200 // Increase this buffer size to hold larger numbers
        byte openLogBuffer[OPEN_LOG_BUFSIZE];
        instance.read(openLogBuffer, OPEN_LOG_BUFSIZE, filename); // Load openLogBuffer with contents of fileNum.txt

        String counterString = "";
        for (int x = 0; x < OPEN_LOG_BUFSIZE; x++) {
            if (openLogBuffer[x] >= '0' && openLogBuffer[x] <= '9') {
                counterString += (char)openLogBuffer[x];
            }
        }
        fileCount = counterString.toInt();
    }
    fileCount++;

    //overwrite file with new file count
    instance.remove(filename, false);
    instance.append(filename);
    instance.print(String(fileCount));
    instance.syncFile(); // save data

    return fileCount;
}

void SparkFunOpenLog::dumpSDRAMtoFile(float* SDRAM_base, int ringBufferIndex, int rows, int cols) {
    instance.append(logfile); //open the file in openlog
    
    int writeToIndex;
    if (ringBufferIndex > rows) {
        // Write entire buffer to file
        writeToIndex = rows;
    }
    else {
        // Write up to ringBufferIndex
        writeToIndex = ringBufferIndex;
    }

    for (int i=0; i<writeToIndex; ++i) {
        for (int j=0; j<cols; ++j) {
            instance.print((float)*(SDRAM_base + i*cols+j));
        }
        instance.println(); // newline at each row;
    }
    instance.syncFile();  // save changes
}