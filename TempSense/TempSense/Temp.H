#include "Arduino.h"

typedef struct temperature
{
  float arduino;
  float driver;
  float suply;
} temp;

typedef struct temtemperature_paramameters
{
  byte vcc;
  byte R25;
  byte Rd;
  float Rref;
  short unsigned int Beta;
} temp_param;

class Sistem
{
  public:
    void init_temp(short unsigned int Beta, byte vcc, byte R25, byte Rd);
    void(*resetFunc) (void) = 0;
    temp check_temp();
  private:
    float calc_temp(byte pin);
};
