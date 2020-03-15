#include <Servo.h>

Servo myServo;
 
 byte val; // Data received from the serial port
 //int value;
 void setup() {
 myServo.attach(4);
 Serial.begin(9600); // Start serial communication at 9600 bps
 }
 
 void loop() {
 while (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 }
  //value = val;
  myServo.write(val);
 }
