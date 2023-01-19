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

def callback(data):
    global started
    

    if started:
        orientation_list = [data.orientation.x, data.orientation.y,data.orientation.z,data.orientation.w]
        (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
        #print(yaw)
    
    if (not started):
        started = True
    #print(vel_msg.linear.x)

def talker():
    global started
    imu_pub = rospy.Publisher('imu/data_raw', Imu, queue_size=1)
    mag_pub = rospy.Publisher('imu/mag', MagneticField, queue_size=1)
    acc_pub =rospy.Publisher('/imu/accelerometer',accelerometer,queue_size=1)
    magn_pub =rospy.Publisher('/imu/magnetometer',magnetometer,queue_size=1)
    gyro_pub =rospy.Publisher('/imu/gyroscope',gyroscope,queue_size=1)
    started=False
    rospy.Subscriber ('/imu/data',Imu,callback)  
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(100) # 10hz

    imu_msg = Imu()
    mag_msg = MagneticField()
    mag_calib_msg=magnetometer()
    acc_msg=accelerometer()
    gyro_msg=gyroscope()


    # Apply the settings to the registers and calibrate
    mpu.configure()
    # mpu.calibrate()
    # mpu.abias = [0, 0, 0]
    # mpu.magScale = [0, 0, 0] # Set magnetometer soft iron distortion
    # mpu.mbias = [0, 0, 0] # Set magnetometer hard iron distortion
    # mpu.configure()
    accelerometer_correction=np.array(( 
    [0.998744, 0.000000, 0.000000, -0.263538],
    [0.000000, 0.996921, 0.000000, -0.161967] ,
    [0.000000, 0.000000, 0.977497, -0.400898], 
    [0.000000, 0.000000, 0.000000, 1.000000])
    ,dtype=float)

    magnetometer_correction=np.array(( 
    [1.1195446759, 0.0062936393, -0.0300943755, -0.0000068429],
    [0.0062936393, 1.1400680969, 0.0074760178, -0.0000369644] ,
    [-0.0300943755, 0.0074760178, 1.1446904186, 0.0000074705], 
    [0.0000000000, 0.0000000000, 0.0000000000, 1.0000000000])
    ,dtype=float)


    

    rospy.loginfo("IMU STARTED")
    while not rospy.is_shutdown():
            # Fill mag msg
            mx, my, mz = mpu.readMagnetometerMaster()
            readings=np.array(([mx,my,mz]),dtype=float)*MagFieldConversion_uT_T
            readings_corr=np.matmul(readings,magnetometer_correction[0:3,0:3])+magnetometer_correction[0:3,3]
            mag_msg.header.stamp = rospy.get_rostime()
            mag_msg.magnetic_field.x = float(readings_corr[0])
            mag_msg.magnetic_field.y = float(readings_corr[1])
            mag_msg.magnetic_field.z = float(readings_corr[2])
            mag_msg.magnetic_field_covariance[0] = 0.01
            mag_msg.magnetic_field_covariance[4] = 0.01
            mag_msg.magnetic_field_covariance[8] = 0.01
            mag_calib_msg.x=mx*MagFieldConversion_uT_T
            mag_calib_msg.y=my*MagFieldConversion_uT_T
            mag_calib_msg.z=mz*MagFieldConversion_uT_T            
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
            reading_acc=np.array(([ax*G,ay*G,az*G]),dtype=float)
            readings_acc_corr=np.matmul(reading_acc,accelerometer_correction[0:3,0:3])+accelerometer_correction[0:3,3]
            imu_msg.linear_acceleration.x = float(readings_acc_corr[0])
            imu_msg.linear_acceleration.y = float(readings_acc_corr[1])
            imu_msg.linear_acceleration.z = float(readings_acc_corr[2])

            gyro_msg.x=gx
            gyro_msg.y=gy
            gyro_msg.z=gz

            acc_msg.x=ax
            acc_msg.y=ay
            acc_msg.z=az

            imu_msg.linear_acceleration_covariance[0] = 0.01
            imu_msg.linear_acceleration_covariance[4] = 0.01
            imu_msg.linear_acceleration_covariance[8] = 0.01
            imu_pub.publish(imu_msg)
            mag_pub.publish(mag_msg)
            magn_pub.publish(mag_calib_msg)
            gyro_pub.publish(gyro_msg)
            acc_pub.publish(acc_msg)
        
            rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
