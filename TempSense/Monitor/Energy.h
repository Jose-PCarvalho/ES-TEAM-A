#include <Arduino.h>

#ifndef POWER_H
#define POWER_H

#define INTEGRATION_DELTA   10      // in ms
#define TOTAL_CAPACITY      61.05   // Wh

class Energy
{
    private:
        float energyConsumed;
        float estimatedStartEnergy;
        // Voltage and Current function pointers
        float (*currFunc)();
        float (*voltFunc)();
    public:
        Energy(/* args */);
        ~Energy();
        //
        void begin(float (*voltageFunc)(), float (*currentFunc)());
        //
        void controller();
        //
        float estimatedStart();
        float energySpent();
};

#endif