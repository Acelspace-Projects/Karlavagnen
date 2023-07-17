#define DEBUG
#define ventPin A0
#define pitotPin A2

#include <Servo.h>
#include <SPI.h>
#include <SD.h>

Servo servo;
int angle=0;

void setup() {
  #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Initialising...");
  #endif

  servo.attach(13);
  
  SD.begin(4);

  pinMode(ventPin, INPUT);
  pinMode(pitotPin, INPUT);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {

  for (angle = 0; angle <= 180; angle += 1) {
    servo.write(angle);
    delay(10);
  }
  delay(300);
  for (angle = 180; angle >= 0; angle -= 1) {
    servo.write(angle);
    delay(10);
  }
  delay(300);

  File dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifdef DEBUG
    if (dataFile) {
      dataFile.print(analogRead(ventPin));
      dataFile.print("\t");
      dataFile.print(analogRead(pitotPin));
      dataFile.close();
    }
    else {
      Serial.println("ERROR: Failed to open DATA.TXT");
    }
  #else
    dataFile.print(analogRead(ventPin));
    dataFile.print("\t");
    dataFile.print(analogRead(pitotPin));
    dataFile.close();
  #endif
}
