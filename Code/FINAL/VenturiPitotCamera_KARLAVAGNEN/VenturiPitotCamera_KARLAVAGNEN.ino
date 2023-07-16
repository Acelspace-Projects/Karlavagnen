#include <Servo.h>
#include <SPI.h>
#include <SD.h>

Servo servo; // création de l'objet "servo"
int angle=0;

void setup() {
  servo.attach(13); // attache le servo au pin spécifié

  pinMode(A0, INPUT);
  pinMode(A2, INPUT);
  SD.begin(4);
}

void loop() {
  for (angle = 0; angle <= 180; angle += 1) {
    servo.write(angle);
    delay(10);
  }
  delay(300);
  // And back from 180 to 0 degrees:
  for (angle = 180; angle >= 0; angle -= 1) {
    servo.write(angle);
    delay(10);
  }
  delay(300);

  File dataFile = SD.open("DATA.TXT", FILE_WRITE);

  if (dataFile) {
    dataFile.print(analogRead(A0));
    dataFile.print("\t");
    dataFile.print(analogRead(A2));
    dataFile.close();
  }
  else {
    Serial.println("error opening DATA.TXT");
  }
}
