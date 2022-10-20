#include "Temp.h"

/**
 * 
*/
Temp::Temp(/* args */)
{
  r25=0;
  rser=0;    
  beta=0;
  sensePin=0;
}
/**
 * 
*/
Temp::~Temp()
{
}
/**
 * Set series resistor in ohms
*/
void Temp::setRser(float R)
{
  rser=R;
}
/**
 * Set Beta value
*/
void Temp::setBeta(float B)
{
  beta=B;
}
/**
 * Set NTC resistenace at 25 degrees celcius, in ohms
*/
void Temp::setR25(float R)
{
  r25=R;
}
/**
 * Set input pin
*/
void Temp::setPin(uint8_t pin)
{
  sensePin=pin;
}
/**
 * Compute temperature at pin
*/
float Temp::calc_temp()
{
  // Compute voltage at the analog input
  float vmeas=VCC*(float)analogRead(sensePin)/1023.0;
  // Compute resistence of NTC
  float rmeas=vmeas*rser/(VCC-vmeas);
  // Calculate the inverse of the temperature in kelvin
  float denum=log(rmeas/r25)/beta + 1.0/298.15;
  // Compute temperature in Celcius
  return 1.0/denum - 273.15;
}
