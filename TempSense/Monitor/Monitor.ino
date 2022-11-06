#include "Temp.h"
#include "Energy.h"
#include "HeartBeat.h"
#include <Wire.h>

#define N_SENSORS         4
#define VOLTAGE_PIN       6
#define CURRENT_PIN       7
// Sensors are all the same in this case 
#define RSER              47e3  // ohm
#define R25               68e3  // ohm
#define BETA              4.6e3 // ohm
// i2c
#define INO_ADDR          8
#define PI_ADDR           9
// Voltage resistor divider
#define RV_HI              33.8e3 // ohm
#define RV_LO              9.85e3 // ohm
// Currente ratio
#define CURR_RATIO        66 // mV/A
#define RC_HI             6.7e3 // ohm
#define RC_LO             9.89e3 // ohm

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
#define BEAT_TIME         1e3 // in ms
// 
#define TEST_FUNTIONS
#define PRINT_TEST_PERIOD 1e3 // in ms

Temp sensors[N_SENSORS];
Energy energy;
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
long timeToLive();
void receiveHandler();
void requestHandler();

#ifdef TEST_FUNTIONS
// Test functions fro standalone use
void testFunctions()
{
  static unsigned long timer=millis();
  // State machine to print values periodicly
  if(millis()-timer>PRINT_TEST_PERIOD)
  {
    timer=millis();
    Serial.println("Test Functions Subroutine");
    // All temps test
    Serial.print("Temp Readings: ");
    for(uint8_t sensor=0; sensor<N_SENSORS; sensor++)
      Serial.print("T"+String(sensor)+":"+String(sensors[sensor].calcTemp(), 4)+" | ");
    // Voltage test
    Serial.println("\nVoltage: "+String(readVoltage(), 4)+" V");
    // Current test
    Serial.println("Current: "+String(readCurrent(), 4)+" A");
    // Power consuption
    Serial.println("Power: "+String(readVoltage()*readCurrent(), 4)+" W");    
    // Get Energy
    Serial.println("Energy consumed: "+String(energy.energySpent(), 4)+" Wh");
    // Get Runtime
    Serial.println("Run time: "+String(millis()/1e3)+" s");
    // Get Time to Live
    Serial.println("Time to Live: "+String(timeToLive())+" s\n");
  }  
}
#endif
/**
 * @brief Setup function
 * 
 */
void setup()
{
  #ifdef TEST_FUNTIONS
    Serial.begin(500000);
  #endif
  // Initialize all sensors
  setSensors();
  // setup coms i2C
  Wire.begin(INO_ADDR);
  Wire.onReceive(receiveHandler);
  Wire.onRequest(requestHandler);
  // Setup energy object
  energy.begin(readVoltage, readCurrent);
}
/**
 * @brief Loop function
 * 
 */
void loop()
{
  stateMachine();
  energy.controller();
  heart.controller();
  #ifdef TEST_FUNTIONS
    testFunctions();
  #endif
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
      heart.beat(BEAT_TIME/100);
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
  // Read pin voltage
  float voltage = (float)map(analogRead(CURRENT_PIN), 0, 1023, 0, 33e4);
  // Sensed voltage
  voltage = voltage/100;
  voltage = voltage*(RC_LO+RC_HI)/RC_LO;
  return voltage/CURR_RATIO;
}
/**
 * @brief Read voltage
 * 
 * @return float Voltage computed
 */
float readVoltage()
{
  // Read pin voltage
  float voltage = (float)map(analogRead(VOLTAGE_PIN), 0, 1023, 0, 33e4);
  voltage = voltage/1.0e5;
  // Sense voltage
  return voltage*(RV_LO+RV_HI)/RV_LO;
}
/**
 * @brief Compute Time To Live based on the energy spent, the total capacity
 * and the runtime
 * 
 * @return long Estimated time to no energy in seconds
 */
long timeToLive()
{
  float spentPerc = energy.energySpent()/TOTAL_CAPACITY;
  long runTimeSec = millis()/1e3;
  return (float)runTimeSec*(1-spentPerc)/spentPerc;
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
    sendFloat(energy.energySpent());
  else if(cmd==GET_RUNTIME)
    sendLong(millis()/1e3);
  else if(cmd==GET_TIME_TO_LIVE)
    sendLong(timeToLive());
  else if(cmd-GET_TEMP_BASE<N_SENSORS)
    sendFloat(sensors[cmd-GET_TEMP_BASE].calcTemp());
  else
   sendFloat(-200);
  // Clear cmd
  cmd='x';
}
