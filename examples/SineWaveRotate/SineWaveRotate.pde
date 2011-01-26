#include <LEDStrip.h>

LEDStrip ledStrip = LEDStrip();

int ledPin = 13; //On board LED

const long sinArray[STRIP_LENGTH] = { 128, 152, 176, 198, 218, 233, 245, 253,
                                      255, 253, 245, 234, 218, 198, 176, 153,
                                      128, 103,  79,  57,  38,  22,  10,   3,
                                        0,   2,  10,  21,  37,  56,  78, 102};

void setup() {
  pinMode(ledPin, OUTPUT);
  
  initSine(RED);

  delay(2000);
}

void loop() {

  digitalWrite(ledPin, HIGH);   // set the LED on
  
  ledStrip.rotateDown();
  ledStrip.flush(); //Push the current color frame to the strip
  
  digitalWrite(ledPin, LOW);    // set the LED off
  
  delay(250);                 //  8 second cycle
  //delay(125);                 //  4 second cycle
  //delay(32);                  // ~1 second cycle
}

void initSine(long color_mask){
  long color;
  
  for(int i = 0; i < STRIP_LENGTH; i++) {
    color  = sinArray[i]<<16 | sinArray[i]<<8 | sinArray[i];
    color &= color_mask;
    ledStrip.set(i, color);    
  }
}