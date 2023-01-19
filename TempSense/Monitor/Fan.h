#include <Arduino.h>

#ifndef FAN
#define FAN

#define ON_OFF_TIME 10e3
#define MAX_SENSORS 4

class Fan
{
    private:
        uint8_t state;
        uint8_t pin;
        uint8_t senseIndex[MAX_SENSORS];
        uint8_t tempOn[MAX_SENSORS];
        uint8_t tempOff[MAX_SENSORS];
        uint8_t usedSensors;
        float onTemp;
        float offTemp;
        float (*calcTemp)(uint8_t);
        bool fanOn;
        bool positiveLogic;
        unsigned long timer;
        bool stopController;
    public:
        Fan();
        ~Fan();
        //
        void setPin(uint8_t pin);
        void setLogic(bool logic);
        void setOnTemp(float temp);
        void setOffTemp(float temp);
        void setSensorIndex(uint8_t index);
        void setCalcTempFunc(float (*calcTempFunc)(uint8_t));
        void runController(bool run);
        //
        bool getFanStatus();
        //
        void controller();
};
#endif
