//Gina Gerace, 664765515, ggerac3
//Lab 9: Graphing with Processing
//The code is suppose to read in values from a potentiometer and a photoresistor
//  and send those values to be graphed in processing.
//I assume that the potentiometer and photoresistor read in values between 0 and 1023.
//  I also assume processing can read info from the arduino serial monitor.
//I used https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing#introduction,
//  https://www.arduino.cc/en/tutorial/potentiometer, https://www.instructables.com/id/How-to-use-a-photoresistor-or-photocell-Arduino-Tu/,
//  and https://www.arduino.cc/en/Tutorial/Graph as references.

//store pin numbers for the potentiometer and photoresistor
int potPin = A0;
int photoPin = A1;
void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(potPin));
  Serial.print(",");
  Serial.println(analogRead(photoPin));
  delay(100);
}
