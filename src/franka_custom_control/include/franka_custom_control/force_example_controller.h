// Copyright (c) 2017 Franka Emika GmbH
// Use of this source code is governed by the Apache-2.0 license, see LICENSE
#pragma once

#include <memory>
#include <string>
#include <vector>

#include <controller_interface/multi_interface_controller.h>
#include <dynamic_reconfigure/server.h>
#include <franka_hw/franka_model_interface.h>
#include <franka_hw/franka_state_interface.h>
#include <hardware_interface/joint_command_interface.h>
#include <hardware_interface/robot_hw.h>
#include <ros/node_handle.h>
#include <ros/time.h>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <geometry_msgs/PoseStamped.h>

#include <sensor_msgs/JointState.h>

#include <franka_custom_control/compliance_paramConfig.h>

#include <franka_custom_control/desired_mass_paramConfig.h>
#include <franka_hw/franka_model_interface.h>
#include <franka_hw/franka_state_interface.h>

#include <franka_hw/franka_cartesian_command_interface.h>


#include <geometry_msgs/WrenchStamped.h>


#include <franka_msgs/FrankaState.h>

#include <std_msgs/Float32.h>

#include <my_message/linefollowData.h>


namespace franka_custom_control {




class ForceExampleController : public controller_interface::MultiInterfaceController<
                                   franka_hw::FrankaModelInterface,
                                   hardware_interface::EffortJointInterface,
                                   franka_hw::FrankaStateInterface> {
 public:
  bool init(hardware_interface::RobotHW* robot_hw, ros::NodeHandle& node_handle) override;
  void starting(const ros::Time&) override;
  void update(const ros::Time&, const ros::Duration& period) override;

 private:
////////////////////////////////
//   franka_hw::FrankaPoseCartesianInterface* cartesian_pose_interface_;
//   std::unique_ptr<franka_hw::FrankaCartesianPoseHandle> cartesian_pose_handle_;
//   ros::Duration elapsed_time_;


///////////////////////////////
  // Saturation
  Eigen::Matrix<double, 7, 1> saturateTorqueRate(
      const Eigen::Matrix<double, 7, 1>& tau_d_calculated,
      const Eigen::Matrix<double, 7, 1>& tau_J_d);  // NOLINT (readability-identifier-naming)

  std::unique_ptr<franka_hw::FrankaModelHandle> model_handle_;
  std::unique_ptr<franka_hw::FrankaStateHandle> state_handle_;
  std::vector<hardware_interface::JointHandle> joint_handles_;

  double desired_mass_{0.0};
  double target_mass_{0.0};
  double k_p_{0.0};
  double k_i_{0.0};
  double target_k_p_{0.0};
  double target_k_i_{0.0};
  double filter_gain_{0.001};
  Eigen::Matrix<double, 7, 1> tau_ext_initial_;
  Eigen::Matrix<double, 7, 1> tau_error_;
  static constexpr double kDeltaTauMax{1.0};
  //////////////////////////From cartesian_impedance 
  double filter_params_{0.005};
  double nullspace_stiffness_{20.0};
  double nullspace_stiffness_target_{20.0};
  const double delta_tau_max_{1.0};
  Eigen::Matrix<double, 6, 6> cartesian_stiffness_;
  Eigen::Matrix<double, 6, 6> cartesian_stiffness_target_;
  Eigen::Matrix<double, 6, 6> cartesian_damping_;
  Eigen::Matrix<double, 6, 6> cartesian_damping_target_;
  Eigen::Matrix<double, 7, 1> q_d_nullspace_;
  Eigen::Vector3d position_d_;
  Eigen::Quaterniond orientation_d_;
  Eigen::Vector3d position_d_target_;
  Eigen::Quaterniond orientation_d_target_;
  ///////

  // Dynamic reconfigure
  std::unique_ptr<dynamic_reconfigure::Server<franka_example_controllers::desired_mass_paramConfig>>
      dynamic_server_desired_mass_param_;
  ros::NodeHandle dynamic_reconfigure_desired_mass_param_node_;
  void desiredMassParamCallback(franka_example_controllers::desired_mass_paramConfig& config,
                                uint32_t level);

  std::unique_ptr<dynamic_reconfigure::Server<franka_example_controllers::compliance_paramConfig>>
      dynamic_server_compliance_param_;
  ros::NodeHandle dynamic_reconfigure_compliance_param_node_;
  void complianceParamCallback(franka_example_controllers::compliance_paramConfig& config,
                               uint32_t level);

  //From cartesian_impedance 
  ros::Subscriber sub_equilibrium_pose_;
  void equilibriumPoseCallback(const geometry_msgs::PoseStampedConstPtr& msg);
  //////////////////
  // Sensor Pose Subscriber
  ros::Subscriber sub_dimash_;
  ros::Subscriber sub_nurlan_;
  ros::Subscriber sub4;
  ros::Subscriber sub_vel_;
  ros::Subscriber sub_desired_force;

  void chatterCallback(const geometry_msgs::WrenchStamped& msg);
  void chatBack(const std_msgs::Float32& mas);
  void getState(const franka_msgs::FrankaState& msg);
  void velocityCallback(const sensor_msgs::JointState& msg);
  void desire_callback(const my_message::linefollowData& msg);
};


}  // namespace franka_example_controllers
