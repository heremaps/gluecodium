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

list(APPEND _gluecodium_generator cpp)
if(ANDROID)
  list(APPEND _gluecodium_generator android)
  set(_expected_symbol_common "Java_com_example_unit_test_CommonMainFoo_make")
  set(_expected_symbol_main "Java_com_example_unit_test_MainBar_make")
elseif(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  list(APPEND _gluecodium_generator swift)
  set(_expected_symbol_common "unit_test_CommonMainFoo_make")
  set(_expected_symbol_main "unit_test_MainBar_make")
endif()

include(gluecodium/Gluecodium)

# Module 1, includes MAIN and COMMON source set
add_library(object.module.with.common OBJECT)
gluecodium_generate(object.module.with.common GENERATORS ${_gluecodium_generator})
gluecodium_target_lime_sources(object.module.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

add_library(shared.module.with.common SHARED)
target_link_libraries(shared.module.with.common PUBLIC object.module.with.common)
target_sources(
  shared.module.with.common PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp"
  PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")

# Module 2, includes only MAIN source set and depends on module 1
add_library(object.module.only.main OBJECT)
gluecodium_generate(object.module.only.main GENERATORS ${_gluecodium_generator} MAIN_ONLY)
gluecodium_target_lime_sources(object.module.only.main
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
target_link_libraries(object.module.only.main PUBLIC shared.module.with.common)

add_library(shared.module.only.main SHARED)
target_sources(shared.module.only.main PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(shared.module.only.main PRIVATE object.module.only.main)

if(_expected_symbol_common AND _expected_symbol_main)
  include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_symbols_after_build.cmake)
  check_symbols_after_build(shared.module.with.common EXPECT_EXIST "${_expected_symbol_common}")
  check_symbols_after_build(shared.module.only.main EXPECT_EXIST "${_expected_symbol_main}"
                            EXPECT_NOT_EXIST "${_expected_symbol_common}")
endif()
