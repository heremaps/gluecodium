# Copyright (C) 2020 HERE Europe B.V.
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

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

if(CMAKE_GENERATOR STREQUAL "Xcode")
  enable_language(Swift)
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(gluecodium/Gluecodium)

get_supported_gluecodium_generators(_gluecodium_generator)

# Module 1, includes MAIN and COMMON source set
add_library(shared.module1 SHARED)
target_sources(shared.module1 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")
target_link_libraries(shared.module1 PRIVATE Threads::Threads)

gluecodium_generate(shared.module1 GENERATORS ${_gluecodium_generator})
gluecodium_target_lime_sources(shared.module1
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")
set_target_properties(
  shared.module1
  PROPERTIES GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME COMMON GLUECODIUM_CPP_EXPORT_MACRO_NAME
                                                            MODULE1)

# Module 2, includes only MAIN source set and depends on module 1
add_library(shared.module2 SHARED)
target_sources(shared.module2 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(shared.module2 PUBLIC shared.module1)

gluecodium_generate(shared.module2 GENERATORS ${_gluecodium_generator} MAIN_ONLY)
gluecodium_target_lime_sources(shared.module2
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
set_target_properties(shared.module2 PROPERTIES GLUECODIUM_CPP_EXPORT_MACRO_NAME MODULE2)
