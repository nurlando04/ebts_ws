import socket
import sys
import rospy
import os

import json
from geometry_msgs.msg import Wrench, WrenchStamped
from std_msgs.msg import Float64, Float32, String, Float32MultiArray
from sensor_msgs.msg import JointState
from my_message.msg import linefollowData

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
# Bind the socket to the port. Write IP of this computer and port number, which should be the same as on the Unity side.
server_address = ("192.168.1.223", 8005) # (IP of this computer, port number same as for Unity)
print(sys.stderr, "Starting up on %s port %s" % server_address) 
# Bind socket to corresponding server address
sock.bind(server_address)

# Listen for incoming connections
sock.listen()

print(sys.stderr, "Waiting for a connection...")
# Accepts incoming connection from HoloLens side
connection, client_address = sock.accept()
print(sys.stderr, "Connection from", client_address)

class Nodo():
    def __init__(self):
        self.pos = None
        self.temp = 0
        # Below we subscribe to topics
        sub2 = rospy.Subscriber('/chatter', Float32, self.callback2)
        sub = rospy.Subscriber('/franka_state_controller/joint_states', JointState, self.callback)
        # sub3 = rospy.Subscriber('/linefollow_data', linefollowData, self.callbackWave)
        # sub = rospy.Subscriber('/joint_states', JointState, self.callback)
        rospy.spin()

    # def callback2(self, data2):
        # print ("mode "+str(data2.data))

    
    # def callbackWave(self, msg):
    #     self.sinus = msg.wave

    def callback2(self, msg):
        self.force = msg.data
        

    def callback(self, data):   
        self.pos = data.position
        self.pos = list(self.pos)
        self.pos.append(self.force)
        self.pos.append(0)
        
        self.pos = tuple(self.pos)
        b = json.dumps(self.pos)

        print(self.pos)

        try:
            #connection.send(str(self.pos).encode())
            connection.send(b.encode())#+ '\n'.encode())
            # mode = connection.recv(1024)
            # twosignals=mode.decode("utf-8").split('|')


        except:
            print("Closing connection")
            connection.close()
            reason = "I need to"
            rospy.signal_shutdown(reason)
            #rospy.shutdown()
            exit()

        # print(twosignals)
            
        # if len(twosignals[1])<10 and len(twosignals[1])>3:
        #     signal=[float(twosignals[0].replace(',','.')), float(twosignals[1][0:-2].replace(',','.'))]
        # elif len(twosignals[1])<=3:
        #     signal=[float(twosignals[0].replace(',','.')), float(twosignals[1][0:2].replace(',','.'))]
        # else:
        #     signal=[float(twosignals[0].replace(',','.')), float(twosignals[1][0:6].replace(',','.'))]
        
        # if signal[1]>0:
        #     signal[1]=0
        
        # signal=[-8/0.3*signal[0], 8/0.5*signal[1]]

        # if abs(self.temp-signal[1])>8:
        #     signal[1]=self.temp



        # self.temp=signal[1]

			
if __name__ == '__main__':
    rospy.init_node('android_socket', anonymous=True)
    #print("mode 0")
    s = Nodo()	
    
connection.close()