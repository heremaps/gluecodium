# Copyright (c) 2016-2018 HERE Europe B.V.
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

if(DEFINED includeguard_apigen_Android)
  return()
endif()
set(includeguard_apigen_Android ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# The Android Apigen module
# -------------------------
#
# Includes modules needed for Android builds.

# Java modules
include(${CMAKE_CURRENT_LIST_DIR}/ApigenJavaCompile.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenJavaJar.cmake)

# Android modules
include(${CMAKE_CURRENT_LIST_DIR}/ApigenAndroidArchive.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/DokkaApiDocumentation.cmake)
