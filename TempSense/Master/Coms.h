#include <Arduino.h>
#include <Wire.h>

#ifndef COMS_H
#define COMS_H

#define N_TEMP_SENSORS      4
#define N_WATER_SENSORS     2
//
#define GET_CURRENT         1
#define GET_VOLTAGE         2
#define GET_ENERGY          3
#define GET_RUNTIME         4
#define GET_TIME_TO_LIVE    5
#define GET_TEMP            6
#define GET_WATER           7
//
#define ERROR_STRING        "ERROR"
#define TIMEOUT_ERROR       -200
#define FLOAT_LEN           8
#define LONG_LEN            11

class Coms
{
    private:
        uint8_t monitorAddr;
        float getFloatParameter(uint8_t code);
        long getLongParameter(uint8_t code);
        String requestParameter(uint8_t len);
        void sendCommand(uint8_t code);
    public:
        
        Coms();
        ~Coms();
        //
        void begin(int monitorAddr);
        float getTempX(uint8_t sensor);
        float* getTempAll();
        bool getWaterX(uint8_t sensor);
        bool getWaterAll();
        float getCurrent();
        float getVoltage();
        float getEnergy();
        long getRunTime();
        long getTimeToLive();
};
#endif
