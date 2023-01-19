#!/usr/bin/env python
import rospy

import ArduinoComs

from alarms.msg import custom_sensor as sensors

ac = ArduinoComs.ArduinoComs(1,0x08)
msg = sensors()

def getData():
    global msg
    msg.water_power = ac.getWaterX(ac.PWR_WATER_SENSOR)
    msg.water_control = ac.getWaterX(ac.CTRL_WATER_SENSOR)
    msg.power_box_temp = ac.getTempX(ac.BATT_TEMP_INDEX)
    msg.control_box_temp = ac.getTempX(ac.CTRL_WATER_SENSOR)
    msg.esc_temp_bombordo = ac.getTempX(ac.ESCB_TEMP_INDEX)
    msg.esc_temp_estibordo = ac.getTempX(ac.ESCE_TEMP_INDEX)
    msg.voltage = ac.getVoltage()
    msg.current = ac.getCurrent()
    msg.power = msg.current * msg.voltage
    msg.time_to_live = ac.getTimeToLive()
    msg.energy_consumed = ac.getEnergy()
    msg.runtime = ac.getRunTime()

def talker():
    rospy.init_node('alarms', anonymous=True)
    pub = rospy.Publisher ('/alarms/data',sensors, 1)  
    rate = rospy.Rate(1)  
    
    while not rospy.is_shutdown():
        msg = getData()
        pub.publish(msg)
        #print(msg)
        rate.sleep()    

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass