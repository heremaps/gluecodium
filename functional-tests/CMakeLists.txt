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

if(IOS)
    cmake_minimum_required(VERSION 3.15)
else()
    cmake_minimum_required(VERSION 3.6)
endif()
project(functional_tests)

if (NOT dart IN_LIST GLUECODIUM_GENERATORS_DEFAULT)
    include (CTest)
else()
    enable_testing()
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../cmake/modules/")
set (GLUECODIUM_USE_OBSOLETE_API ON)

# Allow testing with different C++ standard versions
if(NOT DEFINED TEST_CPP_VERSION)
  set(TEST_CPP_VERSION 11)
endif()
set(CMAKE_CXX_STANDARD ${TEST_CPP_VERSION})

set(GLUECODIUM_GENERATORS_DEFAULT "cpp;android;swift" CACHE STRING "Gluecodium generator(s) to use [defaults to: cpp;android;swift]")

# Ensure that symbols are properly exported.
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_C_VISIBILITY_PRESET hidden)

add_subdirectory(functional)
