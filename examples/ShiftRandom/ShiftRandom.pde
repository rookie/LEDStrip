#include <LEDStrip.h>

LEDStrip ledStrip = LEDStrip();

int ledPin = 13; //On board LED

void setup() {
  pinMode(ledPin, OUTPUT);
  
  randomSeed(analogRead(0));
  
  //Pre-fill the color array with known values
  ledStrip.set(0, 0xFF0000); //Bright Red
  ledStrip.set(1, 0x00FF00); //Bright Green
  ledStrip.set(2, 0x0000FF); //Bright Blue
  ledStrip.set(3, 0x010000); //Faint red
  ledStrip.set(4, 0x800000); //1/2 red (0x80 = 128 out of 256)
  ledStrip.flush(); //Push the current color frame to the strip
  
  delay(2000);
}

void loop() {
  addRandom();
  ledStrip.flush(); //Push the current color frame to the strip

  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(250);                  // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(250);                  // wait for a second
}

//Throws random colors down the strip array
void addRandom(void) {
  int x;
  
  ledStrip.shiftDown();
   
  //Now form a new RGB color
  long new_color = 0;
  for(x = 0 ; x < 3 ; x++){
    new_color <<= 8;
    new_color |= random(0xFF); //Give me a number from 0 to 0xFF
    //new_color &= 0xFFFFF0; //Force the random number to just the upper brightness levels. It sort of works.
  }
  
  ledStrip.set(0, new_color); //Add the new random color to the strip
}