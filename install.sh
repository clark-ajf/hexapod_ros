sudo adduser ros
sudo usermod -aG sudo ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt upgrade

sudo apt install -y ros-melodic-desktop

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
mkdir -p ~/ros_catkin_ws/src
cd ~/ros_catkin_ws

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
catkin_make 

cd ~/ros_catkin_ws/src
git -b melodic-dev clone https://github.com/CreedyNZ/hexapod_ros


echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source devel/setup.bash

rosdep install --from-paths src --ignore-src --rosdistro melodic -y -r --os=ubuntu:bionic


#end install more packages
