# Copyright (C) 2016-2019 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

if(DEFINED includeguard_gluecodium_java_Jar)
  return()
endif()
set(includeguard_gluecodium_java_Jar ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Java jar module
# ---------------
#
# This module assembles *.class files into a *.jar file for a target for which
# apigen_java_compile($target) was run.
#
# .. command:: apigen_java_jar
#
# The general form of the command is::
#
#     apigen_java_jar(target)
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_java_jar target)
  set(options "")
  set(oneValueArgs OUTPUT_DIR)
  set(multiValueArgs "")
  cmake_parse_arguments(apigen_java_jar "${options}" "${oneValueArgs}"
                      "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(APIGEN_JAVA_OUTPUT_DIR ${target} APIGEN_JAVA_COMPILE_OUTPUT_DIR)

  if(NOT ${GENERATOR} MATCHES "android")
    message(FATAL_ERROR "apigen_java_jar() depends on apigen_generate() configured with generator 'android'")
  endif()

  # Gluecodium invocations for different generators need different output directories
  # as Gluecodium currently wipes the directory upon start.
  if(NOT apigen_java_jar_OUTPUT_DIR)
    set(apigen_java_jar_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-java-jar)
  endif()
  set(APIGEN_JAVA_JAR_OUTPUT_DIR ${apigen_java_jar_OUTPUT_DIR})
  set(APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR_OUTPUT_DIR}/${target}.jar)

  # Attach properties to target for re-use in other modules
  set_target_properties(${target} PROPERTIES
    APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR}
    APIGEN_JAVA_JAR_OUTPUT_DIR ${APIGEN_JAVA_JAR_OUTPUT_DIR})

  add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_JAVA_JAR_OUTPUT_DIR}
    COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_JAVA_JAR} -C ${APIGEN_JAVA_OUTPUT_DIR} .
    COMMENT "Creating Java JAR from class files...")
  # TODO: Installs unconditionally, allow to configure the module:
  #install(FILES ${APIGEN_JAVA_JAR}
  #  DESTINATION lib)

endfunction()
