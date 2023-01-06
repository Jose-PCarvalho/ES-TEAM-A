#include <Arduino.h>

#ifndef Buzzer_H
#define Buzzer_H

class Buzzer
{
    private:
        uint8_t pin;
        unsigned long runTime;
        uint8_t state;
        unsigned long timer;
    public:
        Buzzer(uint8_t pin);
        ~Buzzer();
        //
        void controller();
        void beat(unsigned long time);
};
#endif
