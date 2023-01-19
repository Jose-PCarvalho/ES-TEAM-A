#!/usr/bin/env python

from playsound import playsound
import rospy
import numpy as np
import os
import time
import rospkg
import random

from alarms.msg import custom_sensor as sensor

# flag =True
global ttl
global max_power_temp
global max_control_temp
global max_esc_temp

# def timer_callback(event): 
#     global flag
#     #print("timer")
#     flag = True
rospack = rospkg.RosPack()
path_fixed= rospack.get_path('alarms')
path_list=[]
path_list.append(path_fixed+'/audios/bateria.mp3')
path_list.append(path_fixed+'/audios/submarino.mp3')
path_list.append(path_fixed+'/audios/hot.mp3')

def callback(data):
    if data.water_power == True or data.water_control == True:
        playsound(path_list[1])
        time.sleep(2)
    if data.time_to_live < ttl:
        playsound(path_list[0])
        time.sleep(5)
    if data.power_box_temp > max_power_temp:
        playsound(path_list[2])
        time.sleep(10)
    if data.control_box_temp > max_control_temp:
        playsound(path_list[2])
        time.sleep(10)
    if data.esc_temp_bombordo > max_esc_temp or data.esc_temp_estibordo > max_esc_temp:
        playsound(path_list[2])
        time.sleep(10) 



def listener():
    rospy.init_node('alarm_handler', anonymous=True)
    rospy.Subscriber ('/alarms/data',sensor,callback, queue_size=1)    
    #timer = rospy.Timer(rospy.Duration(0.1), timer_callback)
    #print ("Last message published")
    rospy.spin()    


if __name__ == '__main__':
    print("Alarm handler is online")
    ttl = rospy.get_param("/time_to_live", 10)
    max_power_temp = rospy.get_param("/max_power_temp", 30)
    max_control_temp = rospy.get_param("/max_control_temp", 45)
    max_esc_temp = rospy.get_param("/max_esc_temp", 60)
    listener()