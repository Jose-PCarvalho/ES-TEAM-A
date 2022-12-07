import rospy
import sys
import wiringpi
import time

from motor_ctrl.srv import init_motors, init_motorsResponse

def init_fun(req):
    
    #print("teste: [%s]"%(req.req,))
    print("\nInit Service Called")
    
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
    
    return True

def init_motors_server():
    rospy.init_node('init_motors_server')
    print("init server is online")
    s = rospy.Service('init_motors', init_motors, init_fun)
    #print("Ready to add two ints.")
    rospy.spin()

if __name__ == "__main__":
    init_motors_server()