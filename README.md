RGB LED Strip
=============

This is an Arduino library to control the RGB LED Strip from Sparkfun.com

[http://www.sparkfun.com/products/10312](http://www.sparkfun.com/products/10312)


Installation
------------

1. Download zip
2. In your Arduino folder create 'libraries' folder
3. Unzip into libraries file
4. Rename folder to LEDStrip

It will now show up in _Arduino, Examples, LEDStrip_ and can be used in your own Arduino Sketches

Let me know if you have any problems

Usage
-----
	LEDStrip ledStrip = LEDStrip();
	ledStrip.set(0, 0xFF0000); //red
	ledStrip.set(1, 0x00FF00); //green
	ledStrip.set(2, 0x0000FF); //blue
	ledStrip.flush(); //write buffer out to hardware
	ledStrip.shiftDown();
	ledStrip.flush();
	ledStrip.clear(); //clear all to zero
	ledStrip.flush();


Examples
--------

1. LED_Strip_Example - This is the original unmodified example from Nate at Sparkfun
2. ShiftRandom (needs to be tested) - A functional copy of the Sparkfun example using the LEDStrip library
3. SineWaveRotate (needs testing) - Rotates a red sine wave pattern down the strip
4. ColorBlink (needs testing) - Blinks the entire strip through 7 main colors 
