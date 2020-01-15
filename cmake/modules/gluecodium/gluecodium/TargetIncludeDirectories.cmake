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

if(DEFINED includeguard_gluecodium_TargetIncludeDirectories)
  return()
endif()
set(includeguard_gluecodium_TargetIncludeDirectories ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Generated target_include_directories module
# -------------------------------------------
#
# This module attaches additional include directories to the provided target.
# These might differ depending on the previously used generator (cpp, android,
# swift, etc.). This module depends on apigen_generate() to have been run on
# the target first.
#
# .. command:: apigen_target_include_directories
#
# The general form of the command is::
#
#     apigen_target_include_directories(target [ALWAYS_EXPOSE_CPP])
#
# The ALWAYS_EXPOSE_CPP argument may be used to expose the C++ headers in all situations. This can
# be useful when multiple Gluecodium-generated libraries depend on each-other.
#

function(apigen_target_include_directories target)

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_OUTPUT_DIR)
  get_target_property(COMMON_OUTPUT_DIR ${target} APIGEN_COMMON_OUTPUT_DIR)

  # Everyone needs C++ includes
  target_include_directories(${target}
    PUBLIC
      $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>
      $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}/cpp/include>)

  if(GENERATOR MATCHES android)
    # Android library targets need the cpp and JNI headers to compile
    target_include_directories(${target}
      PUBLIC
        $<BUILD_INTERFACE:${OUTPUT_DIR}/android/jni>
        $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}/android/jni>)

    # Check if we are doing a host build (no cross compilation)
    if(NOT(${CMAKE_SYSTEM_NAME} STREQUAL "Android"))
      find_package(JNI REQUIRED)
      target_include_directories(${target}
        PRIVATE $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
    endif()

  elseif(GENERATOR MATCHES swift)
    # Swift targets need the cpp and c_bridge headers to compile
    target_include_directories(${target}
      PUBLIC
        $<BUILD_INTERFACE:${OUTPUT_DIR}>
        $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}>)

  elseif(GENERATOR MATCHES dart)
    # Dart library targets need C++ and FFI headers to compile
    target_include_directories(${target}
      PUBLIC $<BUILD_INTERFACE:${OUTPUT_DIR}/dart/ffi>)

  endif()

endfunction()
