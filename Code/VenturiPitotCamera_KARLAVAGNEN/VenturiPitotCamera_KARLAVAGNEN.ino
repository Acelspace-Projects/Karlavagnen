#define DEBUG
#define ventPin A0
#define pitotPin A1
#define DELAY_MESURE 100 // ms
#define DELAY_SERVO   25 // ms

#include <Servo.h>
#include <SPI.h>
#include <SD.h>

Servo servo;
int angle = 0;

#define ROTATION_POSITIVE true
#define ROTATION_NEGATIVE false
bool servo_sens = ROTATION_POSITIVE;

File dataFile;

unsigned long prev_mes_t    = 0;
unsigned long timestamp_mes = 0;
int val_venturi             = 0;
int val_pito                = 0;

unsigned long prev_servo_t;
unsigned long timestamp_servo;

void writeData(unsigned long timestamp, int pito, int venturi) {
  dataFile.print(timestamp);
  dataFile.print("\t");
  dataFile.print(venturi);
  dataFile.print("\t");
  dataFile.println(pito);
  dataFile.flush();
  #ifdef DEBUG
    Serial.print(timestamp);
    Serial.print("\t");
    Serial.print(venturi);
    Serial.print("\t");
    Serial.println(pito);
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

  dataFile = SD.open("DATA.TXT", FILE_WRITE);

  #ifdef DEBUG
    Serial.println("Done!");
  #endif
}

void loop() {
  timestamp_mes = millis();
  // Mesure pito & venturi
  if ((timestamp_mes - prev_mes_t) >= DELAY_MESURE){
    val_venturi = analogRead(ventPin);
    val_pito    = analogRead(pitotPin);
    writeData(timestamp_mes, val_venturi, val_pito);
    prev_mes_t = timestamp_mes;
  }
  timestamp_servo = timestamp_mes;
  if ((timestamp_servo - prev_servo_t) >= DELAY_SERVO){
    servo.write(angle);
    if (angle == 180)
      servo_sens = ROTATION_NEGATIVE;
    else if (angle == 0)
      servo_sens = ROTATION_POSITIVE;
    if (servo_sens == ROTATION_POSITIVE)
      angle++;
    else
      angle--;
    prev_servo_t = timestamp_servo;
  }
}
