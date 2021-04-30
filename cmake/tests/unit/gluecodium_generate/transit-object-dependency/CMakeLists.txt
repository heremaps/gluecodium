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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)

list(APPEND _gluecodium_generator cpp)

if(ANDROID)
  list(APPEND _gluecodium_generator android)
  set(_expected_symbol "Java_com_example_unit_test_Foo_make")
elseif(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  list(APPEND _gluecodium_generator swift)
  set(_expected_symbol "unit_test_Foo_make")
endif()

# Target with generated sources
add_library(generated.module OBJECT "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
gluecodium_generate(generated.module GENERATORS ${_gluecodium_generator})
gluecodium_target_lime_sources(generated.module PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

# Intermediate target
add_library(intermediate.module ${INTERMEDIATE_LIBRARY_TYPE}
                                "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.cpp")
target_sources(intermediate.module INTERFACE $<TARGET_OBJECTS:generated.module>)

# Final target
add_library(shared.module SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.cpp")
target_link_libraries(shared.module PRIVATE intermediate.module)

if(_expected_symbol)
  include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_symbols_after_build.cmake)
  check_symbols_after_build(shared.module EXPECT_EXIST "${_expected_symbol}")
endif()
