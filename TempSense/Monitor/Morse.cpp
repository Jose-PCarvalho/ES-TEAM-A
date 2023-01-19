#include "Arduino.h"
#include "Morse.h"


/**
* @brief Construct a new Heart Beat:: Heart Beat object
* 
* @param pin Pin that connects to the LED
*/
Morse::Morse(uint8_t pin)
{
    state=0;
    timer=0;
    signalDuration=0;
    codeLen=0;
    index=0;
    this->pin=pin;
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
    stopController=false;
}
/**
* @brief Destroy the Heart Beat:: Heart Beat object
* 
*/
Morse::~Morse()
{
}
/**
 * @brief Set code to be sound
 * 
 * @param morseMsg The msg to be sent
 */
void Morse::setMsg(String morseMsg)
{
    msg=morseMsg+"*";
    msg.replace(" / ", "/");
    codeLen=msg.length();
}
/**
 * @brief Run or stop controller state machine
 * 
 * @param run If true run controller, else stop
 */
void  Morse::runController(bool run)
{
    stopController=!run;
}
/**
* @brief Main controller for morse. 
* Must be called every loop
* 
*/
void Morse::controller()
{
    if(stopController)
        return;
    curr=millis();
    if(state==0)
    {
        if (msg[index] == '-')
        {
            signalDuration=3*DIT_DURATION;
            timer=curr;
            state=1;
        }
        else if (msg[index] == '.')
        {
            signalDuration=DIT_DURATION;
            timer=curr;
            state=1;
        }
        else if (msg[index] == ' ')
        {
            signalDuration=3*DIT_DURATION;
            timer=curr;
            state=2;
        }
        else if (msg[index] == '/')
        {
            signalDuration=7*DIT_DURATION;
            timer=curr;
            state=2;
        }
        else if (msg[index] == '*')
        {
            // Clear message
            msg="";
            index=0;
        }
    }
    else if(state==1)
    {
        if(curr-timer>signalDuration)
        {
            if(msg[index] != '/' && msg[index] != ' ')
            {
                signalDuration=DIT_DURATION;
                timer=curr;
                state=2;
            }
            else
            {
                index++;
                state=0;
            }
            
        }
    }
    else if(state==2)
    {
        if(curr-timer>signalDuration)
        {
            index++;
            state=0;
        }
    }
    digitalWrite(pin, state==1);  
}
