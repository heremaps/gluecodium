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

if(DEFINED includeguard_ApigenJavaCompile)
  return()
endif()
set(includeguard_ApigenJavaCompile ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenJavaCompile
# -------------------
#
# This module compiles Java code into *.class files for a target for which
# apigen_generate($target ... android) was run.
#
# .. command:: apigen_java_compile
#
# The general form of the command is::
#
#   apigen_java_compile(TARGET target
#    LOCAL_DEPENDENCIES jar_name
#    LOCAL_DEPENDENCIES_DIRS dir_path
#    REMOTE_DEPENDENCIES package_name )
#
# LOCAL_DEPENDENCIES specifies name(s) of the local JAR file(s) to include as dependencies.
# LOCAL_DEPENDENCIES_DIRS specifies paths(s) of the local directories where to look for those JARs.
# REMOTE_DEPENDENCIES specifies name(s) of the Gradle packages to include as dependencies through
# the regular dependency resolution process (i.e. fetching them from the remote repository unless
# an up-to-date version is present in the local Gradle cache).
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_java_compile)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs LOCAL_DEPENDENCIES LOCAL_DEPENDENCIES_DIRS REMOTE_DEPENDENCIES)
  cmake_parse_arguments(apigen_java_compile
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${apigen_java_compile_TARGET} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${apigen_java_compile_TARGET} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)

  if(NOT ${GENERATOR} MATCHES "android")
    message(FATAL_ERROR "apigen_java_compile() depends on apigen_generate() configured with generator 'android'")
  endif()

  # Genium invocations for different generators need different output directories
  # as Genium currently wipes the directory upon start.
  set(APIGEN_JAVA_COMPILE_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-java-compile)
  set(APIGEN_GENIUM_JAVA_SOURCE_DIR ${OUTPUT_DIR}/android)

  # Attach properties to target for re-use in other modules
  set_target_properties(${apigen_java_compile_TARGET} PROPERTIES
    APIGEN_JAVA_COMPILE_OUTPUT_DIR ${APIGEN_JAVA_COMPILE_OUTPUT_DIR})

  foreach(local_dependencies ${apigen_java_compile_LOCAL_DEPENDENCIES})
    list(APPEND APIGEN_JAVA_LOCAL_DEPENDENCIES "${local_dependencies}")
  endforeach()
  foreach(local_dependencies_dirs ${apigen_java_compile_LOCAL_DEPENDENCIES_DIRS})
    list(APPEND APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS "${local_dependencies_dirs}")
  endforeach()
  foreach(remote_dependencies ${apigen_java_compile_REMOTE_DEPENDENCIES})
    list(APPEND APIGEN_JAVA_REMOTE_DEPENDENCIES "${remote_dependencies}")
  endforeach()

  add_custom_command(TARGET ${apigen_java_compile_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
    COMMAND ${APIGEN_GENIUM_GRADLE_WRAPPER}
      -b=compileJava.gradle
      -PsrcDir=${APIGEN_GENIUM_JAVA_SOURCE_DIR}
      -PoutputDir=${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
      -PlocalDependencies=${APIGEN_JAVA_LOCAL_DEPENDENCIES}
      -PlocalDependenciesDirs=${APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS}
      -PremoteDependencies=${APIGEN_JAVA_REMOTE_DEPENDENCIES}
      compileJava
    WORKING_DIRECTORY ${APIGEN_GENIUM_DIR}
    COMMENT "Compiling generated Java sources into class files...")
endfunction()
