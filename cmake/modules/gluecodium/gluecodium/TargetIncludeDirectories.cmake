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
#     apigen_target_include_directories(target [MAIN] [COMMON])
#        <target>    Target for which source was generated via `apigen_generate`
#        MAIN        Add the include path to the MAIN generated source set, i.e.
#                    code generated for the input Lime IDL files.
#        COMMON      Add the include path to the common generated source set.
#     If neither MAIN nor COMMON are specified, both are added. Specifying a
#     source set requires a separate common output directory to be set for
#     `apigen_generate`.
#

function(apigen_target_include_directories target)
  set(options MAIN COMMON)
  cmake_parse_arguments(APIGEN_TARGET_INCLUDE_DIRECTORIES "${options}" "" "" ${ARGN})
  if(NOT APIGEN_TARGET_INCLUDE_DIRECTORIES_MAIN AND NOT APIGEN_TARGET_INCLUDE_DIRECTORIES_COMMON)
    set(APIGEN_TARGET_INCLUDE_DIRECTORIES_MAIN TRUE)
    set(APIGEN_TARGET_INCLUDE_DIRECTORIES_COMMON TRUE)
  endif()

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)

  if(APIGEN_TARGET_INCLUDE_DIRECTORIES_MAIN)
    get_target_property(OUTPUT_DIR ${target} APIGEN_OUTPUT_DIR)
    target_include_directories(${target}
      PUBLIC
        $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>
        $<BUILD_INTERFACE:${OUTPUT_DIR}>)

    if(${GENERATOR} MATCHES android)
      target_include_directories(${target}
        PUBLIC $<BUILD_INTERFACE:${OUTPUT_DIR}/android/jni>)
    elseif(GENERATOR MATCHES dart)
      target_include_directories(${target}
        PUBLIC $<BUILD_INTERFACE:${OUTPUT_DIR}/dart/ffi>)
    endif()
  endif()

  if(APIGEN_TARGET_INCLUDE_DIRECTORIES_COMMON)
    get_target_property(COMMON_OUTPUT_DIR ${target} APIGEN_COMMON_OUTPUT_DIR)
    target_include_directories(${target}
      PUBLIC
        $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}/cpp/include>
        $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}>)
    if(${GENERATOR} MATCHES android)
      target_include_directories(${target}
        PUBLIC $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}/android/jni>)
    endif()
    if(${GENERATOR} MATCHES dart)
      target_include_directories(${target}
        PUBLIC $<BUILD_INTERFACE:${COMMON_OUTPUT_DIR}/dart/ffi>)
    endif()
  endif()

  if(${GENERATOR} MATCHES android)
    # If we're not crosscompiling, we need to manually add JNI includes.
    if(NOT CMAKE_CROSSCOMPILING)
      find_package(JNI REQUIRED)
      target_include_directories(${target}
        PRIVATE $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
    endif()
  endif()
endfunction()
