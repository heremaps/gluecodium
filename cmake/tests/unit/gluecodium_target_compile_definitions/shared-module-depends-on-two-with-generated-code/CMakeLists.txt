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

if(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  enable_language(Swift)
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

set(GLUECODIUM_GENERATORS_DEFAULT cpp)

include(gluecodium/Gluecodium)
include(gluecodium/Packaging)

if(NOT TEST_COMMON_MODULE_TYPE)
  set(TEST_COMMON_MODULE_TYPE OBJECT)
endif()

if(NOT TEST_MAIN_MODULE_TYPE)
  set(TEST_MAIN_MODULE_TYPE OBJECT)
endif()

# Module 1, includes MAIN and COMMON source set
add_library(module.with.common ${TEST_COMMON_MODULE_TYPE})

gluecodium_generate(module.with.common)
gluecodium_target_lime_sources(module.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")
set_target_properties(
  module.with.common
  PROPERTIES GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME CUSTOM_COMMON GLUECODIUM_CPP_EXPORT_MACRO_NAME
                                                                   MODULE1_MAIN)

# Module 2, includes only MAIN source set and depends on module 1
add_library(module.main.only ${TEST_MAIN_MODULE_TYPE})
target_link_libraries(module.main.only PUBLIC module.with.common)

gluecodium_generate(module.main.only MAIN_ONLY)
gluecodium_target_lime_sources(module.main.only
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
set_target_properties(module.main.only PROPERTIES GLUECODIUM_CPP_EXPORT_MACRO_NAME MODULE2_MAIN)

#
add_library(shared.module SHARED)
target_link_libraries(shared.module PRIVATE module.with.common module.main.only)
target_sources(shared.module PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp"
                                     "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")

gluecodium_get_target_compile_definitions(module.with.common RESULT_PUBLIC _public_common
                                          RESULT_PRIVATE _private_common)
target_compile_definitions(shared.module PUBLIC ${_public_common} PRIVATE ${_private_common})

gluecodium_get_target_compile_definitions(module.main.only RESULT_PUBLIC _public_main
                                          RESULT_PRIVATE _private_main)
target_compile_definitions(shared.module PUBLIC ${_public_main} PRIVATE ${_private_main})
