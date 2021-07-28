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

if(CMAKE_GENERATOR STREQUAL "Xcode")
  enable_language(Swift)
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_stored_gluecodium_property.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

get_supported_gluecodium_generators(_gluecodium_generators)

if(NOT dart IN_LIST _gluecodium_generators)
  return()
endif()

if(APPLE AND GLUECODIUM_DONT_USE_FILTER_GENERATOR_EXPRESSION)
  # Xcode is supported only with latest cmake where generator expression $<FILTER:...> already
  # exists.
  return()
endif()

# Module 1, includes MAIN and COMMON source set
add_library(shared.module.with.common SHARED)
target_sources(
  shared.module.with.common PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp"
  PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")

gluecodium_generate(shared.module.with.common GENERATORS cpp dart)
gluecodium_target_lime_sources(shared.module.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

# Module 2, includes only MAIN source set and depends on module 1
add_library(shared.module.only.main SHARED)
target_sources(shared.module.only.main PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(shared.module.only.main PRIVATE shared.module.with.common)
gluecodium_target_lime_sources(shared.module.only.main
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")

gluecodium_generate(shared.module.only.main GENERATORS cpp dart MAIN_ONLY)

# Stubs
add_library(shared.module.with.common.stubs INTERFACE)
gluecodium_generate_stubs(shared.module.with.common.stubs FOR_TARGET shared.module.with.common)

add_library(shared.module.only.main.stubs INTERFACE)
gluecodium_generate_stubs(shared.module.only.main.stubs FOR_TARGET shared.module.only.main)

add_custom_target(build.all.stubs ALL DEPENDS shared.module.with.common.stubs
                                              shared.module.only.main.stubs.gluecodium.generate)

set(shared_module_only_main_stubs_vars_file
    "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/shared.module.only.main.stubs/cpp-dart/gluecodium-generate-configuration-shared.module.only.main.stubs.cmake"
)
check_stored_gluecodium_property(
  shared.module.only.main.stubs.check.sets "${shared_module_only_main_stubs_vars_file}"
  GLUECODIUM_SOURCE_SETS "MAIN")
