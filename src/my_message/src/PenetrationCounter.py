from geometry_msgs.msg import WrenchStamped
from std_msgs.msg import String, Float64, Float32, Float32MultiArray
import rospy
import numpy as np
from franka_msgs.msg import FrankaState
from my_message.msg import GraphData, linefollowData
import sys
import rosbag
import os



'''This script is made for the second experiment? mostly i forget what it did, hope you understand good luck ( ͡~ ͜ʖ ͡°) '''
#novibro
#vibro
#holonovibro
#holovibro
#allnovibro
#allvibro
#names_arr=['_novibro','_vibro', '_holonovibro', '_holovibro', '_allnovibro', '_allvibro']
names_arr=['_holovibro', '_holonovibro','_novibro','_vibro', '_allvibro', '_allnovibro' ]

number=3
breakbool=False
while True:
    for i in range(6):
        path='/home/robpc/catkin_ws2/src/my_message/src/AllExperiments/experiment'+str(number)
        if not os.path.exists(path):
            os.mkdir(path)

        name='/home/robpc/catkin_ws2/src/my_message/src/AllExperiments/experiment'+str(number)+'/'+ str(number) + names_arr[i] + '.bag'
        if not os.path.exists(name):
                
            print(name)
            bag=rosbag.Bag(name,'w')
            breakbool=True
            break
    if breakbool: # nessecary to break the second loop
        break
    number+=1



class Nodo():

    def __init__(self):
        self.ar_desired=None
        sub1_2_3 = rospy.Subscriber('/linefollow_data', linefollowData, self.linefollow_callback)
        sub4 = rospy.Subscriber('/wrench', WrenchStamped, self.weiss_callback)
        sub5 = rospy.Subscriber('/franka_state_controller/F_ext',WrenchStamped, self.robotf_callback)
        #sub6 = rospy.Subscriber('/wrench2',WrenchStamped,self.weiss2_callback)
        sub7 = rospy.Subscriber('/franka_state_controller/franka_states', FrankaState, self.deltax_callback)
        sub8_9 = rospy.Subscriber('/two_signals', Float32MultiArray, self.AR_callback) # for desired and actual AR force
        rospy.spin()

    #1_2_3
    def linefollow_callback(self,msg):
        self.errSq=msg.mean_squared_error
        self.desForce=msg.y_desired
        self.event_force = msg.y_sensed
        self.trialnum=msg.numoftrial


        pub = rospy.Publisher('force_data', GraphData, queue_size=1)
        message = GraphData()
        message.ms_error=self.errSq
        message.force_desired=self.desForce
        message.force_event= self.event_force
        message.force_weiss = self.weiss_force
        message.force_robot = self.sensed_robot_force
        message.delta_z = self.delta_x
        #message.force_weiss2 = self.weiss2_force
        if self.ar_desired!=None:
            message.desire_ar=self.ar_desired
            message.sense_ar=self.ar_sensed
        
        pub.publish(message)


        if self.trialnum>0 and self.trialnum<=30:
            bag.write('MSE',message)
        elif self.trialnum>20:
            bag.close()
            reason = "i need to"
            print("closed")

            rospy.signal_shutdown(reason)

    #4  
    def weiss_callback(self, msg):
        self.weiss_force = msg.wrench.force.z
    #5
    def robotf_callback(self, msg):
        self.sensed_robot_force = msg.wrench.force.z
    #6
    def weiss2_callback(self,msg):
        self.weiss2_force = msg.wrench.force.z
    
    #7
    def deltax_callback(self, msg):
        self.delta_x = msg.O_T_EE[14]
    
    #8_9
    def AR_callback(self,msg):
        self.ar_sensed = msg.data[0]
        self.ar_desired = msg.data[1] 
    

        




if __name__ == '__main__':
    rospy.init_node('all_data_node')
    #print("mode 0")
    s = Nodo()	