// Generated by gencpp from file franka_custom_control/linefollowData.msg
// DO NOT EDIT!


#ifndef FRANKA_CUSTOM_CONTROL_MESSAGE_LINEFOLLOWDATA_H
#define FRANKA_CUSTOM_CONTROL_MESSAGE_LINEFOLLOWDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace franka_custom_control
{
template <class ContainerAllocator>
struct linefollowData_
{
  typedef linefollowData_<ContainerAllocator> Type;

  linefollowData_()
    : mean_squared_error(0.0)
    , y_sensed(0.0)
    , y_desired(0.0)  {
    }
  linefollowData_(const ContainerAllocator& _alloc)
    : mean_squared_error(0.0)
    , y_sensed(0.0)
    , y_desired(0.0)  {
  (void)_alloc;
    }



   typedef float _mean_squared_error_type;
  _mean_squared_error_type mean_squared_error;

   typedef float _y_sensed_type;
  _y_sensed_type y_sensed;

   typedef float _y_desired_type;
  _y_desired_type y_desired;





  typedef boost::shared_ptr< ::franka_custom_control::linefollowData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_custom_control::linefollowData_<ContainerAllocator> const> ConstPtr;

}; // struct linefollowData_

typedef ::franka_custom_control::linefollowData_<std::allocator<void> > linefollowData;

typedef boost::shared_ptr< ::franka_custom_control::linefollowData > linefollowDataPtr;
typedef boost::shared_ptr< ::franka_custom_control::linefollowData const> linefollowDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_custom_control::linefollowData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_custom_control::linefollowData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::franka_custom_control::linefollowData_<ContainerAllocator1> & lhs, const ::franka_custom_control::linefollowData_<ContainerAllocator2> & rhs)
{
  return lhs.mean_squared_error == rhs.mean_squared_error &&
    lhs.y_sensed == rhs.y_sensed &&
    lhs.y_desired == rhs.y_desired;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::franka_custom_control::linefollowData_<ContainerAllocator1> & lhs, const ::franka_custom_control::linefollowData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace franka_custom_control

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::franka_custom_control::linefollowData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_custom_control::linefollowData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_custom_control::linefollowData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_custom_control::linefollowData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_custom_control::linefollowData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_custom_control::linefollowData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_custom_control::linefollowData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "56d6b7140d97f10c0e7ce09693345f49";
  }

  static const char* value(const ::franka_custom_control::linefollowData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x56d6b7140d97f10cULL;
  static const uint64_t static_value2 = 0x0e7ce09693345f49ULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_custom_control::linefollowData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_custom_control/linefollowData";
  }

  static const char* value(const ::franka_custom_control::linefollowData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_custom_control::linefollowData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 mean_squared_error\n"
"float32 y_sensed\n"
"float32 y_desired\n"
;
  }

  static const char* value(const ::franka_custom_control::linefollowData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_custom_control::linefollowData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mean_squared_error);
      stream.next(m.y_sensed);
      stream.next(m.y_desired);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct linefollowData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_custom_control::linefollowData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_custom_control::linefollowData_<ContainerAllocator>& v)
  {
    s << indent << "mean_squared_error: ";
    Printer<float>::stream(s, indent + "  ", v.mean_squared_error);
    s << indent << "y_sensed: ";
    Printer<float>::stream(s, indent + "  ", v.y_sensed);
    s << indent << "y_desired: ";
    Printer<float>::stream(s, indent + "  ", v.y_desired);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_CUSTOM_CONTROL_MESSAGE_LINEFOLLOWDATA_H
