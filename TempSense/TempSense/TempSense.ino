#include "Temp.h"

#define N_SENSORS 4
// Sensors are all the same in this case#define RSER 
#define RSER  47000
#define R25   68000
#define BETA  4600 



Temp sensors[N_SENSORS];
uint8_t index;
String compiledTemp;

void setup()
{
  Serial.begin(9600);
  // Initialize all sensors
  for(index=0; index<N_SENSORS; index++)
  {
    sensors[index].setRser(RSER);
    sensors[index].setBeta(BETA);
    sensors[index].setR25(R25);
    sensors[index].setPin(index);    
  }
}

void loop()
{
  // Periodicly print temperature in all sensors
  compiledTemp="Temp Read: ";
  for(index=0; index<N_SENSORS; index++)
    compiledTemp+="Temp"+String(index)+"="+String(sensors[index].calc_temp())+" | ";
  Serial.println(compiledTemp);
  delay(1000);
}
