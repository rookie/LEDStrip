#include <LEDStrip.h>

LEDStrip ledStrip = LEDStrip();

void setup() {
  delay(2000);
}

void loop() {
  static int loop_index = 0;
  long color;
  
  switch(loop_index){
    default:
      loop_index = 0;
    case 0:
      color = RED;
      break;
    case 1:
      color = GREEN;
      break;
    case 2:
      color = BLUE;
      break;
    case 3:
      color = YELLOW;
      break;
    case 4:
      color = CYAN;
      break;
    case 5:
      color = MAGENTA;
      break;
    case 6:
      color = WHITE;
      break;
  }

  ledStrip.clear(color);
  ledStrip.flush(); //Push the current color frame to the strip

  delay(750);
  
  ledStrip.clear(BLACK);
  ledStrip.flush(); //Push the current color frame to the strip
  
  delay(250);
  
  loop_index++;
  loop_index %= 7;
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