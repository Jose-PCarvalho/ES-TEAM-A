import rospy
import sys
import wiringpi
import time

from motor_ctrl.srv import set_motors, set_motorsResponse

import rospy

def set_fun(req):
    
    print("\nSettings " , req.left, " ", req.right )
    #print("\nInit motors")
    
    wiringpi.pwmWrite(13, req.left)
    wiringpi.pwmWrite(18, req.right)
    
    return True

def set_motors_server():
    rospy.init_node('set_motors_server')
    print("set motors server online")
    s = rospy.Service('set_motors', set_motors, set_fun)
    #print("Ready to add two ints.")
    rospy.spin()

if __name__ == "__main__":
    set_motors_server()