/*
  An I2C based datalogger - Like the OpenLog but for I2C
  By: Nathan Seidle
  SparkFun Electronics
  Date: February 2nd, 2018
  License: This code is public domain but you buy me a beer if you use this and we meet someday (Beerware license).
​
  This example shows how to:
    Record some strings to a default log
    Check the size of a given file name
    If that given file doesn't exist, create it with random characters
    Read back the contents of the given file (containing random characters)
    Append to a file
*/
​
#include <Wire.h>
#include "SparkFun_Qwiic_OpenLog_Arduino_Library.h"
OpenLog myLog; //Create instance
​
int ledPin = LED_BUILTIN; //Status LED connected to digital pin 13
​
void setup()
{
  pinMode(ledPin, OUTPUT);
​
  Wire.begin();
  Wire.setClock(400000); //Go super fast
  myLog.begin(); //Open connection to OpenLog (no pun intended)
​
  Serial.begin(9600); //9600bps is used for debug statements
  Serial.println("OpenLog Read File Test");
​
  //Record something to the default log
  myLog.println("OpenLog Read File Test");
​
  String myFile = "testFile.csv";
​
  //Get size of file
  long sizeOfFile = myLog.size(myFile);
​
  if (sizeOfFile == -1) //File does not exist. Create it.
  {
    Serial.println(F("File not found, creating one..."));
​
    myLog.append(myFile); //Create file and begin writing to it

    randomSeed(analogRead(A0));

    for (int i = 0; i < 50; i++) {
        for (int j = 0; j < 50; j++) {
          byte myChar = random ("a", "z");  //pick a random letter

          myLog.println(myChar + ",");
        }
        myLog.println("\n");

    }

    myLog.syncFile();

    Serial.println("Create + Append done!");
  }
  else
  {
    Serial.println("File found!");
    Serial.println("Run Append File Test");
​
    myLog.append(myFile);
    myLog.println("This is recorded to the end of testFile.txt");
​
    randomSeed(analogRead(A0));

    for (int i = 0; i < 50; i++) {
        for (int j = 0; j < 50; j++) {
          byte myChar = random ("a", "z");  //pick a random letter

          myLog.println(myChar + ",");
        }
        myLog.println("\n");
    }
​
    myLog.syncFile();
​
    Serial.println("Append done!");
  }
​
  //Get size of file
  sizeOfFile = myLog.size(myFile);
​
  if (sizeOfFile > -1)
  {
    Serial.print(F("Size of file: "));
    Serial.println(sizeOfFile);
​
    //Read the contents of myFile by passing a buffer into .read()
    //Then printing the contents of that buffer
    byte myBufferSize = 200;
    byte myBuffer[myBufferSize];
    //myLog.read(myBuffer, myBufferSize, myFile, 4); //Doesn't yet work
    myLog.read(myBuffer, myBufferSize, myFile); //Load myBuffer with contents of myFile
​
    //Print the contents of the buffer
    Serial.println("File contents:");
    for (int x = 0 ; x < myBufferSize ; x++)
    {
      Serial.write(myBuffer[x]);
    }
    Serial.println("\nDone with file contents");
  }
  else
  {
    Serial.println(F("Size error: File not found"));
  }
​
  Serial.println(F("Done!"));
}
​
void loop()
{
  //Blink the Status LED because we're done!
  digitalWrite(ledPin, HIGH);
  delay(1000);
  digitalWrite(ledPin, LOW);
  delay(1000);
}