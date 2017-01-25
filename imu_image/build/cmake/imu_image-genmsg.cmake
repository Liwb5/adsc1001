# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "imu_image: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iimu_image:/home/hmx/ws_catkin/src/imu_image/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(imu_image_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" NAME_WE)
add_custom_target(_imu_image_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "imu_image" "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(imu_image
  "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_image
)

### Generating Services

### Generating Module File
_generate_module_cpp(imu_image
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_image
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(imu_image_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(imu_image_generate_messages imu_image_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" NAME_WE)
add_dependencies(imu_image_generate_messages_cpp _imu_image_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_image_gencpp)
add_dependencies(imu_image_gencpp imu_image_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_image_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(imu_image
  "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_image
)

### Generating Services

### Generating Module File
_generate_module_eus(imu_image
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_image
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(imu_image_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(imu_image_generate_messages imu_image_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" NAME_WE)
add_dependencies(imu_image_generate_messages_eus _imu_image_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_image_geneus)
add_dependencies(imu_image_geneus imu_image_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_image_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(imu_image
  "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_image
)

### Generating Services

### Generating Module File
_generate_module_lisp(imu_image
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_image
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(imu_image_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(imu_image_generate_messages imu_image_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" NAME_WE)
add_dependencies(imu_image_generate_messages_lisp _imu_image_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_image_genlisp)
add_dependencies(imu_image_genlisp imu_image_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_image_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(imu_image
  "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_image
)

### Generating Services

### Generating Module File
_generate_module_py(imu_image
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_image
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(imu_image_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(imu_image_generate_messages imu_image_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hmx/ws_catkin/src/imu_image/msg/imuData.msg" NAME_WE)
add_dependencies(imu_image_generate_messages_py _imu_image_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(imu_image_genpy)
add_dependencies(imu_image_genpy imu_image_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS imu_image_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_image)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/imu_image
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(imu_image_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_image)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/imu_image
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(imu_image_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_image)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/imu_image
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(imu_image_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_image)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_image\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/imu_image
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(imu_image_generate_messages_py std_msgs_generate_messages_py)
