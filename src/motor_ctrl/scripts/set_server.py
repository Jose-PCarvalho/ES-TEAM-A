import rospy
import sys
import wiringpi
import time
import os

from motor_ctrl.srv import set_motors, set_motorsResponse

import rospy

def set_fun(req):
    
    print("\nSettings " , req.left, " ", req.right )
    cmd = "echo ubuntu | sudo -S gpio pwm 1 %d" 
    cmd = cmd %(req.left)
    os.system(cmd)
    cmd = "echo ubuntu | sudo -S gpio pwm 23 %d" 
    cmd = cmd %(req.right)
    os.system(cmd)
    
    
    return True

def set_motors_server():
    rospy.init_node('set_motors_server')
    init_motors()
    print("set motors server online")
    

    s = rospy.Service('set_motors', set_motors, set_fun)
    rospy.spin()

def init_motors():
    os.system("echo ubuntu | sudo -S gpio mode 1 pwm ")
    os.system("echo ubuntu | sudo -S gpio mode 23 pwm ")
    os.system("echo ubuntu | sudo -S gpio pwm-ms")
    os.system("echo ubuntu | sudo -S gpio pwmr 2000")
    os.system("echo ubuntu | sudo -S gpio pwmc 192")
    os.system("echo ubuntu | sudo -S gpio pwm 1 150")
    os.system("echo ubuntu | sudo -S gpio pwm 23 150")
    time.sleep(7)

if __name__ == "__main__":
    set_motors_server()