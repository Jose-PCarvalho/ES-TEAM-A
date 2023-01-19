import ArduinoComs

ac=ArduinoComs.ArduinoComs(1,0x08)

#
print('Temperature Batt.: ', ac.getTempX(ac.BATT_TEMP_INDEX))
#
print('Temperatures All', ac.getTempAll())
#
print('Voltage: ', ac.getVoltage())
#
print('Current: ', ac.getCurrent())
#
print('Energy Consumed: ', ac.getEnergy())
#
print('Run Time: ', ac.getRunTime())
#
print('Time To Live: ', ac.getTimeToLive())
#
print('Water OR: ', ac.getWaterAll())
#
print('Water Power Box: ', ac.getWaterX(ac.PWR_WATER_SENSOR))
