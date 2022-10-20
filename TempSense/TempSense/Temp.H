#include "Arduino.h"

#define VCC 5

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
    void setRser(float R);
    void setBeta(float B);
    void setR25(float R);
    void setPin(uint8_t pin);
    float calc_temp();
};
