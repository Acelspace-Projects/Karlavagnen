#define DEBUG
#define tensioPin A0

#include <SPI.h>
#include <SD.h>

void setup() {
  #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Initialising...");
  #endif

  SD.begin(4);

  pinMode(tensioPin, INPUT);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {
  File dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifndef DEBUG
    if (dataFile) {
      dataFile.print(analogRead(tensioPin));
      dataFile.close();
    }
    else {
      Serial.println("ERROR: Failed to open DATA.TXT");
    }
  #else
    dataFile.print(analogRead(tensioPin));
    dataFile.close();
  #endif
  
}
