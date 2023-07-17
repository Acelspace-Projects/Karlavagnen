#define DEBUG
#define ventPin A0
#define pitotPin A1

#include <Servo.h>
#include <SPI.h>
#include <SD.h>

Servo servo;
int angle = 0;

void writeData() {
  File dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifdef DEBUG
    if (dataFile) {
      dataFile.print(millis());
      dataFile.print("\t");
      dataFile.print(analogRead(ventPin));
      dataFile.print("\t");
      dataFile.println(analogRead(pitotPin));
      dataFile.close();
    }
    else {
      Serial.println("ERROR: Failed to open DATA.TXT");
    }
    Serial.print(millis());
    Serial.print("\t");
    Serial.print(analogRead(ventPin));
    Serial.print("\t");
    Serial.println(analogRead(pitotPin));
  #else
    dataFile.print(millis());
    dataFile.print("\t");
    dataFile.print(analogRead(ventPin));
    dataFile.print("\t");
    dataFile.println(analogRead(pitotPin));
    dataFile.close();
  #endif
}

void setup() {
  #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Initialising...");
  #endif

  servo.attach(9);
  
  SD.begin(10);

  pinMode(ventPin, INPUT);
  pinMode(pitotPin, INPUT);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {
  // Aller
  for (angle = 0; angle <= 180; angle += 1) {
    servo.write(angle);
    writeData();
    delay(10);
  }
  // Retour
  for (angle = 180; angle >= 0; angle -= 1) {
    servo.write(angle);
    writeData();
    delay(10);
  }
  // Delai
  for (angle = 0; angle <= 30; angle += 1) {
    writeData();
    delay(10);
  }
}
