import ArduinoComs

ac=ArduinoComs.ArduinoComs(1,0x08)

print(ac.getTempX(1))
