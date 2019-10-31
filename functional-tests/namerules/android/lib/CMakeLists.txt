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

cmake_minimum_required(VERSION 3.6)

project(namerules)

set(CPP_SOURCES
    ../../cpp/NameRulesImpl.cpp
)

add_library(namerules ${CPP_SOURCES})
set_target_properties(namerules PROPERTIES
    POSITION_INDEPENDENT_CODE ON)

# Android library targets need the cpp and JNI headers to compile
# but should not expose those to the public.
target_include_directories(namerules
  PRIVATE $<BUILD_INTERFACE:${GLUECODIUM_GENERATED_DIR}/cpp/include>
  PRIVATE $<BUILD_INTERFACE:${GLUECODIUM_GENERATED_DIR}>) # JNI headers and sources

# Check if we are doing a host build (no cross compilation)
if(NOT(${CMAKE_SYSTEM_NAME} STREQUAL "Android"))
  find_package(JNI REQUIRED)
  target_include_directories(namerules
    PRIVATE $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
endif()

file(GLOB_RECURSE GENERATED_CPP_SOURCES ${GLUECODIUM_GENERATED_DIR}/cpp/*.cpp)
file(GLOB_RECURSE GENERATED_CPP_HEADERS ${GLUECODIUM_GENERATED_DIR}/cpp/*.h)
file(GLOB_RECURSE JNI_SOURCES ${GLUECODIUM_GENERATED_DIR}/android/jni/*.cpp)
target_sources(namerules PRIVATE
  ${GENERATED_CPP_SOURCES}
  ${GENERATED_CPP_HEADERS}
  ${JNI_SOURCES})
