# Servo Control
import time
import wiringpi
LEFT_MOTOR_PIN = 13
RIGHT_MOTOR_PIN = 18
# use 'GPIO naming'

def init_pwm():
    # divide down clock
    wiringpi.wiringPiSetupGpio()
    wiringpi.pwmSetClock(192)
    wiringpi.pwmSetRange(2000)
    wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)

class Motor:
    def __init__(self,pin):
        self.speed = 0  # from 0 to 100
        self.base_pwm = 150 #1500 us
        self.pin = pin
        init_pwm()
        wiringpi.pinMode(self.pin, wiringpi.GPIO.PWM_OUTPUT)
        wiringpi.pwmWrite(self.pin, self.base_pwm)
        time.sleep(7) ##iniciar ESC
        print("Initiating Motor")

    def set_speed(self,speed):
        # from -100 to 100
        self.speed = speed
        wiringpi.pwmWrite(self.pin, self.base_pwm + 4*self.speed / 10) #soma a 150 +/- 400
        # range de 1100us a 1900us

    def stop(self):
        self.set_speed(0)

Motor_Right=Motor(RIGHT_MOTOR_PIN)
Motor_Left=Motor(LEFT_MOTOR_PIN)

while True:
    for i in range(100):
        Motor_Right.set_speed(i)
        Motor_Left.set_speed(i)
