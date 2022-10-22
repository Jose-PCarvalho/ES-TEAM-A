#include <Arduino.h>

#ifndef POWER_H
#define POWER_H

class Power
{
    private:
        float energyConsumed;

    public:
        Power(/* args */);
        ~Power();
        //
        void controller();
};

#endif