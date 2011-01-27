//this example requires three potentiometers attached to
//  analog pins 0, 1, 2

#include <LEDStrip.h>

LEDStrip ledStrip = LEDStrip();

int redSensorPin = 0;    // select the input pin for the potentiometer
int greenSensorPin = 1;    // select the input pin for the potentiometer
int blueSensorPin = 2;    // select the input pin for the potentiometer

void setup() {
  delay(2000);
}

void loop() {
  static long old_color = 0;
  long color = 0;
  int redSensorValue, redOutputValue;
  int greenSensorValue, greenOutputValue;
  int blueSensorValue, blueOutputValue;
  
  //read potentiometers
  redSensorValue = analogRead(redSensorPin); //1024
  redOutputValue = map(redSensorValue, 0, 1023, 0, 255);
  
  greenSensorValue = analogRead(greenSensorPin); //1024
  greenOutputValue = map(greenSensorValue, 0, 1023, 0, 255);
  
  blueSensorValue = analogRead(blueSensorPin); //1024
  blueOutputValue = map(blueSensorValue, 0, 1023, 0, 255);
  
  color  = redOutputValue<<16 | greenOutputValue<<8  | blueOutputValue;

  //only update if the color has changed
  if(old_color != color) {
    old_color = color;
    ledStrip.clear(color);
    ledStrip.flush();
  }
  delay(250);

}
