cmake_minimum_required(VERSION 3.10)

project(gluecodium_gradle_init_script_test)

set(GLUECODIUM_DETAILS_DIR "${GLUECODIUM_CMAKE_DIR}/modules/gluecodium/gluecodium/details")
include("${GLUECODIUM_CMAKE_DIR}/modules/gluecodium/gluecodium/details/GetGradleInitScriptArguments.cmake")

set(_init_script "${CMAKE_CURRENT_BINARY_DIR}/path with spaces/init.gradle")
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/path with spaces")
file(WRITE "${_init_script}" "")

gluecodium_get_gradle_init_script_arguments(_arguments "${_init_script}")
list(LENGTH _arguments _argument_count)
if(NOT _argument_count EQUAL 2)
  message(FATAL_ERROR "Expected two Gradle init-script arguments, got ${_argument_count}")
endif()

list(GET _arguments 0 _option)
if(NOT _option STREQUAL "--init-script")
  message(FATAL_ERROR "Expected --init-script, got ${_option}")
endif()

list(GET _arguments 1 _argument_path)
if(NOT _argument_path STREQUAL "${_init_script}")
  message(FATAL_ERROR "Expected ${_init_script}, got ${_argument_path}")
endif()

unset(_arguments)
gluecodium_get_gradle_init_script_arguments(_arguments "")
if(_arguments)
  message(FATAL_ERROR "Expected no arguments when the init script is unset")
endif()
