import socket
import json
import numpy as np
def get_intersections(r0, r1):
    # circle 1: (x0, y0), radius r0
    # circle 2: (x1, y1), radius r1
    x0=0
    y0=0
    x1=0
    y1=5
    d = np.sqrt((x1 - x0) ** 2 + (y1 - y0) ** 2)
   #non intersecting
    if d > r0 + r1:
        return None
    # One circle within other
    if d < abs(r0 - r1):
        return None
    # coincident circles
    if d == 0 and r0 == r1:
        return None
    else:
        a = (r0 ** 2 - r1 ** 2 + d ** 2) / (2 * d)
        h = np.sqrt(r0 ** 2 - a ** 2)
        x2 = x0 + a * (x1 - x0) / d
        y2 = y0 + a * (y1 - y0) / d
        x3 = x2 + h * (y1 - y0) / d
        y3 = y2 - h * (x1 - x0) / d

        x4 = x2 - h * (y1 - y0) / d
        y4 = y2 + h * (x1 - x0) / d
    if x3>0 and y3>0:
        return x3,y3
    elif x4>0 and y4>0:
        return x4,y4
    else:
        return None


# Create a UDP socket
hostname = "192.168.1.253"
UDP_IP = socket.gethostbyname(hostname)
UDP_PORT = 80
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
sock.bind((UDP_IP, UDP_PORT))
print("***Local ip:" + str(UDP_IP) + "|UDP Port:" + str(UDP_PORT) + "***")
print("####### Server is listening #######")
sock.listen(1)
data, addr = sock.accept()

while True: 
    line = data.recv(1024).decode('UTF-8')
    uwb_list = []
    try:
        uwb_data = json.loads(line)
        rcv_a=False
        rcv_b=False
        uwb_list = uwb_data["links"]
        for uwb_anchor in uwb_list:
            if uwb_anchor['A']=="1313":
                a_r=uwb_anchor['R']
                rcv_a=True
            elif uwb_anchor['A']=="1314":
                b_r=uwb_anchor['R']
                rcv_b=True
        print(rcv_a,rcv_b)
        if rcv_b and rcv_a:
            print(a_r)
            print("metodo2: ",get_intersections(float(a_r),float(b_r)))

    except:
        print(line)
    print("")



