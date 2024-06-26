
#include <Arduino.h>
#include <SPI.h>
#include <RH_RF95.h>

#if defined (__AVR_ATmega32U4__)  // Feather 32u4 w/Radio
  #define RFM95_CS    8
  #define RFM95_INT   7
  #define RFM95_RST   4

#elif defined(ADAFRUIT_FEATHER_M0) || defined(ADAFRUIT_FEATHER_M0_EXPRESS) || defined(ARDUINO_SAMD_FEATHER_M0)  // Feather M0 w/Radio
  #define RFM95_CS    8
  #define RFM95_INT   3
  #define RFM95_RST   4

#elif defined(ARDUINO_ADAFRUIT_FEATHER_RP2040_RFM)  // Feather RP2040 w/Radio
  #define RFM95_CS   16
  #define RFM95_INT  21
  #define RFM95_RST  17

#elif defined (__AVR_ATmega328P__)  // Feather 328P w/wing
  #define RFM95_CS    4  //
  #define RFM95_INT   3  //
  #define RFM95_RST   2  // "A"

#elif defined(ESP8266)  // ESP8266 feather w/wing
  #define RFM95_CS    2  // "E"
  #define RFM95_INT  15  // "B"
  #define RFM95_RST  16  // "D"

#elif defined(ARDUINO_ADAFRUIT_FEATHER_ESP32S2) || defined(ARDUINO_NRF52840_FEATHER) || defined(ARDUINO_NRF52840_FEATHER_SENSE)
  #define RFM95_CS   10  // "B"
  #define RFM95_INT   9  // "A"
  #define RFM95_RST  11  // "C"

#elif defined(ESP32)  // ESP32 feather w/wing
  #define RFM95_CS   33  // "B"
  #define RFM95_INT  27  // "A"
  #define RFM95_RST  13

#elif defined(ARDUINO_NRF52832_FEATHER)  // nRF52832 feather w/wing
  #define RFM95_CS   11  // "B"
  #define RFM95_INT  31  // "C"
  #define RFM95_RST   7  // "A"

#endif

#define RF95_FREQ 915

RH_RF95 rf95(RFM95_CS, RFM95_INT);

//create boolean for when we are waiting for input
boolean standby = true;
boolean detach = false;
boolean arm = false;
boolean rso = false;
//for stuff being printed to serial monitor
unsigned long messageDelayTime = 100;
unsigned long lastMessage = 0;

char RSOPermission[] = "RSO";
char armMessage[] = "ARM";
char detachMessage[] = "DETACH";

void setup() {
  // put your setup code here, to run once:
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  Serial.begin(9600);
  while (!Serial) delay(1);
  delay(100);

  Serial.println("Feather LoRa TX Test!");

  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  while (!rf95.init()) {
    Serial.println("LoRa radio init failed");
    Serial.println("Uncomment '#define SERIAL_DEBUG' in RH_RF95.cpp for detailed debug info");
    while (1);
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);

  // Defaults after init are 434.0MHz, 13dBm, Bw = 125 kHz, Cr = 4/5, Sf = 128chips/symbol, CRC on

  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);

}

int16_t packetnum = 0;

char input = 'a';
char listen = 'b';

void loop() {
  // put your main code here, to run repeatedly:
  
  // if(Serial.available()>0){
     listen = Serial.read();
     if(listen == '?'){
       input = listen;
     } else if(listen == '$'){
       input = listen;
     } else if(listen == ')'){
       input = listen;
     }
  // }

  while (standby){
    if (Serial.available() > 0){
      //input = Serial.read();
      Serial.print("input: ");
      Serial.println(input);
      standby = false;
    } else {
      if (millis() - messageDelayTime >= lastMessage){
        Serial.println("Standing by...");
      }
    }
  }
 //need to check for new input to swtich mode
  if (input == '$'){
    detach = true;
    transmit(detachMessage, 6);
  }
    
  
  if (input == '?'){
    arm = true;
    transmit(armMessage, 3);
  } 

  if (input == ')'){
    rso = true;
    transmit(RSOPermission, 3);
  } 

  //if (Serial.read() != '$' && Serial.read() != '?') {
    //something for invalid input
  //}

}

  void transmit(char message[], int length){
    delay(100);
    Serial.print("----------Sending "); 
    Serial.print(message);
    Serial.println("-----------");
    delay(10);
    rf95.send((uint8_t*)message, length);

    Serial.println("Waiting for packet to complete...");
    delay(10);
    rf95.waitPacketSent();

    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);

    Serial.println("Waiting for reply...");
    if (rf95.waitAvailableTimeout(100)) {
      // Should be a reply message for us now
      if (rf95.recv(buf, &len)) {
        Serial.print("Got reply: ");

        for (int i=0; i<len; ++i) {
          Serial.print((char)buf[i]);
        }
        Serial.println();

        Serial.print("RSSI: ");
        Serial.println(rf95.lastRssi(), DEC);
      } else {
        Serial.println("Receive failed");
      }
    } else {
      Serial.println("No reply, is there a listener around?");
    }
  }

