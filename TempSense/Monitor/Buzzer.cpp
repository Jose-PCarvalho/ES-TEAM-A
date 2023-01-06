#include "Arduino.h"
#include "Buzzer.h"


/**
* @brief Construct a new Heart Beat:: Heart Beat object
* 
* @param pin Pin that connects to the LED
*/
Buzzer::Buzzer(uint8_t pin)
{
    state=0;
    timer=0;
    this->pin=pin;
    runTime=0;
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
}
/**
* @brief Destroy the Heart Beat:: Heart Beat object
* 
*/
Buzzer::~Buzzer()
{
}
/**
* @brief Main controller for heart beat. 
* Must be called every loop
* 
*/
void Buzzer::controller()
{
    // Idle state
    if(state==0)
    {
        if(runTime>0)
        {
            timer=millis();
            state=1;
        }
    }
    // On state
    else if(state==1)
    {
        if(millis()-timer>runTime)
        {
            runTime=0;
            state=0;
        }
    }
    // Write to LED
    digitalWrite(pin,state==1);
}
/**
* @brief 
* 
* @param time Time to remain on after function is called in milli seconds
*/
void Buzzer::beat(unsigned long time)
{
    runTime=time;
}
