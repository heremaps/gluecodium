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

if(CMAKE_GENERATOR STREQUAL "Xcode" AND NOT XCODE_VERSION VERSION_LESS 10.0)
  cmake_minimum_required(VERSION 3.12.1)
else()
  cmake_minimum_required(VERSION 3.10)
endif()

include_guard()

#.rst:
# apigen_swift_configuration
# --------------------------
#
# This module builds configures the Swift framework.
# Defines output and version library and it will added to the
# target to be use later on.
#
# .. command:: apigen_swift_configuration
#
# The general form of the command is::
#
#     apigen_swift_configuration(target)
#

function(apigen_swift_configuration target)

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_OUTPUT_DIR)
  get_target_property(OUTPUT_BUILD_DIR ${target} APIGEN_BUILD_OUTPUT_DIR)
  get_target_property(SDK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
  get_target_property(SDK_VERSION_SHORT ${target} APIGEN_SWIFT_FRAMEWORK_VERSION_SHORT)
  get_target_property(MINIMUM_OS_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION)
  get_target_property(SWIFT_FRAMEWORK_NAME ${target} APIGEN_SWIFT_FRAMEWORK_NAME)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_configuration() depends on apigen_generate() configured with generator 'swift'")
  endif()

  if(NOT SDK_VERSION)
    set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_VERSION 1.0)
  endif()

  if(NOT SDK_VERSION_SHORT)
    set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_VERSION_SHORT 1.0)
  endif()

  if(NOT MINIMUM_OS_VERSION)
    if(CMAKE_OSX_DEPLOYMENT_TARGET) # Variable from CMake default toolchain
      set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION ${CMAKE_OSX_DEPLOYMENT_TARGET})
    else()
      set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION 11.0)
    endif()
  endif()

  if(NOT DEFINED CMAKE_Swift_LANGUAGE_VERSION)
    message(STATUS "[Swift] Swift version not specified, will use 5.0")
    set(CMAKE_Swift_LANGUAGE_VERSION "5.0" CACHE STRING "Swift version to use for compilation.")
  endif()

  if(NOT CMAKE_GENERATOR STREQUAL "Xcode" OR NOT SWIFT_FRAMEWORK_NAME)
    set(SWIFT_FRAMEWORK_NAME ${target})
  endif()
  string(MAKE_C_IDENTIFIER "${SWIFT_FRAMEWORK_NAME}" SWIFT_MODULE_NAME)
  set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_NAME ${SWIFT_FRAMEWORK_NAME})
  set_target_properties(${target} PROPERTIES APIGEN_SWIFT_MODULE_NAME ${SWIFT_MODULE_NAME})

  # Gluecodium invocations for different generators need different output directories
  # as Gluecodium currently wipes the directory upon start.
  set(SWIFT_BUILD_OUTPUT_DIR ${OUTPUT_DIR}/build)

  message(STATUS "[Swift] Framework version ${FRAMEWORK_VERSION} will be generated in path ${SWIFT_BUILD_OUTPUT_DIR}")

endfunction()
