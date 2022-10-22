#include <Arduino.h>
#include <Wire.h>

#ifndef COMS_H
#define COMS_H

#define N_SENSORS           4
#define GET_CURRENT         '0'
#define GET_VOLTAGE         '1'
#define GET_ENERGY          '2'
#define GET_RUNTIME         '3'
#define GET_TIME_TO_LIVE    '4'
#define GET_TEMP_BASE       '5'
#define TIMEOUT_ERROR       -200
#define FLOAT_LEN           8
#define LONG_LEN            11
/**
* @brief This structure  re contains an array with all the temperatures
* and its length stored at len.
* 
*/
class Coms
{
    private:
        int monitorAddr;
        float getFloatParameter(char code);
        long getLongParameter(char code);
    public:
        
        Coms();
        ~Coms();
        //
        void begin(int monitorAddr);
        float getTempX(uint8_t sensor);
        float* getTemps();
        float getCurrent();
        float getVoltage();
        float getEnergy();
        long getRunTime();
        long gerTimeToLive();
};
#endif
