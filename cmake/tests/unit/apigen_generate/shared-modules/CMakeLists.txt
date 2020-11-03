# Copyright (C) 2016-2020 HERE Europe B.V.
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

cmake_minimum_required (VERSION 3.12)

project(gluecodium.test)

set (CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

if (ANDROID)
    set (_gluecodium_generator android)
elseif (APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
    set (_gluecodium_generator swift)
else ()
    set (_gluecodium_generator cpp)
endif ()

include(gluecodium/Gluecodium)

# Module 1, includes MAIN and COMMON source set
add_library(shared.module1 SHARED)
target_sources(shared.module1 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp"
    PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")
apigen_generate(
    TARGET shared.module1
    LIME_SOURCES "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime"
    GENERATOR ${_gluecodium_generator}
    CPP_INTERNAL_NAMESPACE test
    COMMON_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/shared.module1/build_common")
apigen_target_include_directories (shared.module1 MAIN COMMON)
apigen_target_sources (shared.module1 MAIN COMMON)

# Module 2, includes only MAIN source set and depends on module 1
add_library(shared.module2 SHARED)
target_sources(shared.module2 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/BarImpl.cpp"
    PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/bar.lime")
target_link_libraries(shared.module2 PUBLIC shared.module1)

apigen_generate(
    TARGET shared.module2
    LIME_SOURCES "${CMAKE_CURRENT_LIST_DIR}/lime/bar.lime"
    GENERATOR ${_gluecodium_generator}
    CPP_INTERNAL_NAMESPACE test
    COMMON_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/shared.module2/build_common")
apigen_target_include_directories (shared.module2 MAIN)
apigen_target_sources (shared.module2 MAIN)
