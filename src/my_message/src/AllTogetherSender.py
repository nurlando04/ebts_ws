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
# Bind the socket to the port
server_address = ("192.168.1.223", 8005)
print(sys.stderr, "starting up on %s port %s" % server_address)

sock.bind(server_address)

# Listen for incoming connections
sock.listen()

print(sys.stderr, "waiting for a connection")
connection, client_address = sock.accept()
print(sys.stderr, "connection from", client_address)


class Nodo():

    def __init__(self):
        self.pos = None
        self.temp = 0
        self.sinus = 0
        sub2 = rospy.Subscriber('/chatter', Float32, self.callbackEbtsForce)
        sub3 = rospy.Subscriber(
            '/linefollow_data', linefollowData, self.callbackWave)
        sub = rospy.Subscriber(
            '/franka_state_controller/joint_states', JointState, self.callback)
        rospy.spin()

    def callbackWave(self, msg):
        # print(msg.y_desired)
        self.sinus = msg.y_desired

    def callbackEbtsForce(self, msg):
        self.force = msg.data

    def callback(self, data):
        self.pos = data.position
        self.pos = list(self.pos)
        self.pos.append(self.force)
        self.pos.append(self.sinus)
        self.pos = tuple(self.pos)
        b = json.dumps(self.pos)

        try:
            connection.send(b.encode())
            print(b)
            mode = connection.recv(1024)
            twosignals = mode.decode("utf-8").split('|')

        except:
            print("closing connection")
            connection.close()
            reason = "i need to"
            rospy.signal_shutdown(reason)
            exit()

        print(twosignals)

        if len(twosignals[1]) < 10 and len(twosignals[1]) > 3:
            signal = [float(twosignals[0].replace(',', '.')),
                      float(twosignals[1][0:-2].replace(',', '.'))]
        elif len(twosignals[1]) <= 3:
            signal = [float(twosignals[0].replace(',', '.')),
                      float(twosignals[1][0:2].replace(',', '.'))]
        else:
            signal = [float(twosignals[0].replace(',', '.')),
                      float(twosignals[1][0:6].replace(',', '.'))]

        if signal[1] > 0:
            signal[1] = 0

        signal = [-8/0.3*signal[0], 8/0.5*signal[1]]

        if abs(self.temp-signal[1]) > 8:
            signal[1] = self.temp

        pub = rospy.Publisher('two_signals', Float32MultiArray, queue_size=1)
        msg = Float32MultiArray()
        msg.data = signal
        pub.publish(msg)
        self.temp = signal[1]


if __name__ == '__main__':
    rospy.init_node('wearami_socket', anonymous=True)
    s = Nodo()

connection.close()
