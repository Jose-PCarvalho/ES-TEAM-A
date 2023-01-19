import rospy
from geometry_msgs.msg import Vector3Stamped,Pose,Twist
import numpy as np

yaw=0
yaw_inicial=0
started=False
xr=0
yr=0


def yaw_callback(data):
    global started
    global yaw
    global yaw_inicial
    if not started:
        started=True
        yaw_inicial=data.vector.x
        return 
    yaw=data.vector.z-yaw_inicial


def pose_callback(data):
    global xr,yr
    xr=data.position.y
    yr=data.position.x
    



def talker():
    rospy.init_node('GoTo', anonymous=True)
    pub=rospy.Publisher ('/coordinates',Pose,queue_size=1)   
    rospy.Subscriber ('/imu/rpy/filtered',Vector3Stamped,yaw_callback) 
    rospy.Subscriber ('/coordinates',Pose,pose_callback)  
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    rate = rospy.Rate(20) # 100hz
    xt=3
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
            if np.rad2deg(np.abs(theta_target-yaw)) < 5:
                state=2

        if state==0:
            w=np.clip(2*(theta_target-yaw),-15,15)
            msg.angular.z=w
        elif state==1:
            w=np.clip(2*(theta_target-yaw),-7.5,7.5)
            msg.angular.z=w
        pub.publish(msg)
        rate.sleep()







if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
