#include <Arduino.h>

#ifndef Temp_H
#define Temp_H

#define MAX_VAL 1023  // Input reading max value
#define VCC     5.0 // Supply voltage


class Temp
{
  private:
    float r25;
    float rser;    
    float beta;
    uint8_t sensePin;


  public:
    Temp();
    ~Temp();
    //
    void setRser(float R);
    void setBeta(float B);
    void setR25(float R);
    void setPin(uint8_t pin);
    float calcTemp();
};
#endif