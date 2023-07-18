#define DEBUG
#define tensioPin A1

#include <SPI.h>
#include <SD.h>

void setup() {
  #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Initialising...");
  #endif

  SD.begin(10);

  pinMode(tensioPin, INPUT);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {
  File dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifdef DEBUG
    if (dataFile) {
      dataFile.println(analogRead(tensioPin));
      dataFile.close();
    }
    else {
      Serial.println("ERROR: Failed to open DATA.TXT");
    }
    Serial.println(analogRead(tensioPin));
  #else
    dataFile.print(analogRead(tensioPin));
    dataFile.close();
  #endif
  
  delay(200);
}
