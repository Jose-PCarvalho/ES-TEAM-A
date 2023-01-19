#include "Temp.h"

/**
 * @brief Constructor
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
 * @brief Destroy the Temp:: Temp object
 * 
 */
Temp::~Temp()
{
}
/**
 * @brief Set series resistor value 
 * 
 * @param R Resistor value in ohms
 */
void Temp::setRser(float R)
{
  rser=R;
}
/**
 * @brief Set Beta value
 * 
 * @param B value to be set
 */
void Temp::setBeta(float B)
{
  beta=B;
}
/**
 * @brief Set NTC resistenace at 25 degrees celcius
 * 
 * @param R value in ohms
 */
void Temp::setR25(float R)
{
  r25=R;
}
/**
 * @brief Set input pin used tyo make the reading (Analog pin)
 * 
 * @param pin pin number
 */
void Temp::setPin(uint8_t pin)
{
  pinMode(pin, INPUT);
  sensePin=pin;
}
/**
 * @brief Compute temperature at pin
 * 
 * @return float The temperature in Celcius
 */
float Temp::calcTemp()
{
  // Compute voltage at the analog input
  float vmeas=VCC*(float)analogRead(sensePin)/MAX_VAL;
  // Compute resistence of NTC
  float rmeas=vmeas*rser/(VCC-vmeas);
  // Calculate the inverse of the temperature in kelvin
  float denum=log(rmeas/r25)/beta + 1.0/298.15;
  // Compute temperature in Celcius
  return 1.0/denum - 273.15;
}
