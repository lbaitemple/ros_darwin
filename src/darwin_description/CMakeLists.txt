cmake_minimum_required(VERSION 2.8.3)
project(darwin_description)

find_package(catkin REQUIRED)

catkin_package()

find_package(roslaunch)

install(DIRECTORY meshes urdf
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir}
)
