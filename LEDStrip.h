
#ifndef LEDSTRIP_H
#define LEDSTRIP_H

#include "WProgram.h"

#define STRIP_LENGTH 32 //32 LEDs on this strip

#define BLACK   0x000000
#define RED     0xFF0000
#define GREEN   0x00FF00
#define BLUE    0x0000FF
#define YELLOW  0xFFFF00
#define CYAN    0x00FFFF
#define MAGENTA 0xFF00FF
#define WHITE   0xFFFFFF


class LEDStrip {
  
  public:
    LEDStrip();
    LEDStrip(int clock_pin, int data_pin); //set your own clock and data pins
    int  set(int position, long color);    //save 'color' at 'position'
    long get(int position); //return color at 'position'
    void clear();     //clear buffer to zero
    void clear(long color);
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
