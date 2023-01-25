import rospy
from geometry_msgs.msg import Vector3Stamped,Pose,Twist, Point
from sensor_msgs.msg import Range
import numpy as np
from math import fabs, pi

yaw=0
yaw_inicial=0
started=False
xr=0
yr=0
lidar_dst=0
buoy_pos=Point()
there_is_buoy=False
buoy_at_center=False
center_threshold=200
lidar_threshold_low=0.9
lidar_threshold_high=1.5
max_speed=15
HEIGT= 308
WIDTH= 410


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

def callback_tracker (data):
    global buoy_pos
    global there_is_buoy
    global buoy_at_center
    buoy_pos = data

    if ( ( buoy_pos.x  < WIDTH / 2 + center_threshold ) and  ( buoy_pos.x  > WIDTH / 2 - center_threshold ) ) :
        buoy_at_center=True 
    else:
        buoy_at_center=False

    if ((buoy_pos.x > WIDTH) or (buoy_pos.x < WIDTH) or (buoy_pos.y > HEIGT) or (buoy_pos.y < WIDTH) ):
        there_is_buoy = False


def callback_lidar(data):
    global lidar_dst
    lidar_dst=data.range


    



def talker():
    rospy.init_node('mission2', anonymous=True)
    rospy.Subscriber ('/imu/rpy/filtered',Vector3Stamped,yaw_callback) 
    rospy.Subscriber ('/coordinates',Pose,pose_callback)  
    rospy.Subscriber('/tfmini_ros_node/TFmini',Range,callback_lidar)
    rospy.Subscriber('/vision/point',Point,callback_tracker)
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    rate = rospy.Rate(15) # 100hz
  
    msg=Twist()
    
    buoy_state=0
    avoid_state=0
    coordinate_state=0
    xt=0
    yt=0
    xbuoy=0
    ybuoy=0


    rospy.loginfo("Localization STARTED")
    while not rospy.is_shutdown(): 
        
        print("buoy state ",buoy_state," avoid state ",avoid_state, " xt ",xt," yt ",yt )
        if buoy_state==0:
            if buoy_at_center:
                buoy_state=1
        elif buoy_state==1:
            if not buoy_at_center:
                buoy_state=0
            elif (np.abs(WIDTH/2-buoy_pos.x)<center_threshold/3):
                buoy_state=2
        elif buoy_state==2:
            if not buoy_at_center:
                buoy_state=0
            elif lidar_dst<lidar_threshold_low:
                buoy_state=3
                xbuoy=xr+np.cos(yaw)*lidar_dst
                ybuoy=yr +np.sin(yaw)*lidar_dst
                xt=xbuoy-(ybuoy-yr)
                yt=ybuoy+(xbuoy-xr)
                avoid_state=1
        elif buoy_state==3:
            if avoid_state==-1:
                buoy_state=0
                avoid_state=0
        
        if avoid_state==1:
            theta_target=np.arctan2(yt-yr,xt-xr)
            print("Theta Target:", theta_target, "Theta", yaw)
            if np.rad2deg(np.abs(theta_target-yaw)) < 5:
                avoid_state=2
        elif avoid_state==2:
            theta_target=np.arctan2(yt-yr,xt-xr)
            print("Theta Target:", theta_target, "Theta", yaw)
            if np.rad2deg(np.abs(theta_target-yaw)) < 2:
                avoid_state=3
            elif np.rad2deg(np.abs(theta_target-yaw)) > 10:
                avoid_state=1
        elif avoid_state==3:
            print( np.sqrt((yt-yr)**2+(xt-xr)**2),xr,yr)
            if np.rad2deg(np.abs(theta_target-yaw)) > 10:
                avoid_state=1
            elif np.sqrt((yt-yr)**2+(xt-xr)**2)<0.8:
                print("Theta Target:", theta_target, "Theta", yaw)
                avoid_state=4
        elif avoid_state==4:
            if np.sqrt((yt-yr)**2+(xt-xr)**2)<0.4:
                avoid_state=4
            elif np.rad2deg(np.abs(theta_target-yaw)) > 15:
                avoid_state=0
        elif avoid_state==5:
            avoid_state=5
            
            
                

        


        if avoid_state==1:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-13,13)
            msg.angular.x=w
            msg.linear.x=0
        elif avoid_state==2:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-10,10)
            msg.angular.x=w
            msg.linear.x=0
        elif avoid_state==3:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-10,10)
            v=10
            msg.angular.x=w
            msg.linear.x=v
        elif avoid_state==4:
            w=np.clip(-12*transform_to_pipi(theta_target-yaw),-10,10) #-12 12
            v=np.clip(13*np.sqrt((yt-yr)**2+(xt-xr)**2),-8,8)
            msg.angular.x=w
            msg.linear.x=v
        elif avoid_state==5:
            msg.angular.x=0
            msg.linear.x=0

        if buoy_state==0:
            msg.linear.x=0
            msg.linear.x=max_speed/2
        elif buoy_state==1:
            msg.linear.x =0
            msg.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold/2
        elif buoy_state==1:
            msg.linear.x =0
            msg.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold/2
        elif buoy_state==2:
            msg.linear.x =max_speed/2
            msg.angular.x = -(WIDTH/2-buoy_pos.x)*max_speed/center_threshold*2/3
            
        pub.publish(msg)
        rate.sleep()




if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
