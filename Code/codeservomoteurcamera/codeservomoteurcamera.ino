#include "Servo.h"

Servo servo; // création de l'objet "servo"
int angle=0;
void setup() {
   servo.attach(10); // attache le servo au pin spécifié
}

void loop() {
  for (angle = 0; angle <= 180; angle += 1) {
    servo.write(angle);
  delay(30);
}
 // And back from 180 to 0 degrees:
  for (angle = 180; angle >= 0; angle -= 1) {
    servo.write(angle);
  delay(30);
}
}