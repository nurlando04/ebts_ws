import matplotlib.pyplot as plt
import rospy
import numpy as np
from matplotlib.animation import FuncAnimation
from geometry_msgs.msg import WrenchStamped
from std_msgs.msg import String, Float64, Float32
from my_message.msg import GraphData, linefollowData
from datetime import datetime

f = 1000
fs = 2000
Ts = 1/fs


class Visualiser:
    def __init__(self):
        self.fig, self.ax = plt.subplots()
        self.ax.set_xlim(0, 320)
        self.ax.set_ylim(-10, 2)
        self.sum = 0.0
        self.desired_force_line, = plt.plot([], [], 'g')
        self.actual_force_line, = plt.plot([], [], 'r')
        self.x_actual_data, self.y_actual_data = [0], [0]
        self.y_desired_data, self.x_desired_data = [0], [0]
        self.count = 0
        self.maxt = 320
        self.dt = Ts
        self.x_index_actual=0
        self.x_index_desired=0
        self.MSE=0
        self.pub = rospy.Publisher('linefollow_data', linefollowData, queue_size=1)

    def ebts_callback(self, msg):
        self.force_data = msg.data

    def update_plot(self, frame):
        self.x_index_actual = len(self.x_actual_data)
        self.x_index_desired = len(self.x_actual_data) + self.maxt/4

        self.y_actual_data.append(-self.force_data)
        self.x_actual_data.append(self.x_index_actual+1)

        last = self.x_actual_data[-1]

        if last > self.maxt/2:
            self.ax.set_xlim(last - self.maxt/2, last + self.maxt/2)

        t = self.x_actual_data[-1] + self.dt

        if self.x_index_actual < self.maxt/4 or np.sin((self.x_index_desired/fs)*2*np.pi*f/100)*6 > 0:
            self.y_desired_data.append(0)
        else:
            self.y_desired_data.append(np.sin((self.x_index_desired/fs)*2*np.pi*f/100)*6)

        self.x_desired_data.append(self.x_index_desired+1)

        self.desired_force_line.set_data(
            self.x_desired_data, self.y_desired_data)

        self.actual_force_line.set_data(self.x_actual_data, self.y_actual_data)

        if self.x_index_actual > self.maxt/2:
            self.calculateMSE()
            self.publishLineFollowData()

        return self.actual_force_line, self.desired_force_line

    def calculateMSE(self):

        dif = self.y_actual_data[self.x_index_actual] - \
            self.y_desired_data[int(self.x_index_actual-self.maxt/4)]
        squared_dif = dif**2
        self.sum = self.sum + squared_dif
        MSE = self.sum/(self.x_index_actual+1)
        print(MSE)
        print("actual data:" + str(self.y_actual_data[self.x_index_actual]))
        print("desired data:" + str(self.y_desired_data[int(self.x_index_actual-self.maxt/4)]))
    
    def publishLineFollowData(self):
        msg2 = linefollowData()
        msg2.mean_squared_error = round(self.MSE, 3)
        msg2.y_desired = self.y_desired_data[int(self.x_index_actual-self.maxt/4)]
        msg2.y_sensed = self.y_actual_data[self.x_index_actual]
        self.pub.publish(msg2)


vis = Visualiser()
rospy.init_node('force_visual_node')
sub = rospy.Subscriber('/chatter', Float32, vis.ebts_callback)
ani = FuncAnimation(vis.fig, vis.update_plot, interval=50, cache_frame_data=False)

plt.show(block=True)
