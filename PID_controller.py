import numpy 

class PID:

    def __init__(self):
        self.v = 1
        self.w = 90
        self.Vref = 12
        self.Wref = 0
        self.k = 2

    def clip(self,value):
        if value > 100 :
            return 100, True
        elif value < -100 :
            return -1, True
        else:
            return value, False 

    def test(self):
        print("v={0}".format(self.v))
        print("w={0}".format(self.w))
        uv = self.k*(self.Vref-self.v)
        uw = self.k*(self.Wref-self.w)            

        uv,ov = self.clip(uv)
        uw,ov = self.clip(uw)

        u1 = uv+uw
        u2 = uv-uw
        
        print(uv)
        print(uw)
        
        self.v = self.v + 10
        self.w = self.w + 45

        u1,ov = self.clip(u1)
        u2,ov = self.clip(u2)
        print(u1)
        print(u2)
        print("\n")
        return u1,u2

            
                    
PID1 = PID()
for i in range (1,10):  
    u1,u2 = PID1.test()
   



    


