The home of airbrakes software.

## Root folder Hierarchy

### include/
This folder contains all the header files for every source file. 

A key file is the IMPORTANT_CONFIG.h file containing important configurations (go figure) of ACE software used during flight/development.

### src/
The corresponding definitions/implementations of the header files' classes

### lib/
External 3rd party libraries providing functionality

### test/
Never used. Rip. We should test code, and platformio provides a framework for that.

## Subfolder Hierarchy

### capabilities/
Contains UFS application software layer classes

### components/
Contains UFS component link layer classes

### simulation/
Files for simulating integration test data of the ACE