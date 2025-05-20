# Copyright (C) 2025 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)
set(CMAKE_CXX_STANDARD 17)

# Disable the test on MacOS. Ensure that is passes by printing the expected failure reason.
if(NOT ANDROID)
  message(FATAL_ERROR "'android' generator not enabled even though its JNI sources are "
                      "enforced via 'GLUECODIUM_FORCE_USAGE_OF_JNI_FROM_JAVA_GENERATOR'")
  return()
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")
include(gluecodium/Gluecodium)

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

set_property(TARGET dummySharedLibrary APPEND PROPERTY GLUECODIUM_FORCE_USAGE_OF_JNI_FROM_JAVA_GENERATOR "ON")

gluecodium_generate(dummySharedLibrary GENERATORS cpp android-kotlin)
gluecodium_target_lime_sources(dummySharedLibrary
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")