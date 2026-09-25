cmake_minimum_required(VERSION 3.10)

project(gluecodium_gradle_init_script_relative_test)

set(GLUECODIUM_DETAILS_DIR "${GLUECODIUM_CMAKE_DIR}/modules/gluecodium/gluecodium/details")
include("${GLUECODIUM_CMAKE_DIR}/modules/gluecodium/gluecodium/details/GetGradleInitScriptArguments.cmake")
gluecodium_get_gradle_init_script_arguments(_arguments "relative.gradle")
