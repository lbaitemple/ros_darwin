# ros_darwin
## Installation and setup
```
mkdir -p ~/robot_ws/src
cd ~/robot_ws/src
git clone https://github.com/lbaitemple/ros_darwin
mv ros_darwin/setup.sh ../
cd ../
chmod 755 setup.sh
bash ./setup.sh
```

## To launch the darwin robot inside a small house
```
source install/setup.bash
roslaunch darwin_gazebo darwin_gazebo.launch
```
## To see in the image viewer,
open a new terminal and
Source the terminal
```
source install/setup.bash
rqt_image_view
```

## To move the robot
open a new terminal and
Source the terminal

### To move the head left
```
rostopic pub /darwin/j_pan_position_controller/command std_msgs/Float64 -- 1
```
### To move the head right
```
rostopic pub /darwin/j_pan_position_controller/command std_msgs/Float64 -- -1
```
### To reposition the head
```
rostopic pub /darwin/j_pan_position_controller/command std_msgs/Float64 -- -0
```

### To move the robot forward
```
rostopic pub /darwin/cmd_vel geometry_msgs/Twist '[1,0,0]' '[0,0,0]'
```
### To stop the robot from  moving forward
```
rostopic pub /darwin/cmd_vel geometry_msgs/Twist '[0,0,0]' '[0,0,0]'
```

For More [details](https://www.generationrobots.com/en/content/83-carry-out-simulations-and-make-your-darwin-op-walk-with-gazebo-and-ros)


