#include "Energy.h"

/**
 * @brief 
 * 
 */
Energy::Energy(/* args */)
{
    energyConsumed=0;
    estimatedStartEnergy=0;
}
/**
 * @brief Destroy the Power:: Power object
 * 
 */
Energy::~Energy()
{
}
/**
 * @brief Initialize power consuption based on initial voltage
 * 
 * @param initalVoltage Voltage read at start of program 
 */
void Energy::begin(float (*voltageFunc)(), float (*currentFunc)())
{
    voltFunc=voltageFunc;
    currFunc=currentFunc;
}
/**
 * @brief This function controls the object addindex 
 * must be called every cycle with no interuptions
 * 
 */
void Energy::controller()
{
    static uint8_t state=0;
    static unsigned long timer=millis();
    static float delta;

    delta = (float)(millis()-timer);

    if(delta>INTEGRATION_DELTA)
    {
        energyConsumed+=currFunc()*voltFunc()*delta/3.6e6;
        timer=millis();
    }
}
/**
 * @brief Returns the estimated energy remaining at the star of the program
 * 
 * @return float The enrgy estimated
 */
float Energy::estimatedStart()
{
    return estimatedStartEnergy;
}
/**
 * @brief Get energy consumed
 * 
 * @return float The energy consumed
 */
float Energy::energySpent()
{
    return energyConsumed;
}