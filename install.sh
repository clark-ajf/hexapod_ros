sudo adduser rosmaster
sudo usermod -aG sudo rosmaster
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt update
sudo apt upgrade

sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake
sudo apt-get install git  &&
sudo apt-get install -y ros-melodic-sound-play &&
sudo apt-get install -y ros-melodic-diagnostic-updater &&
sudo apt-get install -y ros-melodic-xacro && 
sudo apt-get install -y ros-melodic-openni2-launch &&
sudo apt-get install -y ros-melodic-depthimage-to-laserscan &&
sudo apt-get install -y ros-melodic-joystick-drivers &&
sudo apt-get install -y ros-melodic-imu-filter-madgwick &&
sudo apt-get install -y ros-melodic-robot-localization &&
sudo apt-get install -y ros-melodic-rtabmap &&
sudo apt-get install -y ros-melodic-rtabmap-ros &&
sudo apt-get install -y ros-melodic-robot-state-publisher &&
sudo apt-get install -y ros-melodic-gazebo-ros-control &&
sudo apt-get install -y ros-melodic-navigation &&
sudo apt-get install -y ros-melodic-navfn &&
sudo apt-get install -y ros-melodic-amcl &&
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install ros-indigo-move_base

sudo rosdep init
rosdep update

mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws

rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-wet.rosinstall
wstool init src kinetic-ros_comm-wet.rosinstall

cd ~/ros_catkin_ws
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:buster


sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic



echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc


# to install more packages

cd ~/ros_catkin_ws
rosinstall_generator 'package name' --rosdistro kinetic --deps --wet-only --tar > kinetic-custom_ros.rosinstall

wstool merge -t src kinetic-custom_ros.rosinstall
wstool update -t src

rosdep install --from-paths src --ignore-src --rosdistro kinetic -y -r --os=ubuntu:bionic

sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic

#end install more packages


rosinstall_generator tf2 tf move_base xacro --rosdistro kinetic --deps --wet-only --tar > kinetic-custom_ros.rosinstall
