// Karlavagnen project v1.0

// SPI and SD for MicroSD card writing
#include <SPI.h>
#include <SD.h>

#include <FastIMU.h>
#include <Wire.h>
BMI160 IMU;

calData calib = { 0 };  //Calibration data
AccelData accelData;    //Sensor data
GyroData gyroData;
MagData magData;

#include <Servo.h>

int val;
Servo myservo;

void setup() {
    Serial.begin(9600);

    // if (!SD.begin(10)) {
    //   Serial.println("MicroSD card failed, or not present");
    //   while (1);
    // }
    // Serial.println("MicroSD card initialized.");

    pinMode(A1, INPUT);

    Wire.begin();
    Wire.setClock(400000); //400khz clock

    Serial.println("FastIMU calibration & data example");
    IMU.init(calib, 0x68);
    Serial.println("Keep IMU level.");
    delay(1000);
    IMU.calibrateAccelGyro(&calib);
    Serial.println("Calibration done!");
    Serial.println("Accel biases X/Y/Z: ");
    Serial.print(calib.accelBias[0]);
    Serial.print(", ");
    Serial.print(calib.accelBias[1]);
    Serial.print(", ");
    Serial.println(calib.accelBias[2]);
    Serial.println("Gyro biases X/Y/Z: ");
    Serial.print(calib.gyroBias[0]);
    Serial.print(", ");
    Serial.print(calib.gyroBias[1]);
    Serial.print(", ");
    Serial.println(calib.gyroBias[2]);
    delay(1000);
    IMU.init(calib, 0x68);

    myservo.attach(12);
}

void loop() {
    IMU.update();
    IMU.getAccel(&accelData);
    Serial.print(accelData.accelX);
    Serial.print("\t");
    Serial.print(accelData.accelY);
    Serial.print("\t");
    Serial.print(accelData.accelZ);
    Serial.print("\t");
    IMU.getGyro(&gyroData);
    Serial.print(gyroData.gyroX);
    Serial.print("\t");
    Serial.print(gyroData.gyroY);
    Serial.print("\t");
    Serial.print(gyroData.gyroZ);
    Serial.print("\t");
    //Serial.print(); Serial.print("\t");
    // Serial.println(analogRead(A1));

    val += int(gyroData.gyroY/10);
    // val = map(val, 0, 1, 0, 180);
    Serial.print(val);
    Serial.print("\t");
    if(val>180){
      val=0;
    }
    if(val<0){
      val=180;
    }
    myservo.write(val);

    // open the file. note that only one file can be open at a time,
    // so you have to close this one before opening another.
    File dataFile = SD.open("DATA.TXT", FILE_WRITE);

    // if the file is available, write to it:
    if (dataFile) {
      //dataFile.print(); Serial.print("\t");
      dataFile.print(analogRead(A1));
      dataFile.close();
    }

    Serial.println();
    delay(100);
}
