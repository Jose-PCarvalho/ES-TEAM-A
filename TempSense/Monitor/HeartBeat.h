#include <Arduino.h>

#ifndef Heart_H
#define Heart_H

class HeartBeat
{
    private:
        uint8_t pin;
        unsigned long runTime;
        uint8_t state;
        unsigned long timer;
    public:
        HeartBeat(uint8_t pin);
        ~HeartBeat();
        //
        void controller();
        void beat(unsigned long time);
};
#endif
