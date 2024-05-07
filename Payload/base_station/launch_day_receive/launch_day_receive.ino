#include <RadioLib.h>
// Define the pin mapping for the RFM95 LoRa module
#define RFM95_CS    16  // Chip select pin
#define RFM95_RST   17  // Reset pin
#define RFM95_IRQ   21  // Interrupt pin, connected to DIO0
#define RFM95_GPIO  22  // Additional GPIO, connected to DIO1
SX1276 radio = new Module(RFM95_CS, RFM95_IRQ, RFM95_RST, RFM95_GPIO);
const char* ENUM_NAMES[] = {
  "XACCEL_BNO",
  "YACCEL_BNO",
  "ZACCEL_BNO",
  "TEMPERATURE_BME",
  "ALTITUDE_BME",
  "VOLATILE_COMPONENT"
};
void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  float transmitPower = 20;
  float rf_channel = 4;
  float currentFrequency = 437.550 + rf_channel * 0.1;
  //LoRa Setup
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);
  int state = radio.begin();
  if (state == RADIOLIB_ERR_NONE) {
    // no error
    Serial.println(F("Initialization successful!"));
  } else {
    Serial.println("LoRa Init Failed");
  }
  // set transmit power
  state = radio.setOutputPower(transmitPower, false);
  if(state == RADIOLIB_ERR_NONE) {
    Serial.print(F("Transmit Power set to: "));
    Serial.print(transmitPower);
    Serial.println(F(" dBm"));
  } else {
    Serial.print(F("Setting Output Power Failed:, code "));
    Serial.println(state);
  }
  state = radio.setFrequency(currentFrequency);
  if(state == RADIOLIB_ERR_NONE) {
    Serial.print(F("Frequency set to: "));
    Serial.print(currentFrequency);
    Serial.println(F(" MHz"));
  } else {
    Serial.print(F("Setting frequency failed, code "));
    Serial.println(state);
  }
}
void loop() {
  // Check if there is a message received.
  String str;
  int state = radio.receive(str);
  Serial.println(state);
  if (state == RADIOLIB_ERR_NONE) {
    // A message was received!
    Serial.println("Received message: '");
    //Serial.print(str);
    //Serial.println("'");
     // Split the received data using the comma as a delimiter
    char *token = strtok(const_cast<char*>(str.c_str()), ",");
    int index = 0;
    while (token != NULL && index < 6) {
      // Print the component name and its corresponding value
      Serial.print(ENUM_NAMES[index]);
      Serial.print(", Value: ");
      Serial.println(token);
      // Move on to the next token
      token = strtok(NULL, ",");
      index++;
    }
  } else if (state != RADIOLIB_ERR_RX_TIMEOUT) {
    // An error occurred while attempting to receive a message.
    Serial.print("Receive failed, error code: ");
    Serial.println(state);
  }
}