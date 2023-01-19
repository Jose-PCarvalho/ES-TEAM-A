#include <Arduino.h>

#ifndef Morse_H
#define Morse_H

#define DIT_DURATION    80

class Morse
{
    private:
        uint8_t pin;
        String msg;
        uint8_t state;
        unsigned long timer;
        unsigned long curr;
        unsigned long signalDuration;
        uint8_t index;
        uint8_t codeLen;
        bool stopController;
    public:
        Morse(uint8_t pin);
        ~Morse();
        //
        void setMsg(String morseMsg);
        void runController(bool run);
        //
        void controller();
};
#endif
