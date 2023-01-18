from playsound import playsound
import rospy
import numpy as np
import os
import time
from geometry_msgs.msg import Twist

def callback(data):
    if data.data == True:
        print("true")



def listener():
    rospy.init_node('sound', anonymous=True)
    rospy.Subscriber ('/mision/state',int,callback)    
    #timer = rospy.Timer(rospy.Duration(0.1), timer_callback)
    #print ("Last message published")
    rospy.spin()    


if __name__ == '__main__':
    listener()
