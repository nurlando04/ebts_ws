// Copyright (c) 2017 Franka Emika GmbH
// Use of this source code is governed by the Apache-2.0 license, see LICENSE
#include <franka_custom_control/force_example_controller.h>

#include <cmath>
#include <memory>

#include <controller_interface/controller_base.h>
#include <pluginlib/class_list_macros.h>
#include <ros/ros.h>
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include <franka/robot_state.h>
#include <geometry_msgs/WrenchStamped.h>
#include <franka_hw/franka_cartesian_command_interface.h>
#include <hardware_interface/hardware_interface.h>
#include <sensor_msgs/JointState.h>
#include <my_message/linefollowData.h>


#include <franka_msgs/FrankaState.h>
#include <franka_custom_control/pseudo_inversion.h>

namespace franka_custom_control {

float dataFromSensor = 0.0;
float eventForce=0.0;
float appliedMass=0.0;
bool hapticDevice = false;
bool contact = false;
float velocityD=0.0;
float desiredforce = 0.0;
float minimumThreshold=2.0;

float forceToApply=0.0;

float startPosJoin5;
float currentPosJoint5;
int getInit = 0;
bool goingUp = false;
std::array<double, 16> pose_current {};

bool ForceExampleController::init(hardware_interface::RobotHW* robot_hw,
                                  ros::NodeHandle& node_handle) {
  std::vector<std::string> joint_names;
  std::string arm_id;

  sub_vel_ = node_handle.subscribe("/franka_state_controller/joint_states",20, &ForceExampleController::velocityCallback, this, ros::TransportHints().reliable().tcpNoDelay());
  sub_dimash_ = node_handle.subscribe(
      "/wrench", 20, &ForceExampleController::chatterCallback, this,
      ros::TransportHints().reliable().tcpNoDelay());
      ////////////////////////////////////////

/////////////////////////////////////////////////////
  sub_nurlan_= node_handle.subscribe("/chatter", 20, &ForceExampleController::chatBack,this,
    ros::TransportHints().reliable().tcpNoDelay());
  sub_desired_force= node_handle.subscribe("/linefollow_data", 20, &ForceExampleController::desire_callback,this,ros::TransportHints().reliable().tcpNoDelay());
  ROS_WARN(
      "ForceExampleController: Make sure your robot's endeffector is in contact "
      "with a horizontal surface before starting the controller!");
  if (!node_handle.getParam("arm_id", arm_id)) {
    ROS_ERROR("ForceExampleController: Could not read parameter arm_id");
    return false;
  }
  if (!node_handle.getParam("joint_names", joint_names) || joint_names.size() != 7) {
    ROS_ERROR(
        "ForceExampleController: Invalid or no joint_names parameters provided, aborting "
        "controller init!");
    return false;
  }
  /////////////////Joint interface///////////////////////////
  // try {
  //   cartesian_pose_handle_ = std::make_unique<franka_hw::FrankaCartesianPoseHandle>(
  //       cartesian_pose_interface_->getHandle(arm_id + "_robot"));
  // } catch (const hardware_interface::HardwareInterfaceException& e) {
  //   ROS_ERROR_STREAM(
  //       "CartesianPoseExampleController: Exception getting Cartesian handle: " << e.what());
  //   return false;
  // }
  ///////////////////////////////////////////////////////////////



  auto* model_interface = robot_hw->get<franka_hw::FrankaModelInterface>();
  if (model_interface == nullptr) {
    ROS_ERROR_STREAM("ForceExampleController: Error getting model interface from hardware");
    return false;
  }
  try {
    model_handle_ = std::make_unique<franka_hw::FrankaModelHandle>(
        model_interface->getHandle(arm_id + "_model"));
  } catch (hardware_interface::HardwareInterfaceException& ex) {
    ROS_ERROR_STREAM(
        "ForceExampleController: Exception getting model handle from interface: " << ex.what());
    return false;
  }

  auto* state_interface = robot_hw->get<franka_hw::FrankaStateInterface>();
  if (state_interface == nullptr) {
    ROS_ERROR_STREAM("ForceExampleController: Error getting state interface from hardware");
    return false;
  }
  try {
    state_handle_ = std::make_unique<franka_hw::FrankaStateHandle>(
        state_interface->getHandle(arm_id + "_robot"));
  } catch (hardware_interface::HardwareInterfaceException& ex) {
    ROS_ERROR_STREAM(
        "ForceExampleController: Exception getting state handle from interface: " << ex.what());
    return false;
  }

  auto* effort_joint_interface = robot_hw->get<hardware_interface::EffortJointInterface>();
  if (effort_joint_interface == nullptr) {
    ROS_ERROR_STREAM("ForceExampleController: Error getting effort joint interface from hardware");
    return false;
  }
  for (size_t i = 0; i < 7; ++i) {
    try {
      joint_handles_.push_back(effort_joint_interface->getHandle(joint_names[i]));
    } catch (const hardware_interface::HardwareInterfaceException& ex) {
      ROS_ERROR_STREAM("ForceExampleController: Exception getting joint handles: " << ex.what());
      return false;
    }
  }

  dynamic_reconfigure_desired_mass_param_node_ =
      ros::NodeHandle("dynamic_reconfigure_desired_mass_param_node");
  dynamic_server_desired_mass_param_ = std::make_unique<
      dynamic_reconfigure::Server<franka_example_controllers::desired_mass_paramConfig>>(

      dynamic_reconfigure_desired_mass_param_node_);
  dynamic_server_desired_mass_param_->setCallback(
      boost::bind(&ForceExampleController::desiredMassParamCallback, this, _1, _2));


  ///////
  dynamic_reconfigure_compliance_param_node_ =
      ros::NodeHandle("dynamic_reconfigure_compliance_param_node");

  dynamic_server_compliance_param_ = std::make_unique<
      dynamic_reconfigure::Server<franka_example_controllers::compliance_paramConfig>>(

      dynamic_reconfigure_compliance_param_node_);
  dynamic_server_compliance_param_->setCallback(
      boost::bind(&ForceExampleController::complianceParamCallback, this, _1, _2));



  position_d_.setZero();
  orientation_d_.coeffs() << 0.0, 0.0, 0.0, 1.0;
  position_d_target_.setZero();
  orientation_d_target_.coeffs() << 0.0, 0.0, 0.0, 1.0;
  ///////////


  return true;
}

void ForceExampleController::starting(const ros::Time& /*time*/) {
  // compute initial velocity with jacobian and set x_attractor and q_d_nullspace
  // to initial configuration
  franka::RobotState robot_state = state_handle_->getRobotState();

  //////////////////////////////////////////////////////////
  franka::RobotState initial_state = state_handle_->getRobotState();

    // get jacobian
  std::array<double, 42> jacobian_array =
      model_handle_->getZeroJacobian(franka::Frame::kEndEffector);
  // convert to eigen
  Eigen::Map<Eigen::Matrix<double, 7, 1>> q_initial(initial_state.q.data());
  Eigen::Affine3d initial_transform(Eigen::Matrix4d::Map(initial_state.O_T_EE.data()));
    // set equilibrium point to current state
  position_d_ = initial_transform.translation();
  orientation_d_ = Eigen::Quaterniond(initial_transform.linear());
  position_d_target_ = initial_transform.translation();
  orientation_d_target_ = Eigen::Quaterniond(initial_transform.linear());
  // set nullspace equilibrium configuration to initial q
  q_d_nullspace_ = q_initial;
//////////////////////////////////////////////////////////////////


  std::array<double, 7> gravity_array = model_handle_->getGravity();
  Eigen::Map<Eigen::Matrix<double, 7, 1>> tau_measured(robot_state.tau_J.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> gravity(gravity_array.data());
  // Bias correction for the current external torque
  tau_ext_initial_ = tau_measured - gravity;
  tau_error_.setZero();
}

void ForceExampleController::update(const ros::Time& /*time*/, const ros::Duration& period) {

  // get state variables
  franka::RobotState robot_state = state_handle_->getRobotState();
  std::array<double, 42> jacobian_array =
      model_handle_->getZeroJacobian(franka::Frame::kEndEffector);
  std::array<double, 7> gravity_array = model_handle_->getGravity();
  ///////////////////
  std::array<double, 7> coriolis_array = model_handle_->getCoriolis();
  ////////////////////////

  // convert to Eigen

  /////////////////////
  Eigen::Map<Eigen::Matrix<double, 7, 1>> coriolis(coriolis_array.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> q(robot_state.q.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> dq(robot_state.dq.data());
  Eigen::Affine3d transform(Eigen::Matrix4d::Map(robot_state.O_T_EE.data()));
  Eigen::Vector3d position(transform.translation());
  Eigen::Quaterniond orientation(transform.linear());
  ////////////////////
  //std::cout << robot_state.joint_states.velocity[3] << '\n';


  Eigen::Map<Eigen::Matrix<double, 6, 7>> jacobian(jacobian_array.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> tau_measured(robot_state.tau_J.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> tau_J_d(  // NOLINT (readability-identifier-naming)
      robot_state.tau_J_d.data());
  Eigen::Map<Eigen::Matrix<double, 7, 1>> gravity(gravity_array.data());

//////////////
  // compute error to desired pose
  // position error
  Eigen::Matrix<double, 6, 1> error;
  error.head(3) << position - position_d_;

  // orientation error
  if (orientation_d_.coeffs().dot(orientation.coeffs()) < 0.0) {
    orientation.coeffs() << -orientation.coeffs();
  }
  // "difference" quaternion
  Eigen::Quaterniond error_quaternion(orientation.inverse() * orientation_d_);
  error.tail(3) << error_quaternion.x(), error_quaternion.y(), error_quaternion.z();
  // Transform to base frame
  error.tail(3) << -transform.linear() * error.tail(3);


 // compute control
  // allocate variables
  Eigen::VectorXd tau_task(7), tau_nullspace(7),tau_d2(7), tau_d(7), desired_force_torque(6), tau_cmd(7), tau_ext(7);//

  // pseudoinverse for nullspace handling
  // kinematic pseuoinverse
  Eigen::MatrixXd jacobian_transpose_pinv;
  pseudoInverse(jacobian.transpose(), jacobian_transpose_pinv);

  // Cartesian PD control with damping ratio = 1
  tau_task << jacobian.transpose() *
                  (-cartesian_stiffness_ * error - cartesian_damping_ * (jacobian * dq));
  // nullspace PD control with damping ratio = 1
  tau_nullspace << (Eigen::MatrixXd::Identity(7, 7) -
                    jacobian.transpose() * jacobian_transpose_pinv) *
                       (nullspace_stiffness_ * (q_d_nullspace_ - q) -
                        (2.0 * sqrt(nullspace_stiffness_)) * dq);
//////////////////////

  desired_force_torque.setZero();
  desired_force_torque(2) = desired_mass_ * -9.81;
  tau_ext = tau_measured - gravity - tau_ext_initial_;
  tau_d << jacobian.transpose() * desired_force_torque;
  tau_error_ = tau_error_ + period.toSec() * (tau_d - tau_ext);
  // FF + PI control (PI gains are initially all 0)
  tau_cmd = tau_d + k_p_ * (tau_d - tau_ext) + k_i_ * tau_error_;
  tau_cmd << saturateTorqueRate(tau_cmd, tau_J_d);

  tau_d2 << tau_task + tau_nullspace + coriolis;
  tau_d2 << saturateTorqueRate(tau_d2, tau_J_d);

  joint_handles_[3].setCommand(tau_cmd(3));
  //joint_handles_[1].setCommand(tau_d2(1));
  for (size_t i = 0; i < 7; ++i) {
    if (i!=3){
      joint_handles_[i].setCommand(tau_d2(i));
    }
  }
  //////////////////////
  //joint_handles_[5].setCommand(tau_d2(5));
  //joint_handles_[1].setCommand(tau_d2(1));

  // update parameters changed online either through dynamic reconfigure or through the interactive
  // target by filtering
  cartesian_stiffness_ =
      filter_params_ * cartesian_stiffness_target_ + (1.0 - filter_params_) * cartesian_stiffness_;
  cartesian_damping_ =
      filter_params_ * cartesian_damping_target_ + (1.0 - filter_params_) * cartesian_damping_;
  nullspace_stiffness_ =
      filter_params_ * nullspace_stiffness_target_ + (1.0 - filter_params_) * nullspace_stiffness_;
  position_d_ = filter_params_ * position_d_target_ + (1.0 - filter_params_) * position_d_;
  orientation_d_ = orientation_d_.slerp(filter_params_, orientation_d_target_);

  /////////////////////////


  // Update signals changed online through dynamic reconfigure
  //if (hapticDevice && dataFromSensor>=eventForce){
  appliedMass = dataFromSensor;
  //appliedMass = desiredforce;
  // }else if (hapticDevice && dataFromSensor<eventForce){
  //   //
  //   appliedMass = eventForce + dataFromSensor;
  // }else{
  //   appliedMass = eventForce;
  // }
  //desired_mass_ = filter_gain_ * (target_mass_)  + (1 - filter_gain_) * desired_mass_;

  //!!!!  0.005 is instead of filter_gain_ be careful  !!!!!!!!!!
  desired_mass_ = 0.005 * (appliedMass)  + (1 - 0.005   ) * desired_mass_;
  k_p_ = filter_gain_ * target_k_p_ + (1 - filter_gain_) * k_p_;
  k_i_ = filter_gain_ * target_k_i_ + (1 - filter_gain_) * k_i_;

  //std::cout<<appliedMass<<"\n";
  //std::cout<<desired_mass_<<"\n";
  //std::cout<<abs(dataFromSensor/10.0)<<"\n";
  ros::spinOnce();

}

void ForceExampleController::chatterCallback(const geometry_msgs::WrenchStamped& msg)
{
  if (msg.wrench.force.z >= -8.00 && msg.wrench.force.z < -0.5){
      dataFromSensor = abs(msg.wrench.force.z)/10.0;
  }
  else if (msg.wrench.force.z < -8.00) {
    dataFromSensor = abs(8.0)/10.0;

  }else if (msg.wrench.force.z > 0.5 && msg.wrench.force.z <= 8.0 && contact == true){
    dataFromSensor = -abs(msg.wrench.force.z)/10.0;
  }else if (msg.wrench.force.z > 8.0 && contact == true){
    dataFromSensor = -abs(8.0)/10.0;
  }
  else{
    dataFromSensor = 0.0;
  }
}


void ForceExampleController::chatBack(const std_msgs::Float32& mas)
{
  if (mas.data > minimumThreshold && mas.data <= 8.0){
    eventForce = mas.data/8.0;
    contact = true;

  }else{
    eventForce = 0.0;
    contact = false;
    //contact = true;
  }
}

void ForceExampleController::velocityCallback(const sensor_msgs::JointState& msg){
  velocityD=round(msg.velocity[3]*100.0)/100;

  if (velocityD > 0){
    goingUp = true;
  }else{
    goingUp = false;
  }

  if (velocityD >=0.08){
      minimumThreshold = 2.5;
  }else if (velocityD<0.08){
    minimumThreshold = 0.0;
  }

}

void ForceExampleController::desire_callback(const my_message::linefollowData& msg){

  forceToApply = msg.y_desired;
  if (forceToApply >= -8.00 && forceToApply < 0.0){
      desiredforce = abs(forceToApply)/8.0 + 1.0 * (abs(forceToApply)/8.0 - eventForce);
  }
  else if (forceToApply > 0.5 && forceToApply <= 8.0 && contact == true){
    desiredforce = -(abs(7.0-forceToApply)/8.0 + 0.6 * (abs(7.0-forceToApply)/8.0 - eventForce));
  }
  else{
    desiredforce = 0.0;
  }
}


void ForceExampleController::complianceParamCallback(
    franka_example_controllers::compliance_paramConfig& config,
    uint32_t /*level*/) {
  cartesian_stiffness_target_.setIdentity();
  cartesian_stiffness_target_.topLeftCorner(3, 3)
      << config.translational_stiffness * Eigen::Matrix3d::Identity();
  cartesian_stiffness_target_.bottomRightCorner(3, 3)
      << config.rotational_stiffness * Eigen::Matrix3d::Identity();
  cartesian_damping_target_.setIdentity();
  // Damping ratio = 1
  cartesian_damping_target_.topLeftCorner(3, 3)
      << 2.0 * sqrt(config.translational_stiffness) * Eigen::Matrix3d::Identity();
  cartesian_damping_target_.bottomRightCorner(3, 3)
      << 2.0 * sqrt(config.rotational_stiffness) * Eigen::Matrix3d::Identity();
  nullspace_stiffness_target_ = config.nullspace_stiffness;
}



void ForceExampleController::equilibriumPoseCallback(
    const geometry_msgs::PoseStampedConstPtr& msg) {
  position_d_target_ << msg->pose.position.x, msg->pose.position.y, msg->pose.position.z;
  Eigen::Quaterniond last_orientation_d_target(orientation_d_target_);
  orientation_d_target_.coeffs() << msg->pose.orientation.x, msg->pose.orientation.y,
      msg->pose.orientation.z, msg->pose.orientation.w;
  if (last_orientation_d_target.coeffs().dot(orientation_d_target_.coeffs()) < 0.0) {
    orientation_d_target_.coeffs() << -orientation_d_target_.coeffs();
  }
}



void ForceExampleController::desiredMassParamCallback(
    franka_example_controllers::desired_mass_paramConfig& config,
    uint32_t /*level*/) {

  target_mass_ = config.desired_mass;
  target_k_p_ = config.k_p;
  target_k_i_ = config.k_i;
}

Eigen::Matrix<double, 7, 1> ForceExampleController::saturateTorqueRate(
    const Eigen::Matrix<double, 7, 1>& tau_d_calculated,
    const Eigen::Matrix<double, 7, 1>& tau_J_d) {  // NOLINT (readability-identifier-naming)
  Eigen::Matrix<double, 7, 1> tau_d_saturated{};
  for (size_t i = 0; i < 7; i++) {
    double difference = tau_d_calculated[i] - tau_J_d[i];
    tau_d_saturated[i] = tau_J_d[i] + std::max(std::min(difference, kDeltaTauMax), -kDeltaTauMax);
  }
  return tau_d_saturated;
}

}  // namespace franka_example_controllers

PLUGINLIB_EXPORT_CLASS(franka_custom_control::ForceExampleController,
                       controller_interface::ControllerBase)
