#include "Temp.h"
#include "Energy.h"
#include "HeartBeat.h"
#include "Fan.h"
#include <Wire.h>

#define N_TEMP_SENSORS      4
#define N_WATER_SENSORS     2
#define N_FANS              2  // Number of fans for
// Analog Pins
#define VOLTAGE_PIN         A6
#define CURRENT_PIN         A7
// Digital Pins
#define BUZZER_PIN          2  // Output
#define WATER_SENSOR_1      4  // Input
#define WATER_SENSOR_2      5  // Input
#define POWER_BOX_RELAY     6  // Output
#define CONTROL_BOX_RELAY   7  // Output
#define AUX_RELAY_1         8  // Not used
#define AUX_RELAY_2         9  // Not used
// Temperture
// Constants (Sensors are all the same in this case)
#define RSER                47e3  // ohm
#define R25                 68e3  // ohm
#define BETA                4.6e3 // ohm
// Set point
#define ON_TEMP             30 // Turn fans on at this temperature
#define HYSTERESIS          3  // Turn off when temperature reaches ON_TEMP-HYSTERESIS
// Voltage resistor divider
#define RV_HI               17.65e3 // ohm
#define RV_LO               9.85e3 // ohm
// Currente ratio
#define CURR_RATIO          66 // mV/A
#define RC_HI               6.7e3 // ohm
#define RC_LO               9.89e3 // ohm
// I2C 
// Pins
#define INO_ADDR            8
#define PI_ADDR             9
// Commands
#define GET_CURRENT         1
#define GET_VOLTAGE         2
#define GET_ENERGY          3
#define GET_RUNTIME         4
#define GET_TIME_TO_LIVE    5
#define GET_TEMP            6
#define GET_WATER           7
// Data
#define FLOAT_LEN           8
#define FLOAT_DEC           4
#define LONG_LEN            11
// Period for heart beat
#define BEAT_TIME           1e3 // in ms
// Period for Buzzer
#define BUZZER_TIMER        3e3   // in ms
// For testing purposes
#define TEST_FUNTIONS
#define PRINT_TEST_PERIOD   1e3 // in ms
// Battery alarm
#define BATT_ALLARM         10.0 // Volt
#define BATT_ALLARM_OFF     10.5  // Volt
#define LOW_BAT_WARNING     100    // in ms
// High Temp Alarm
#define HIGH_TEMP           38    // In celcius
#define HIGH_TEMP_WARNING   300   // in ms
// Water Allarm
#define WATER_DETECT        2e3   // in ms
// Constants
#define NULL_CMD            0

const String tempSensorNames[4]={
  "Bats",
  "Rasp",
  "ESCE",
  "ESCB"
};

const String waterSensorNames[2]={
  "Cntrl",
  "Power"
};

Fan fans[N_FANS];
Temp sensors[N_TEMP_SENSORS];
Energy energy;
HeartBeat heart(LED_BUILTIN);
uint8_t index;
uint8_t cmd;
uint8_t sensorIndex;
// Aux functions /////////
// Setup functions
void setSensors();
void setRelays();
// Utility Functions
void stateMachine();
void senFloat(float value);
float readCurrent();
float readVoltage();
long timeToLive();
void receiveHandler(int notUsed);
void requestHandler();
float readWater(uint8_t sensor);

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
    uint8_t sensor;
    for(sensor=0; sensor<N_TEMP_SENSORS; sensor++)
      Serial.print(tempSensorNames[sensor]+":"+String(sensors[sensor].calcTemp(), 4)+" | ");
      // All water test
    Serial.print("\nIndividual Water Readings: ");
    for(sensor=0; sensor<N_WATER_SENSORS; sensor++)
      Serial.print(waterSensorNames[sensor]+":"+String(readWater(sensor)==1?"Wet":"Dry")+" | ");
    Serial.println("Or'ed Water Readings:"+String(readWater(N_WATER_SENSORS)==1?"Wet":"Dry"));
    // Voltage test
    Serial.println("Voltage: "+String(readVoltage(), 4)+" V");
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

bool overTemp()
{
  uint8_t index=0;
  for(index=0; index < N_TEMP_SENSORS; index++)
    if(sensors[index].calcTemp() > HIGH_TEMP)
      return true;
  return false;
}
/**
 * @brief Setup function
 * 
 */
