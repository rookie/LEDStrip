
#ifndef LEDSTRIP_H
#define LEDSTRIP_H

#include "WProgram.h"

#define STRIP_LENGTH 32 //32 LEDs on this strip


class LEDStrip {
  
  public:
    LEDStrip();
    int set(int position, long color);
	void clear();
    void flush();

  private: 
    long strip_colors[STRIP_LENGTH];
		
};

#endif //LEDSTRIP_H