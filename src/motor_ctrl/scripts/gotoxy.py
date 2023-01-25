import rospy
from geometry_msgs.msg import Vector3Stamped,Pose,Twist
import numpy as np
from math import fabs, pi

yaw=0
yaw_inicial=0
started=False
xr=0
yr=0

def transform_to_pipi(input_angle):
    revolutions = int((input_angle + np.sign(input_angle) * pi) / (2 * pi))

    p1 = truncated_remainder(input_angle + np.sign(input_angle) * pi, 2 * pi)
    p2 = (np.sign(np.sign(input_angle)
                  + 2 * (np.sign(fabs((truncated_remainder(input_angle + pi, 2 * pi))
                                      / (2 * pi))) - 1))) * pi

    output_angle = p1 - p2

    return output_angle

def truncated_remainder(dividend, divisor):
    divided_number = dividend / divisor
    divided_number = \
        -int(-divided_number) if divided_number < 0 else int(divided_number)

    remainder = dividend - divisor * divided_number

    return remainder


def yaw_callback(data):
    global started
    global yaw
    global yaw_inicial
    if not started:
        started=True
        yaw_inicial=data.vector.z
        return 
    yaw=data.vector.z-yaw_inicial
    yaw=-yaw
    yaw=transform_to_pipi(yaw)


def pose_callback(data):
    global xr,yr
    xr=data.position.y
    yr=data.position.x
    



def talker():
    
    rospy.init_node('GoTo', anonymous=True)
    rospy.Subscriber ('/imu/rpy/filtered',Vector3Stamped,yaw_callback) 
    rospy.Subscriber ('/coordinates',Pose,pose_callback)  
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    rate = rospy.Rate(20) # 100hz
    xt=1.5
    yt=4

    msg=Twist()
    
    state=0



    rospy.loginfo("Localization STARTED")
    while not rospy.is_shutdown(): 
        print("state",state)  
        if state==0:
            theta_target=np.arctan2(yt-yr,xt-xr)
            print("Theta Target:", theta_target, "Theta", yaw)
            if np.rad2deg(np.abs(theta_target-yaw)) < 10:
                state=1
        elif state==1:
            theta_target=np.arctan2(yt-yr,xt-xr)
            print("Theta Target:", theta_target, "Theta", yaw)
            if np.rad2deg(np.abs(theta_target-yaw)) < 3:
                state=2
            elif np.rad2deg(np.abs(theta_target-yaw)) > 15:
                state=0
        elif state==2:
            print( np.sqrt((yt-yr)**2+(xt-xr)**2),xr,yr)
            if np.rad2deg(np.abs(theta_target-yaw)) > 15:
                state=0
            elif np.sqrt((yt-yr)**2+(xt-xr)**2)<1:
                state=3
        elif state==3:
            if np.sqrt((yt-yr)**2+(xt-xr)**2)<0.3:
                state=4

        


        if state==0:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-15,15)
            msg.angular.x=w
        elif state==1:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-10,10)
            msg.angular.x=w
        elif state==2:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-10,10)
            v=10
            msg.angular.x=w
            msg.linear.x=v
        elif state==3:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-12,12)
            v=8*np.sqrt((yt-yr)**2+(xt-xr)**2)
            msg.angular.x=w
            msg.linear.x=v
            
        pub.publish(msg)
        rate.sleep()







if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
