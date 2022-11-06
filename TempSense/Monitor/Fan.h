#include <Arduino.h>

#ifndef FAN
#define FAN

class Fan
{
    private:
        uint8_t state;
        uint8_t pin;
        uint8_t senseIndex;
        float onTemp;
        float offTemp;
        float (*calcTemp)(uint8_t);
        bool fanOn;
        bool positiveLogic;
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
        //
        bool getFanStatus();
        //
        void controller();
};
#endif
