#include "Coms.h"


#define INO_ADDR  8
#define PI_ADDR   9


Coms coms;
int index;
float *temps;

void setup() 
{
  Serial.begin(500000);
  coms.begin(INO_ADDR);
}

void loop() 
{
  // All temps test
  Serial.print("Temp Readings: ");
  temps=coms.getTemps();
  uint8_t sensor;  
  for(sensor=0; sensor<N_SENSORS; sensor++)
    Serial.print("T"+String(sensor)+":"+String(temps[sensor], 4)+" | ");
  free(temps);
  // Voltage test
  Serial.println("Voltage: "+String(coms.getVoltage(), 4)+" V");
  // Current test
  Serial.println("Current: "+String(coms.getCurrent(), 4)+" A");
  // Get Energy
  Serial.println("Energy consumed: "+String(coms.getEnergy(), 4)+" Wh");
  // Get Runtime
  Serial.println("Run time: "+String(coms.getRunTime())+" s");
  // Get Time to Live
  Serial.println("Time to Live: "+String(coms.gerTimeToLive())+" s\n");
  delay(3000);
}
