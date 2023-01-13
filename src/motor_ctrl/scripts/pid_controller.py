import rospy
from std_msgs.msg import Empty
from std_msgs.msg import String
import numpy as np
import os
import time
from geometry_msgs.msg import Twist

class MotorControl:
    def __init__(self):
        self.pid_v=PID()
        self.pid_w=PID()
        init_motors()
        self.uv=0
        self.uw=0
        self.u1=0
        self.u2=0
        self.v_ref=0
        self.w_ref=0

    def motor_speed(self,v,w):
        self.uv=self.pid_v.compute(self.v_ref,v)
        self.uw=self.pid_w.compute(self.w_ref, w)
        self.motor_control(self.uv,self.uw)

    def motor_control(self,uv,uw):
        self.u1=uv+uw
        self.u2=uv-uw
        self.u1 , _= self.pid_v.clip(self.u1)
        self.u2 , _ = self.pid_v.clip(self.u2)
        set_fun(self.u2,self.u1)
        return self.u1, self.u2

class PID:
        def __init__(self,k=2,ki =2):
            self.k = k
            self.ki = ki
            self.integral_error = 0

        def compute(self, ref, measure):
            error = ref - measure
            self.integral_error += error
            u = self.k * error + self.integral_error * self.ki
            u, saturated = self.clip(u)
            if saturated:  # anti_windup
                self.integral_error -= error
            return u
        def clip(self,value):
            if value > 30:
                return 30, True
            elif value < -30:
                return -30, True
            else:
                return value, False


def init_motors():
    os.system("echo ubuntu | sudo -S gpio mode 1 pwm ")
    os.system("echo ubuntu | sudo -S gpio mode 23 pwm ")
    os.system("echo ubuntu | sudo -S gpio pwm-ms")
    os.system("echo ubuntu | sudo -S gpio pwmr 2000")
    os.system("echo ubuntu | sudo -S gpio pwmc 192")
    os.system("echo ubuntu | sudo -S gpio pwm 1 150")
    os.system("echo ubuntu | sudo -S gpio pwm 23 150")
    time.sleep(7)
    print("motor init")

def set_fun(left,right):
    
    print("\nSettings " , left, " ", right )
    cmd = "echo ubuntu | sudo -S gpio pwm 1 %d" 
    cmd = cmd %(150+left*0.4)
    os.system(cmd)
    cmd = "echo ubuntu | sudo -S gpio pwm 23 %d" 
    cmd = cmd %(150+right*0.4)
    os.system(cmd)
    
    
    return True

last_data = ""
started = False
controller= MotorControl()

def callback(data):
    #vel_msg = Twist()
    
    controller.v_ref = data.linear.x
    controller.w_ref = data.angular.x
    global started, last_data
    last_data = data
    
    
    if (not started):
        started = True
    #print(vel_msg.linear.x)

def timer_callback(event):
    print(controller.w_ref)
    controller.motor_control(controller.v_ref,controller.w_ref)
    #print("Motors: ")
    #print(controller.u1,controller.u2)


def listener():
    rospy.init_node('control', anonymous=True)
    rospy.Subscriber ('/cmd_vel',Twist,callback)    
    timer = rospy.Timer(rospy.Duration(0.1), timer_callback)
    #print ("Last message published")

    rospy.spin()    
    timer.shutdown()

if __name__ == '__main__':
    listener()




