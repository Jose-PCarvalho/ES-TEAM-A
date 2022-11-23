# Servo Control
import time
import wiringpi

LEFT_MOTOR_PIN = 13
RIGHT_MOTOR_PIN = 18
FRONT = 1
BACKWARDS = -1


# use 'GPIO naming'
def init_pwm():
    # divide down clock
    wiringpi.wiringPiSetupGpio()
    wiringpi.pwmSetClock(192)
    wiringpi.pwmSetRange(2000)


class Motor:
    def __init__(self,pin):
        self.speed = 0  # from 0 to 100
        self.dir = 1
        self.base_pwm = 150 #1500 us
        self.pin = pin
        init_pwm()
        wiringpi.pwmWrite(18, self.base_pwm)
        time.sleep(7) ##iniciar ESC
        print("Initiating Motor")

    def set_speed(self,speed, direction=1):
        # from 0 to 100
        self.speed = speed
        self.dir = direction
        wiringpi.pwmWrite(self.pin, self.base_pwm + 4*self.dir * self.speed / 10) #soma a 150 +/- 400
        # range de 1100us a 1900us

    def stop(self):
        self.set_speed(0)

Motor_Right=Motor(RIGHT_MOTOR_PIN)
Motor_Left=Motor(LEFT_MOTOR_PIN)
direction=-1
while True:
    direction=-direction
    for i in range(100):
        Motor_Right.set_speed(i,direction)
        Motor_Left.set_speed(i,direction)