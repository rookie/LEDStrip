#include "LEDStrip.h"


LEDStrip::LEDStrip() {
    clear();
}

int LEDStrip::set(int position, long color) {
    //set an led to a specific color
    if(position >= STRIP_LENGTH) return -1;
    if(position <  0) return -1;
    
    strip_colors[position] = color;
}

void LEDStrip::clear() {
    //clear ledstrip buffer
    for(int i = 0 ; i < STRIP_LENGTH ; i++)
        strip_colors[i] = 0;
}

void LEDStrip::flush() {
    //flush ledstrip buffer to hardware
    
}