#include "Sistema.h"

/******************************************/
/*               Variables                */
/******************************************/
temp_param tp;
/******************************************/
/*            Public Funtions             */
/******************************************/
void Sistem::init_temp(short unsigned int Beta, byte vcc, byte R25, byte Rd)
{
  tp.Rref = (float)R25 * 1000 * exp(-(float)Beta / (25 + 275.15));
  tp.Beta = Beta;
  tp.vcc = vcc;
  tp.R25 = R25;
  tp.Rd = Rd;
}

temp Sistem::check_temp()
{
  temp ret;
  ret.arduino = Sistem::calc_temp(0);
  ret.driver = Sistem::calc_temp(1);
  ret.suply = Sistem::calc_temp(2);
  return ret;
}
/******************************************/
/*            Private Funtions            */
/******************************************/
float Sistem::calc_temp(byte pin)
{
  float V_div_t = 0;
  float R_NTC = 0;
  V_div_t = (float)tp.vcc * ((float)(analogRead(pin) + 1) / (float)1024);
  R_NTC = -tp.Rd * 1000 + (float)tp.vcc * (float)tp.Rd * 1000 / V_div_t;
  return tp.Beta / log(R_NTC / tp.Rref) - 275.15;
}
