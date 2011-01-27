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