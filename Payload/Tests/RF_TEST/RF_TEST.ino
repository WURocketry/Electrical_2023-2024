#include <SPI.h>
#include <RH_RF95.h>

#define RFM95_CS   16
#define RFM95_INT  21
#define RFM95_RST  17
#define RF95_FREQ 915.0
RH_RF95 rf95(RFM95_CS, RFM95_INT);
 
void setup() 
{

  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);

  //LoRa Setup
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  //Radio Reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  //LoRa Init & Frequency Test
  while (!rf95.init()) {
    ErrorLEDLoop("LoRa radio init failed, Halting");
  }
  Serial.println("LoRa radio init OK!");

  delay(30);
  
  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    ErrorLEDLoop("setFrequency failed, Halting");
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);
  rf95.setTxPower(23, false); //5-23 power level, 23 is max
}

void ErrorLEDLoop(const char* error_msg){
  while(true){
    Serial.println(error_msg);
    digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
    delay(1000);                      
    digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
    delay(1000);    
  }                
}


void loop() 
{
  // Your main code logic goes here
  // You can continuously run tasks or functions in this loop.

 // const char *message = "Hello, World!";
 // rf95.send((uint8_t *)message, strlen(message));
  
  //Serial.println(rf95.available());
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