# Servo Control
import time
import wiringpi
import sys

# use 'GPIO naming'
wiringpi.wiringPiSetupGpio()

# set #18 to be a PWM output
wiringpi.pinMode(13, wiringpi.GPIO.PWM_OUTPUT)
wiringpi.pinMode(18, wiringpi.GPIO.PWM_OUTPUT)

# set the PWM mode to milliseconds stype
wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)

# divide down clock
wiringpi.pwmSetClock(192)
wiringpi.pwmSetRange(2000)

delay_period = 0.01
wiringpi.pwmWrite(13, 150)
wiringpi.pwmWrite(18, 150)
time.sleep(7)

while True:
    for pulse in range(50, 250, 1):
        wiringpi.pwmWrite(13, 146)
        wiringpi.pwmWrite(18, 154)
        time.sleep(delay_period)
    for pulse in range(250, 50, -1):
        wiringpi.pwmWrite(18, 154)
        wiringpi.pwmWrite(13, 146)