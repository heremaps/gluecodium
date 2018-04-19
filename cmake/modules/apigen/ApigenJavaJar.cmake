# Copyright (C) 2016-2018 HERE Europe B.V.
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

if(DEFINED includeguard_ApigenJavaJar)
  return()
endif()
set(includeguard_ApigenJavaJar ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenJavaJar
# -------------------
#
# This module assembles *.class files into a *.jar file for a target for which
# apigen_java_compile($target) was run.
#
# .. command:: apigen_java_jar
#
# The general form of the command is::
#
#   apigen_java_jar(target)
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_java_jar target)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(APIGEN_JAVA_OUTPUT_DIR ${target} APIGEN_JAVA_COMPILE_OUTPUT_DIR)

  if(NOT ${GENERATOR} MATCHES "android")
    message(FATAL_ERROR "apigen_java_jar() depends on apigen_generate() configured with generator 'android'")
  endif()

  # Genium invocations for different generators need different output directories
  # as Genium currently wipes the directory upon start.
  set(APIGEN_JAVA_JAR_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-java-jar)
  set(APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR_OUTPUT_DIR}/${target}.jar)

  # Attach properties to target for re-use in other modules
  set_target_properties(${target} PROPERTIES
    APIGEN_JAVA_JAR ${APIGEN_JAVA_JAR})

  add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_JAVA_JAR_OUTPUT_DIR}
    COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_JAVA_JAR} -C ${APIGEN_JAVA_OUTPUT_DIR} .
    COMMENT "Creating Java JAR from class files...")
  # TODO: Installs unconditionally, allow to configure the module:
  #install(FILES ${APIGEN_JAVA_JAR}
  #  DESTINATION lib)

endfunction()
