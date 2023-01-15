import smbus2 as smbus

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
    __FLOAT_LEN         = 8
    __LONG_LEN          = 11
    # Private Methods
    def __init__(self, bus, arduinoAdress):
        self.__arduinoAdress=arduinoAdress
        self.__bus=smbus.SMBus(bus)

    def __getFloatParameter(code):
        '''
            Get a float parameter from Arduino
            Arguments:
                code: The code to a float parameter
            Returns: 
                The parameter requested
        '''
        self.__sendCommand(code)
        resp=self.__requestParameter(self.__FLOAT_LEN)
        return float(resp)    
    
    def __getLongParameter(code):
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

    def __requestParameter(len):
        '''
            Request data from Arduino
            Arguments:
                len: The lenght of the data to be read in bytes
            Returns:
                A string with the bytes read
        '''
        data=''
        for byte in range(len):
            data+=chr(self.__bus.read_byte(self.__arduinoAdress))
        return data

    def __sendCommand(code):
        '''
            Send a command to Arduino
            Arguments:
                code: The code to be sent
        '''
        self.__bus.write_byte(self.__arduinoAdress, code)

    # Public Methods    
    def getTempX(sensor):
        '''
            Get temperature from sensor x
            Arguments:
                sensor: The number of the sensor starting at 0
            Returns: 
                The temperature measured by the sensor in Celcius (float)
        '''
        self.__sendCommand(self.__GET_TEMP)
        return self.__getFloatParameter(sensor)

    def getTempAll():
        '''
            Get all the temperature readings
            Returns: 
                Array with the temperatures
        '''
        readings=[]
        for sensor in range(self.__N_TEMP_SENSORS):
            readings.append(self.getTempX(sensor))
        return readings

    def getWaterX(sensor):
        '''
            Read water sensor
            Arguments:
                sensor: The number of the sensor starting at 0
            Returns: 
                True if water is present
        '''
        self.__sendCommand(self.__GET_WATER)
        return self.__getFloatParameter(sensor)==1

    def getWaterAll():
        '''
            Get the readings from the water sensors
            Returns: 
                True if any of the sensors detect water
        '''
        self.__sendCommand(self.__GET_WATER)
        return self.__getFloatParameter(self.__N_WATER_SENSORS)==1

    def getCurrent():
        '''
            Get Current reading
            Returns: 
                The current read in Ampere
        '''
        return self.__getFloatParameter(self.__GET_CURRENT)

    def getVoltage():
        '''
            Get Voltage reading
            Returns: 
                Voltage read in Volt
        '''
        return self.__getFloatParameter(self.__GET_VOLTAGE)

    def getEnergy():
        '''
            Get Energy spent
            Returns: 
                The energy spent in Wh
        '''
        return self.__getFloatParameter(self.__GET_ENERGY)

    def getRunTime():
        '''
            Get Run Time, the time since last turn on
            Returns: 
                Time in senconds
        '''
        return self.__getFloatParameter(self.__GET_RUNTIME)

    def getTimeToLive():
        '''
            Get estyimated time to live, based on run time, 
            energy consumed and total available energy
            Returns: 
                Time estimation in seconds
        '''
        return self.__getFloatParameter(self.__GET_TIME_TO_LIVE)
