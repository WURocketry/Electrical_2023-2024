#include <SPI.h>
#include <RH_RF95.h>
RH_RF95 rf95(5, 2); // Rocket Scream Mini Ultra Pro with the RFM95W
 
void setup() 
{
  // Ensure serial flash is not interfering with radio communication on other buses
  pinMode(4, OUTPUT);
  digitalWrite(4, HIGH);
  Serial.begin(9600);
  while (!Serial); // Wait for serial port to be available
  if (!rf95.init()){
    Serial.println("init failed");
  }
  rf95.setFrequency(915.0);
}
void loop() 
{
  // Your main code logic goes here
  // You can continuously run tasks or functions in this loop.
  if (rf95.available()) {
    // If there's data available to receive
    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);
    
    if (rf95.recv(buf, &len)) {
      // Data received successfully
      Serial.print("Received [");
      Serial.print(len);
      Serial.print(" bytes]: ");
      Serial.write(buf, len);
      Serial.println();
    } else {
      Serial.println("Receive failed");
    }
  }
}