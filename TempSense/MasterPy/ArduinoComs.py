import smbus2 as smbus
import time

class ArduinoComs:
    # Constants
    __N_TEMP_SENSORS    = 4
    __N_WATER_SENSORS   = 2
    __GET_CURRENT       = 1
    __GET_VOLTAGE       = 2
    __GET_ENERGY        = 3
    __GET_RUNTIME       = 4
    __GET_TIME_TO_LIVE  = 5
    __GET_TEMP          = 6
    __GET_WATER         = 7
    __SPECIAL_CMD       = 8
    __FLOAT_LEN         = 8
    __LONG_LEN          = 11
    BATT_TEMP_INDEX     = 0
    RASP_TEMP_INDEX     = 1
    ESCE_TEMP_INDEX     = 2
    ESCB_TEMP_INDEX     = 3
    CTRL_WATER_SENSOR   = 0
    PWR_WATER_SENSOR    = 1
    SILENCE_ALLARM      = 0
    TEST_TEMP           = 1
    TEST_WATER          = 2
    TEST_VOLTAGE        = 3
    TEST_PERIPHERALS    = 4
    # Private Methods
    def __init__(self, bus, arduinoAdress):
        self.__arduinoAdress=arduinoAdress
        self.__bus=smbus.SMBus(bus)

    def __getFloatParameter(self, code, depth=0):
        '''
            Get a float parameter from Arduino
            Arguments:
                code: The code to a float parameter
            Returns: 
                The parameter requested
        '''
        self.__sendCommand(code)
        resp=self.__requestParameter(self.__FLOAT_LEN)
        try:
            resp=float(resp)
        except:
            resp=self.__getFloatParameter(code, depth+1)
            if depth>3:
                return 0
        return resp    
    
    def __getLongParameter(self, code):
        '''
            Get an int parameter from Arduino
            Arguments:
                code: The code to an int parameter
            Returns: 
                The parameter requested
        '''
        self.__sendCommand(code)
        resp=self.__requestParameter(self.__LONG_LEN)
        return int(resp)

    def __requestParameter(self, len):
        '''
            Request data from Arduino
            Arguments:
                len: The lenght of the data to be read in bytes
            Returns:
                A string with the bytes read
        '''
        #for byte in range(len):
        data=[]
        try:
            data=self.__bus.read_i2c_block_data(self.__arduinoAdress, 0x00, len)
        except:
            print('IO ERROR')
        data=''.join([chr(d) for d in data])
        return data

    def __sendCommand(self, code):
        '''
            Send a command to Arduino
            Arguments:
                code: The code to be sent
        '''
        self.__bus.write_byte(self.__arduinoAdress, code)
        #time.sleep(0.1)
    # Public Methods    
    def getTempX(self, sensor):
        '''
            Get temperature from sensor x
            Arguments:
                sensor: The number of the sensor starting at 0
            Returns: 
                The temperature measured by the sensor in Celcius (float)
        '''
        self.__sendCommand(self.__GET_TEMP)
        return self.__getFloatParameter(sensor)

    def getTempAll(self):
        '''
            Get all the temperature readings
            Returns: 
                Array with the temperatures
        '''
        readings=[]
        for sensor in range(self.__N_TEMP_SENSORS):
            readings.append(self.getTempX(sensor))
        return readings

    def getWaterX(self, sensor):
        '''
            Read water sensor
            Arguments:
                sensor: The number of the sensor starting at 0
            Returns: 
                True if water is present
        '''
        self.__sendCommand(self.__GET_WATER)
        return self.__getFloatParameter(sensor)==1

    def getWaterAll(self):
        '''
            Get the readings from the water sensors
            Returns: 
                True if any of the sensors detect water
        '''
        self.__sendCommand(self.__GET_WATER)
        return self.__getFloatParameter(self.__N_WATER_SENSORS)==1

    def getCurrent(self):
        '''
            Get Current reading
            Returns: 
                The current read in Ampere
        '''
        return self.__getFloatParameter(self.__GET_CURRENT)

    def getVoltage(self):
        '''
            Get Voltage reading
            Returns: 
                Voltage read in Volt
        '''
        return self.__getFloatParameter(self.__GET_VOLTAGE)

    def getEnergy(self):
        '''
            Get Energy spent
            Returns: 
                The energy spent in Wh
        '''
        return self.__getFloatParameter(self.__GET_ENERGY)

    def getRunTime(self):
        '''
            Get Run Time, the time since last turn on
            Returns: 
                Time in senconds
        '''
        return self.__getFloatParameter(self.__GET_RUNTIME)

    def getTimeToLive(self):
        '''
            Get estyimated time to live, based on run time, 
            energy consumed and total available energy
            Returns: 
                Time estimation in seconds
        '''
        return self.__getFloatParameter(self.__GET_TIME_TO_LIVE)

    def sendCmd(self, code):
        '''
            Get estyimated time to live, based on run time, 
            energy consumed and total available energy
            Arguments: 
                Command to be sent
        '''
        self.__sendCommand(self.__SPECIAL_CMD)
        self.__sendCommand(code)
    