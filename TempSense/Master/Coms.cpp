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
    Wire.begin(35,36,100000);
}
/**
 * @brief Get temperature from sensor x
 * 
 * @param sensor The number of the sensor starting at 0
 * @return float The temperature measured by the sensor in Celcius
 */
float Coms::getTempX(uint8_t sensor)
{
  this->sendCommand(GET_TEMP);
  return this->getFloatParameter(sensor);
}
/**
 * @brief Get all the temperature readings
 * 
 * @return float* Allocated array with the temperatures
 */
float* Coms::getTempAll()
{
  float *ret=(float*)calloc(N_TEMP_SENSORS, sizeof(float));
  uint8_t sensor;
  for(sensor=0; sensor<N_TEMP_SENSORS; sensor++)
    ret[sensor]=this->getTempX(sensor);
  return ret;
}
/**
 * @brief Read water sensor
 * 
 * @param sensor The number of the sensor starting at 0
 * @return bool True if water is present
 */
bool Coms::getWaterX(uint8_t sensor)
{
  this->sendCommand(GET_WATER);
  return this->getFloatParameter(sensor)==1;
}
/**
 * @brief Get the readings from the water sensors
 * 
 * @return bool True if any of the sensors detect water
 */
bool Coms::getWaterAll()
{
  this->sendCommand(GET_WATER);
  return this->getFloatParameter(N_WATER_SENSORS)==1;
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
 * @return float Voltage read in Volt
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
long Coms::getTimeToLive()
{
  return this->getLongParameter(GET_TIME_TO_LIVE);
}
/**
*/
float Coms::getFloatParameter(uint8_t code)
{
  this->sendCommand(code);
  String resp=this->requestParameter(FLOAT_LEN);
  if(resp==ERROR_STRING)
    return TIMEOUT_ERROR;
  return resp.toFloat();
}
/**
*/
long Coms::getLongParameter(uint8_t code)
{  
  this->sendCommand(code);
  String resp=this->requestParameter(LONG_LEN);
  if(resp==ERROR_STRING)
    return TIMEOUT_ERROR;
  return resp.toInt();
}
/**
 * @brief Request n bytes from i2C
 * 
 * @param len the number of bytes to request
 * @return String The reponse read
 */
String Coms::requestParameter(uint8_t len)
{
  String resp="";
  unsigned long timer=millis();
  Wire.requestFrom(monitorAddr, len);
  while(!Wire.available())
  {
    delay(1);
    if(millis()-timer>3000)
      return ERROR_STRING;
  }  
  while(Wire.available())
    resp+=(char)Wire.read();
  return resp;
}
/**
 * @brief 
 * 
 * @param code Send a byte via i2C
 */
void Coms::sendCommand(uint8_t code)
{
  Wire.beginTransmission(monitorAddr);
  Wire.write(code);
  Wire.endTransmission();
}
