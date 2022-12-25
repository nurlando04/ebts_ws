import matplotlib.pyplot as plt
import rospy
import numpy as np
from matplotlib.animation import FuncAnimation
from geometry_msgs.msg import WrenchStamped
from std_msgs.msg import String, Float64, Float32
from my_message.msg import GraphData, linefollowData

f = 1000
fs = 2000
Ts = 1/fs


class Visualiser:
    def __init__(self):
        self.fig, self.ax = plt.subplots()
        self.sum = 0.0
        self.desired_force_line, = plt.plot([], [], 'g')
        self.actual_force_line, = plt.plot([], [], 'r')
        self.x_actual_data, self.y_actual_data = [0], [0]
        self.y_desired_data, self.x_desired_data = [0], [0]
        self.count = 0

    def plot_init(self, dt=Ts):
        self.dt = dt
        self.maxt = 320
        self.ax.set_xlim(0, self.maxt)
        self.ax.set_ylim(-10, 2)
        return self.actual_force_line, self.desired_force_line

    def odom_callback(self, msg):
        self.force_data = msg.data

    def update_plot(self, frame):
        # self.force_data = 0#msg.data
        x_index_actual_line = len(self.x_actual_data)
        x_index_desired_line = self.maxt/4+x_index_actual_line
        self.y_actual_data.append(-self.force_data)
        self.x_actual_data.append(x_index_actual_line+1)

        lastt = self.x_actual_data[-1]

        if lastt > self.maxt/2:
            self.ax.set_xlim(lastt - self.maxt/2, lastt + self.maxt/2)

        t = self.x_actual_data[-1] + self.dt

        if x_index_actual_line < self.maxt/4 or np.sin((x_index_desired_line/fs)*2*np.pi*f/100)*6 > 0:
            self.y_desired_data.append(0)
        else:
            self.y_desired_data.append(np.sin((x_index_desired_line/fs)*2*np.pi*f/100)*6)

        self.x_desired_data.append(x_index_desired_line+1)

        self.desired_force_line.set_data(
            self.x_desired_data, self.y_desired_data)

        self.actual_force_line.set_data(self.x_actual_data, self.y_actual_data)

        if x_index_actual_line > self.maxt/2:
            dif = self.y_actual_data[x_index_actual_line] - \
                self.y_desired_data[int(x_index_actual_line-self.maxt/4)]
        else:
            dif = 0
        squared_dif = dif**2

        self.sum = self.sum + squared_dif
        if x_index_actual_line != 0:
            MSE = self.sum/x_index_actual_line
            print(MSE)
            print("actual data:" + str(self.y_actual_data[x_index_actual_line]))
            print("desired data:" + str(self.y_desired_data[x_index_actual_line]))
        pub = rospy.Publisher('linefollow_data', linefollowData, queue_size=1)
        msg2 = linefollowData()
        msg2.mean_squared_error = round(MSE, 3)
        msg2.y_desired = self.y_desired_data[x_index_actual_line]
        msg2.y_sensed = self.y_actual_data[x_index_actual_line]
        # msg2.x_value = x_index/500 #???????
        pub.publish(msg2)

        return self.actual_force_line, self.desired_force_line


vis = Visualiser()
rospy.init_node('force_visual_node')
sub = rospy.Subscriber('/chatter', Float32, vis.odom_callback)
ani = FuncAnimation(vis.fig, vis.update_plot,
                    init_func=vis.plot_init, interval=1, cache_frame_data=False)

plt.show(block=True)
