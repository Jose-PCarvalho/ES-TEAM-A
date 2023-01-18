from playsound import playsound
import rospy
import numpy as np
import os
import time
from std_msgs.msg import Int8
import rospkg

# flag =True

# def timer_callback(event): 
#     global flag
#     #print("timer")
#     flag = True

def callback(data):
    global flag
    if data.data == 3:
        rospack = rospkg.RosPack()
        path = rospack.get_path('control')
        path = path + '/scripts/sound.mp3'
        playsound(path)
        time.sleep(10)
        # if (flag == True):
        #     #print("ok")
        #     rospack = rospkg.RosPack()
        #     path = rospack.get_path('control')
        #     path = path + '/scripts/sound.mp3'
        #     playsound(path)
        #     timer = rospy.Timer(rospy.Duration(10), timer_callback)
        #     flag = False




def listener():
    rospy.init_node('sound', anonymous=True)
    rospy.Subscriber ('/mission/state',Int8,callback, queue_size=1)    
    #timer = rospy.Timer(rospy.Duration(0.1), timer_callback)
    #print ("Last message published")
    rospy.spin()    


if __name__ == '__main__':
    
    listener()
