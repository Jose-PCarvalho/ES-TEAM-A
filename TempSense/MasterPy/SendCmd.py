import ArduinoComs

ac=ArduinoComs.ArduinoComs(1,0x08)

msg='''
Available Commands:

Silence Allarm         : 0
Test Temp Sound        : 1
Test Water Sound       : 2
Test Low Voltage Sound : 3 
Test Peripherals       : 4

-> '''

toCmd=[
    ac.SILENCE_ALLARM,
    ac.TEST_TEMP,
    ac.TEST_WATER,
    ac.TEST_VOLTAGE,
    ac.TEST_PERIPHERALS
]

try:
    choice = int(input(msg))
except:
    print('Choice must be integer')
    quit()

if choice < 0 or choice >= len(toCmd):
    print('Invalid choice')
    quit()

cmd=toCmd[choice]

ac.sendCmd(cmd)

print('Command Sent')