#include "Fan.h"

/**
 * @brief Construct a new Fan:: Fan object
 * 
 */
Fan::Fan()
{
    pin=0;
    state=0;
    senseIndex=0;
    positiveLogic=true;
    onTemp=0;
    offTemp=0;
}
/**
 * @brief Destroy the Fan:: Fan object
 * 
 */
Fan::~Fan()
{
}
/**
 * @brief Set the Pin to which fan is connected
 * 
 * @param pin Pin number
 */
void Fan::setPin(uint8_t pin)
{
    this->pin=pin;
}
/**
 * @brief Set the Logic
 * 
 * @param logic If true use positive logic
 */
void Fan::setLogic(bool logic)
{
    positiveLogic=logic;
}
/**
 * @brief Set temperature to trun on the fan
 * 
 * @param temp Desiered temperature in celcius
 */
void Fan::setOnTemp(float temp)
{
    onTemp=temp;
}
/**
 * @brief Set temperature to turn off the fan
 * 
 * @param temp Desiered temperature in celcius
 */
void Fan::setOffTemp(float temp)
{
    offTemp=temp;
}
/**
 * @brief Set the Sensor Index 
 * 
 * @param index The index of the temperature sensor to use
 */
void Fan::setSensorIndex(uint8_t index)
{
    senseIndex=index;
}
/**
 * @brief Set function pointer to compute the temperature
 * 
 * @param calcTempFunc The pointer
 */
void Fan::setCalcTempFunc(float (*calcTempFunc)(uint8_t))
{
    calcTemp=calcTempFunc;
}
/**
 * @brief Returns the current state of the fan
 * 
 * @return true If fan is on
 * @return false If off
 */
bool Fan::getFanStatus()
{
    return fanOn;
}
/**
 * @brief State machine to control the Fan
 * 
 */
void Fan::controller()
{
    if(state==0)
    {
        if(calcTemp(senseIndex) > onTemp)
        {
            // Turn fan on
            state=1;
        }            
    }
    else if(state==1)
    {
        if(calcTemp(senseIndex) < offTemp)
        {
            // Turn fan off
            state=0;
        }            
    }
    digitalWrite(pin, (state==0)^positiveLogic);
}