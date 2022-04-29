#!/bin/bash

# install colon
if ! command -v colcon &> /dev/null
then
      sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
      sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
      sudo apt update
      sudo apt install python3-colcon-common-extensions -y
    exit
fi

# Make sure packages are up to date

# Install dependencies
sudo apt-get update

var="$(lsb_release -sr)"
if [ $var = "18.04" ]; then
    sudo apt-get install git ros-melodic-desktop-full ros-melodic-gazebo-plugins ros-melodic-gazebo-ros ros-melodic-gazebo-ros-control ros-melodic-hector-gazebo ros-melodic-hector-gazebo-plugins ros-melodic-effort-controllers ros-melodic-joint-state-controller ros-melodic-joint-state-publisher ros-melodic-turtlebot3-teleop
    
fi

if [ $var = "20.04" ]; then
    sudo apt-get install git ros-noetic-desktop-full ros-noetic-gazebo-plugins ros-noetic-gazebo-ros ros-noetic-gazebo-ros-control ros-noetic-hector-gazebo ros-noetic-hector-gazebo-plugins ros-noetic-effort-controllers ros-noetic-joint-state-controller ros-noetic-joint-state-publisher ros-noetic-turtlebot3-teleop
    
fi

# update cmake   

currentver=$(cmake --version | head -1 | cut -d' ' -f3)
echo $currentver
# need to makesure cmake is greater than version 3.13
requiredver="3.13.0"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then 
        echo "Greater than or equal to ${requiredver}"
else
   sudo apt update && \
   sudo apt install -y software-properties-common lsb-release && \
   sudo apt clean all
   wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
   sudo apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
   sudo apt update
   sudo apt install kitware-archive-keyring
   sudo rm /etc/apt/trusted.gpg.d/kitware.gpg
   sudo apt update
   sudo apt install cmake -y
fi

cd src

if [ $var = "18.04" ]; then
    source /opt/ros/melodic/setup.bash
fi

if [ $var = "20.04" ]; then
    source /opt/ros/noetic/setup.bash
fi

catkin_init_workspace

git clone git clone https://github.com/ros/xacro.git
git clone https://github.com/aws-robotics/aws-robomaker-small-house-world.git

cd ..


