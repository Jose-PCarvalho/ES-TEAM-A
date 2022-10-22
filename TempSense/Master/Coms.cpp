#include "Wire.h"
#include "Arduino.h"
#include "HardwareSerial.h"
#include "Coms.h"

/**
 * @brief Constructor
 * 
 */
Coms::Coms()
{
    monitorAddr=0;
}
/**
 * @brief Destroy the Coms:: Coms object
 * 
 */
Coms::~Coms()
{

}
/**
 * @brief Set addresses and initialize coms
 * 
 */
void Coms::begin(int monitorAddr)
{
    this->monitorAddr=monitorAddr;
    Wire.begin();
}
/**
 * @brief Get temperature from sensor x
 * 
 * @param sensor The number of the sensor starting at 0
 * @return float The temperature measured by the sensor in Celcius
 */
float Coms::getTempX(uint8_t sensor)
{
  return this->getFloatParameter(GET_TEMP_BASE+sensor);
}
/**
 * @brief Get all the temperature readings
 * 
 * @return struct Temp A structure with the information
 */
float* Coms::getTemps()
{
    float *ret=calloc(N_SENSORS, sizeof(float));
    uint8_t sensor;
    for(sensor=0; sensor<N_SENSORS; sensor++)
      ret[sensor]=this->getTempX(sensor);
    return ret;
}
/**
 * @brief Get Current reading
 * 
 * @return float The current read in Ampere
 */
float Coms::getCurrent()
{
  return this->getFloatParameter(GET_CURRENT);
}
/**
 * @brief get Voltage reading
 * 
 * @return float Voltage red on Volt
 */
float Coms::getVoltage()
{
  return this->getFloatParameter(GET_VOLTAGE);
}
/**
 * @brief Get Energy spent
 * 
 * @return float The energy spent in Wh
 */
float Coms::getEnergy()
{
  return this->getFloatParameter(GET_ENERGY);
}
/**
 * @brief Get Run Time, the time since last turn on
 * 
 * @return unsigned int Time in senconds
 */
long Coms::getRunTime()
{
  return this->getLongParameter(GET_RUNTIME);
}
/**
 * @brief Get estyimated time to live, based on run time,
 * energy consumed ad total energy
 * 
 * @return unsigned int Time estimation in seconds
 */
long Coms::gerTimeToLive()
{
  return this->getLongParameter(GET_TIME_TO_LIVE);
}
/**
*/
float Coms::getFloatParameter(char code)
{
  String resp="";
  unsigned long timer=millis();
  // Send command
  Wire.beginTransmission(monitorAddr);
  Wire.write(code);
  Wire.endTransmission();
  // Request Answer
  Wire.requestFrom(monitorAddr, FLOAT_LEN);
  while(!Wire.available())
  {
    delay(1);
    if(millis()-timer>3000)
      return TIMEOUT_ERROR;
  }  
  while(Wire.available())
    resp+=(char)Wire.read();
  return resp.toFloat();
}
/**
*/
long Coms::getLongParameter(char code)
{
  String resp="";
  unsigned long timer=millis();
  // Send command
  Wire.beginTransmission(monitorAddr);
  Wire.write(code);
  Wire.endTransmission();
  // Request Answer
  Wire.requestFrom(monitorAddr, LONG_LEN);
  while(!Wire.available())
  {
    delay(1);
    if(millis()-timer>3000)
      return TIMEOUT_ERROR;
  }  
  while(Wire.available())
    resp+=(char)Wire.read();
  return resp.toInt();
}

