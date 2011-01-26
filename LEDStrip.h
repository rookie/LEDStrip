
#ifndef LEDSTRIP_H
#define LEDSTRIP_H

#include "WProgram.h"

#define STRIP_LENGTH 32 //32 LEDs on this strip


class LEDStrip {
  
  public:
    LEDStrip();
    LEDStrip(int clock_pin, int data_pin); //set your own clock and data pins
    int  set(int position, long color);    //save 'color' at 'position'
    long get(int position); //return color at 'position'
	void clear();     //clear buffer to zero
    void flush();     //write buffer to strip
    long shiftDown(); //shift all colors down one, return shifted out color
    long shiftUp();   //shift all colors up one, return shifted out color
    void rotateDown();//rotate all colors down one, wrapping around
    void rotateUp();  //rotate all colors up one, wrapping around

  private: 
    long strip_colors[STRIP_LENGTH];
    int SDI;
    int CKI;
    void setPins(int clock_pin, int data_pin);
};

#endif //LEDSTRIP_H
