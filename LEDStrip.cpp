#include "LEDStrip.h"


LEDStrip::LEDStrip() {
    setPins(3, 2); // 2, Red wire (not the red 5V wire!)
                   // 3, Green wire
    clear();
}

LEDStrip::LEDStrip(int clock_pin, int data_pin) {
    setPins(clock_pin, data_pin);
    clear();
}

void LEDStrip::setPins(int clock_pin, int data_pin) {
    SDI = data_pin;
    CKI = clock_pin;
    pinMode(SDI, OUTPUT);
    pinMode(CKI, OUTPUT);
}

int LEDStrip::set(int position, long color) {
    //set an led to a specific color
    if(position >= STRIP_LENGTH) return -1;
    if(position <  0) return -1;
    
    strip_colors[position] = color;
    return 0;
}

long LEDStrip::get(int position) {
    return strip_colors[position];
}

void LEDStrip::clear() {
    clear(0);
}

void LEDStrip::clear(long color) {
    //clear ledstrip buffer and fill with a specific color
    for(int i = 0 ; i < STRIP_LENGTH ; i++)
        strip_colors[i] = color;
}

//Takes the current strip color array and pushes it out
void LEDStrip::flush() {
  //Each LED requires 24 bits of data
  //MSB: R7, R6, R5..., G7, G6..., B7, B6... B0 
  //Once the 24 bits have been delivered, the IC immediately relays these bits to its neighbor
  //Pulling the clock low for 500us or more causes the IC to post the data.

  for(int LED_number = 0 ; LED_number < STRIP_LENGTH ; LED_number++) {
    long this_led_color = strip_colors[LED_number]; //24 bits of color data

    for(byte color_bit = 23 ; color_bit != 255 ; color_bit--) {
      //Feed color bit 23 first (red data MSB)
      
      digitalWrite(CKI, LOW); //Only change data when clock is low
      
      long mask = 1L << color_bit;
      //The 1'L' forces the 1 to start as a 32 bit number, otherwise it defaults to 16-bit.
      
      if(this_led_color & mask) 
        digitalWrite(SDI, HIGH);
      else
        digitalWrite(SDI, LOW);
  
      digitalWrite(CKI, HIGH); //Data is latched when clock goes high
    }
  }

  //Pull clock low to put strip into reset/post mode
  digitalWrite(CKI, LOW);
  delayMicroseconds(500); //Wait for 500us to go into reset
}



long LEDStrip::shiftDown() {
    //shift all the current colors down one spot on the strip
    //return the color shifted out
    int i;
    long lastColor = strip_colors[STRIP_LENGTH - 1];
    
    for(i = (STRIP_LENGTH - 1) ; i > 0 ; i--)
        strip_colors[i] = strip_colors[i - 1];
        
    return lastColor;
}

void LEDStrip::rotateDown() {
    long color = shiftDown();
    set(0, color);
}

long LEDStrip::shiftUp() {
    //shift all the current colors up one spot on the strip
    //return the color shifted out
    int i;
    long firstColor = strip_colors[0];
    
    for(i = 0 ; i < (STRIP_LENGTH - 1) ; i++)
        strip_colors[i] = strip_colors[i + 1];
        
    return firstColor;
}

void LEDStrip::rotateUp() {
    long color = shiftUp();
    set(STRIP_LENGTH - 1, color);
}


