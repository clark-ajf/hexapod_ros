cmake_minimum_required(VERSION 2.8.3)
project(hexapod_moves)

find_package( catkin REQUIRED COMPONENTS nodelet roscpp sensor_msgs hexapod_msgs )

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES hexapod_moves 
  CATKIN_DEPENDS nodelet roscpp sensor_msgs hexapod_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable( hexapod_moves src/hexapod_moves.cpp ) 
target_link_libraries( hexapod_moves ${catkin_LIBRARIES} )
add_dependencies( hexapod_moves hexapod_msgs_generate_messages_cpp )

install(TARGETS hexapod_moves
   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
   FILES_MATCHING PATTERN "*.hpp" PATTERN "*.h"
)

install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)

install(FILES hexapod_moves.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
  
 
