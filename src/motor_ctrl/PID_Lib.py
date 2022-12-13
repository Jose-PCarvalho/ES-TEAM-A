import numpy 
#from set_server import init_motors



class MotorControl:
    def __init__(self):
        self.pid_v=PID()
        self.pid_w=PID()
        #init_motors()
        self.uv=0
        self.uw=0
        self.u1=0
        self.u2=0

    def motor_speed(self,v_ref,w_ref,v,w):
        self.uv=self.pid_v(v_ref,v,w)
        self.uw=self.pid_w(w_ref, v, w)
        self.u1=self.uv+self.uw
        self.u2=self.uv-self.uw
        return self.u1, self.u2
    class PID:
        def __init__(self,k=2,ki =0.1):
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
            if value > 100:
                return 100, True
            elif value < -100:
                return -100, True
            else:
                return value, False


