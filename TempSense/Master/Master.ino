#include "Coms.h"


#define INO_ADDR  8
#define PI_ADDR   9


Coms coms;
int indexx;
float *temps;

void setup() 
{
  Serial.begin(115200);
  coms.begin(INO_ADDR);
}

void loop() 
{/*
  // All temps test
  Serial.print("Temp Readings: ");
  temps=coms.getTempAll();
  uint8_t sensor;  
  for(sensor=0; sensor<N_TEMP_SENSORS; sensor++)
    Serial.print("T"+String(sensor)+":"+String(temps[sensor], 4)+" | ");
  free(temps);
  // All water test
  Serial.print("\nIndividual Water Readings: ");
  for(sensor=0; sensor<N_WATER_SENSORS; sensor++)
    Serial.print("WS"+String(sensor)+":"+String(coms.getWaterX(sensor)?"Wet":"Dry")+" | ");
  Serial.println("Or'ed Water Readings:"+String(coms.getWaterAll()?"Wet":"Dry"));*/
  // Voltage test
  Serial.println("Voltage: "+String(coms.getVoltage(), 4)+" V");
  // Current test
  Serial.println("Current: "+String(coms.getCurrent(), 4)+" A");
  // Get Energy
  Serial.println("Energy consumed: "+String(coms.getEnergy(), 4)+" Wh");
  // Get Runtime
  Serial.println("Run time: "+String(coms.getRunTime())+" s");
  // Get Time to Live
  Serial.println("Time to Live: "+String(coms.getTimeToLive())+" s\n");
  delay(10000);
}
