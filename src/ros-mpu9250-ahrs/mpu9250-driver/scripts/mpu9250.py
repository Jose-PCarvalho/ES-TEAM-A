import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu, MagneticField
import math
import numpy as np

import time
from mpu9250_jmdev.registers import *
from mpu9250_jmdev.mpu_9250 import MPU9250
from sensor_msgs_ext.msg import magnetometer,accelerometer,gyroscope
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion, quaternion_from_euler

G = 9.80665
MagFieldConversion_uT_T = 0.000001

mpu = MPU9250(
    address_ak=AK8963_ADDRESS,
    address_mpu_master=MPU9050_ADDRESS_68, # In 0x68 Address
    address_mpu_slave=None,
    bus=1,
    gfs=GFS_1000,
    afs=AFS_8G,
    mfs=AK8963_BIT_16,
    mode=AK8963_MODE_C100HZ)

def talker():
    imu_pub = rospy.Publisher('imu/data_raw', Imu, queue_size=1)
    mag_pub = rospy.Publisher('imu/mag', MagneticField, queue_size=1)
    
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(100) # 10hz

    imu_msg = Imu()
    mag_msg = MagneticField()


    # Apply the settings to the registers and calibrate
    mpu.configure()
    mpu.calibrate()
    mpu.calibrateMPU6500()
    mpu.abias = [0, 0, 0]
    mpu.magScale = [0, 0, 0] # Set magnetometer soft iron distortion
    mpu.mbias = [0, 0, 0] # Set magnetometer hard iron distortion
    mpu.configure()
    accelerometer_correction=np.array(( 
    [1.000011, 0.000000, 0.000000, -0.271920],
    [0.000000,0.997300, 0.000000, -0.157361] ,
    [0.000000, 0.000000, 0.976097, -0.413201], 
    [0.000000, 0.000000, 0.000000, 1.000000])
    ,dtype=float)
    magnetometer_correction=np.array(( 
    [1.0905702447, 0.0148651853, -0.0760378525, -0.0000042542],
    [0.0148651853, 1.0996978130, -0.0420582264, -0.0000327415] ,
    [0.0760378525, -0.0420582264, 1.2411371730, 0.0000024692], 
    [0.0000000000, 0.0000000000, 0.0000000000, 1.0000000000])
    ,dtype=float)
    

    rospy.loginfo("IMU STARTED")
    while not rospy.is_shutdown():
            # Fill mag msg
            mx, my, mz = mpu.readMagnetometerMaster()
            readings=np.array(([mx,my,mz,1]),dtype=float)*MagFieldConversion_uT_T
            readings_corr=np.matmul(readings,magnetometer_correction)
            mag_msg.header.stamp = rospy.get_rostime()
            mag_msg.magnetic_field.x = float(readings_corr[0])
            mag_msg.magnetic_field.y = float(readings_corr[1])
            mag_msg.magnetic_field.z = float(readings_corr[2])
            mag_msg.magnetic_field_covariance[0] = 0.01
            mag_msg.magnetic_field_covariance[4] = 0.01
            mag_msg.magnetic_field_covariance[8] = 0.01
            
            # create imu msg
            q0 = 1.0 #W
            q1 = 0.0 #X
            q2 = 0.0 #Y
            q3 = 0.0 #Z

            #Fill imu message
            imu_msg.header.stamp = rospy.get_rostime()
            imu_msg.header.frame_id = 'imu_frame'

            imu_msg.orientation.x = q0
            imu_msg.orientation.y = q1
            imu_msg.orientation.z = q2
            imu_msg.orientation.w = q3
            imu_msg.orientation_covariance[0] = 0.01
            imu_msg.orientation_covariance[4] = 0.01
            imu_msg.orientation_covariance[8] = 0.01

            #orientation_list = [imu_msg.orientation.x, imu_msg.orientation.y,imu_msg.orientation.z,imu_msg.orientation.w]
            #(roll, pitch, yaw) = euler_from_quaternion (orientation_list)
            #rospy.loginfo(imu_msg.orientation.x)
            gx, gy, gz = mpu.readGyroscopeMaster()
            imu_msg.angular_velocity.x = math.radians(gx)
            imu_msg.angular_velocity.y = math.radians(gy)
            imu_msg.angular_velocity.z = math.radians(gz)
            imu_msg.angular_velocity_covariance[0] = 0.03
            imu_msg.angular_velocity_covariance[4] = 0.03
            imu_msg.angular_velocity_covariance[8] = 0.03
            ax, ay, az = mpu.readAccelerometerMaster()
            reading_acc=np.array(([mx,my,mz,1]),dtype=float)*G
            readings_acc_corr=np.matmul(reading_acc,accelerometer_correction)
            imu_msg.linear_acceleration.x = float(readings_acc_corr[0])
            imu_msg.linear_acceleration.y = float(readings_acc_corr[1])
            imu_msg.linear_acceleration.z = float(readings_acc_corr[2])
            imu_msg.linear_acceleration_covariance[0] = 0.1
            imu_msg.linear_acceleration_covariance[4] = 0.1
            imu_msg.linear_acceleration_covariance[8] = 0.1
            imu_pub.publish(imu_msg)
            mag_pub.publish(mag_msg)
            rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
