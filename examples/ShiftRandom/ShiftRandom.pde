#include <LEDStrip.h>

LEDStrip ledStrip = LEDStrip();

void setup() {
  
}

// the loop() method runs over and over again,
// as long as the Arduino has power

void loop() {
  ledStrip.set(0, 0xFF0000);
  ledStrip.flush();
  delay(250);                  // wait for a second
}