void setup()
{
  #ifdef TEST_FUNTIONS
    Serial.begin(115200);
  #endif
  // Initialize all sensors
  setSensors();
  // setup coms i2C
  Wire.begin(INO_ADDR);
  Wire.onReceive(receiveHandler);
  Wire.onRequest(requestHandler);
  // Setup energy object
  energy.begin(readVoltage, readCurrent);
  // Set up relays
  pinMode(POWER_BOX_RELAY, OUTPUT);
  pinMode(CONTROL_BOX_RELAY, OUTPUT);
  //pinMode(AUX_RELAY_1, OUTPUT); // Uncomment when used
  //pinMode(AUX_RELAY_2, OUTPUT); // Uncomment when used
  // Initialize all fans
  setRelays();
  // Buzzer
  pinMode(BUZZER_PIN, OUTPUT);
  // Init commands
  cmd=NULL_CMD;
  sensorIndex=NULL_CMD;
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
  fans[0].controller();
  fans[1].controller();
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
  static uint8_t battState=0;
  static uint8_t tempState=0;
  static uint8_t waterState=0;
  static unsigned long curr;
  static unsigned long timer1=millis();
  static unsigned long battTimer=millis();
  static unsigned long tempTimer=millis();
  static unsigned long waterTimer=millis();
  //
  curr=millis();
  // State computation 
  if(curr-timer1>BEAT_TIME)
  {
    timer1=curr;
    heart.beat(BEAT_TIME/100);
  }    
  // Batery monitor
  if(battState==0)
  {
    if(curr-battTimer > BUZZER_TIMER)
    {
      battTimer=curr;
      battState=1;
    }      
  }
  else if(battState==1)
  {
    if(readVoltage() < BATT_ALLARM)
    {
      battTimer=curr;
      battState=2;
    }
  }
  else if(battState==2)
  {
    if(curr-battTimer>LOW_BAT_WARNING)
    {      
      battTimer=curr;
      battState=3;
    }
  }
  else if(battState==3)
  {
    if(curr-battTimer > BUZZER_TIMER)
    {
      battTimer=curr;
      battState=1;
    }
    else if(readVoltage() > BATT_ALLARM_OFF)
    {
      battTimer=curr;
      battState=0;
    }
  }
  // Temp Allarm
  if(tempState==0)
  {
    if(curr-tempTimer > BUZZER_TIMER)
    {
      tempTimer=curr;
      tempState=1;
    }      
  }
  else if(tempState==1)
  {
    if(overTemp())
    {
      tempTimer=curr;
      tempState=2;
    }
  }
  else if(tempState==2)
  {
    if(curr-tempTimer>HIGH_TEMP_WARNING)
    {      
      tempTimer=curr;
      tempState=0;
    }
  }
  // Water Allarm
  if(waterState==0)
  {
    if(curr-waterTimer > BUZZER_TIMER)
    {
      waterTimer=curr;
      waterState=1;
    }      
  }
  else if(waterState==1)
  {
    if(readWater(N_WATER_SENSORS))
    {
      waterTimer=curr;
      waterState=2;
    }
  }
  else if(waterState==2)
  {
    if(curr-waterTimer>WATER_DETECT)
    {      
      waterTimer=curr;
      waterState=0;
    }
  }
  // Write outputs
  digitalWrite(BUZZER_PIN, battState==2||tempState==2||waterState==2);
}
/**
 * @brief Set the Sensors object
 * 
 */
void setSensors()
{
  // Temperature Sensors
  uint8_t index;
  for(index=0; index<N_TEMP_SENSORS; index++)
  {
    sensors[index].setRser(RSER);
    sensors[index].setBeta(BETA);
    sensors[index].setR25(R25);
    sensors[index].setPin(index);    
  }
  // Water Sensors
  pinMode(WATER_SENSOR_1, INPUT);
  pinMode(WATER_SENSOR_2, INPUT);
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
  float voltage = (float)map(analogRead(CURRENT_PIN), 0, 1023, 0, VCC*1e5);
  // Sensed voltage
  voltage = voltage/1e5 - VCC/2.0 + 0.025; // Includes vontage conmpensation
  return 1e3*voltage/CURR_RATIO;
}
/**
 * @brief Read voltage
 * 
 * @return float Voltage computed
 */
float readVoltage()
{
  // Read pin voltage
  float voltage = (float)map(analogRead(VOLTAGE_PIN), 0, 1023, 0, VCC*1e5);
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
 * @brief Receive information
 * 
 * @param notUsed Unused parameter (keeps compiler happy)
 */
void receiveHandler(int notUsed)
{   
  if(cmd!=NULL_CMD)
    cmd=Wire.read();
  else
    sensorIndex=Wire.read();
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
  else if(cmd==GET_TEMP)
    sendFloat(sensors[sensorIndex].calcTemp());
  else if(cmd==GET_WATER)
    sendFloat(readWater(sensorIndex));
  else
    sendFloat(-1000);
  // Clear cmd
  cmd=NULL_CMD;
  sensorIndex=NULL_CMD;
}
/**
 * @brief Wrap non static element in a static function for Fan class
 * 
 * @param sensor The sensor index to compute the temperature
 * @return float The computed temerature
 */
float staticWrapper(uint8_t sensor)
{
  return sensors[sensor].calcTemp();
}
/**
 * @brief Setup fans
 * 
 */
void setRelays()
{
  // Power box fan in  position 0
  fans[0].setPin(POWER_BOX_RELAY);
  fans[0].setLogic(false);
  // Control box fan in postion 1
  fans[1].setPin(CONTROL_BOX_RELAY);
  fans[1].setLogic(false);
  // Power Box Fan
  fans[0].setOnTemp(ON_TEMP);
  fans[0].setOffTemp(ON_TEMP-HYSTERESIS);
  // Uses sensor 0 and 1 for the fans
  fans[0].setSensorIndex(0);
  fans[0].setSensorIndex(2);
  fans[0].setSensorIndex(3);
  fans[0].setCalcTempFunc(staticWrapper);
  // Control Box Temp 
  fans[1].setOnTemp(ON_TEMP);
  fans[1].setOffTemp(ON_TEMP-HYSTERESIS);
  // Uses sensor 0 and 1 for the fans
  fans[1].setSensorIndex(1);
  fans[1].setCalcTempFunc(staticWrapper);

  // not used
  // not used
}
/**
 * @brief Read Water sensor
 * if index is equal to N_TEMP_SENSORS all sensors are read and a OR operation is perforemed
 * aka if only one sensor is active returns 1
 * 
 * @param sensor The index of the sensor 
 * @return float 1 if water is detected 0 otherwise
 */
float readWater(uint8_t sensor)
{
  if(sensor>=N_WATER_SENSORS)
    return (digitalRead(WATER_SENSOR_1) && digitalRead(WATER_SENSOR_2))?0:1;
  // Return sensor reading
  if(sensor==0)
    return digitalRead(WATER_SENSOR_1)?0:1;
  if(sensor==1)
    return digitalRead(WATER_SENSOR_2)?0:1;
}