import rospy



def listener():
    rospy.init_node('alarms', anonymous=True)
    # rospy.Subscriber ('/cmd_vel',Twist,callback)    
    # timer = rospy.Timer(rospy.Duration(0.1), timer_callback)
    #print ("Last message published")

    rospy.spin()    

if __name__ == '__main__':
    listener()