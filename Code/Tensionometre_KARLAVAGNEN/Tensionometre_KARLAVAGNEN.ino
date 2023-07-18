#define DEBUG
#define tensioPin A1
#define DELAY_MESURE 50 // ms

#include <Adafruit_BMP085.h>
#include <SPI.h>
#include <SD.h>

Adafruit_BMP085 bmp;
File dataFile;

unsigned long prev_mes_t;
unsigned long timestamp;
int tensioVal;
int pressVal;

void setup() {
  #ifdef DEBUG
    Serial.begin(115200);
    Serial.println("Initialising...");
  #endif

  SD.begin(10);

  bmp.begin();

  pinMode(tensioPin, INPUT);

  dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {
  timestamp = millis();
  if ((timestamp - prev_mes_t) >= DELAY_MESURE){
    tensioVal = analogRead(tensioPin);
    pressVal = bmp.readPressure();

    #ifdef DEBUG
      if (dataFile) {
        dataFile.print(timestamp);
        dataFile.print("\t");
        dataFile.print(tensioVal);
        dataFile.print("\t");
        dataFile.println(pressVal);
        dataFile.flush();
      }
      else {
        Serial.println("ERROR: Failed to open DATA.TXT");
      }
      Serial.print(timestamp);
      Serial.print("\t");
      Serial.print(tensioVal);
      Serial.print("\t");
      Serial.println(pressVal);
    #else
      dataFile.print(timestamp);
      dataFile.print("\t");
      dataFile.print(tensioVal);
      dataFile.print("\t");
      dataFile.println(pressVal);
      dataFile.flush();
    #endif
    prev_mes_t = timestamp;
  }
}
