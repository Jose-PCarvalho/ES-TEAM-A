#include "Temp.h"
#include "Power.h"
#include "HeartBeat.h"
#include <Wire.h>

// Debug mode
//#define DEBUG

#define N_SENSORS 4
#define CURRENT_PIN 0
// Sensors are all the same in this case 
#define RSER  47000
#define R25   68000
#define BETA  4600 
// i2c
#define INO_ADDR  8
#define PI_ADDR   9

#define GET_CURRENT       '0'
#define GET_VOLTAGE       '1'
#define GET_ENERGY        '2'
#define GET_RUNTIME       '3'
#define GET_TIME_TO_LIVE  '4'
#define GET_TEMP_BASE     '5'
#define FLOAT_LEN         8
#define FLOAT_DEC         4
#define LONG_LEN          11
//
#define BEAT_TIME         1000

Temp sensors[N_SENSORS];
Power power;
HeartBeat heart(LED_BUILTIN);
uint8_t index;
char cmd;
// Aux functions /////////
// Setup functions
void setSensors();
// Utility Functions
void stateMachine();
void senFloat(float value);
float readCurrent();
float readVoltage();
float energySpent();
long timeToLive();
void receiveHandler();
void requestHandler();

/**
 * @brief Setup function
 * 
 */
void setup()
{
  #ifdef DEBUG
    Serial.begin(500000);
  #endif
  // Initialize all sensors
  setSensors();
  // setup coms i2C
  Wire.begin(INO_ADDR);
  Wire.onReceive(receiveHandler);
  Wire.onRequest(requestHandler);
}
/**
 * @brief Loop function
 * 
 */
void loop()
{
  stateMachine();
  power.controller();
  heart.controller();
}
/**
 * @brief 
 * 
 */
void stateMachine()
{
  static unsigned long timer=millis();
  static uint8_t state=0;
  // State computation
  if(state==0)
  {     
    if(millis()-timer>BEAT_TIME)
    {
      timer=millis();
      heart.beat(BEAT_TIME/10);
    }
  }
}
/**
 * @brief Set the Sensors object
 * 
 */
void setSensors()
{
  uint8_t index;
  for(index=0; index<N_SENSORS; index++)
  {
    sensors[index].setRser(RSER);
    sensors[index].setBeta(BETA);
    sensors[index].setR25(R25);
    sensors[index].setPin(index);    
  }
}
/**
 * @brief Send a float through i2c
 * 
 * @param value The value to send
 */
void sendFloat(float value)
{
  char buff[FLOAT_LEN];  
  dtostrf(value, FLOAT_LEN, FLOAT_DEC, buff);
  Wire.write(buff);
}
/**
 * @brief Send a long int through i2c
 * 
 * @param value The value to send
 */
void sendLong(long value)
{
  char buff[LONG_LEN];
  String(value).toCharArray(buff, LONG_LEN);
  Wire.write(buff);
}
/**
 * @brief Read current consumed
 * 
 * @return float The calculated current value in Ampere
 */
float readCurrent()
{
  long voltage=map(analogRead(CURRENT_PIN), 0, 1023, 0, 5);
  return ;
}
/**
 * @brief Read voltage
 * 
 * @return float Voltage computed
 */
float readVoltage()
{
  return 222.6543;
}
/**
 * @brief Compute energy spent based on the current and voltages read
 * 
 * @return float Energy spent in Wh
 */
float energySpent()
{
  return 0;
}
/**
 * @brief Compute Time To Live based on the energy spent, the total capacity
 * and the runtime
 * 
 * @return long Estimated time to no energy in seconds
 */
long timeToLive()
{
  return 50123;

}
/**
 * @brief Handler for i2c requests
 * 
 */
void receiveHandler()
{   
  cmd=Wire.read();
}
/**
 * @brief Handler for i2c requests
 * 
 */
void requestHandler()
{
  if(cmd==GET_VOLTAGE)
    sendFloat(readVoltage());
  else if(cmd==GET_CURRENT)
    sendFloat(readCurrent());
  else if(cmd==GET_ENERGY)
    sendFloat(energySpent());
  else if(cmd==GET_RUNTIME)
    sendLong(millis());
  else if(cmd==GET_TIME_TO_LIVE)
    sendLong(timeToLive());
  else if(cmd-GET_TEMP_BASE<N_SENSORS)
    sendFloat(sensors[cmd-GET_TEMP_BASE].calcTemp());
  else
   sendFloat(-200);
  // Clear cmd
  cmd='x';
}






