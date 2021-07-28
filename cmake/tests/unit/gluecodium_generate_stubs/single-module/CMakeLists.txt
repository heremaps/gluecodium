# Copyright (C) 2021 HERE Europe B.V.
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

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_stored_gluecodium_property.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

get_supported_gluecodium_generators(_gluecodium_generators)

if(NOT dart IN_LIST _gluecodium_generators)
  return()
endif()

add_library(single.module SHARED EXCLUDE_FROM_ALL "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
gluecodium_generate(single.module GENERATORS cpp dart)
gluecodium_target_lime_sources(single.module PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime"
                                                     "${CMAKE_CURRENT_LIST_DIR}/lime/bar.lime")

set_target_properties(single.module PROPERTIES GLUECODIUM_TAGS "Tag1;Tag2")

add_library(single.module.stubs INTERFACE EXCLUDE_FROM_ALL)
gluecodium_generate_stubs(single.module.stubs FOR_TARGET single.module OUTPUT_DIR
                          ${EXPLICIT_OUTPUT_DIR})

test_expect_true(
  CONDITION TARGET single.module.stubs.gluecodium.generate
  MESSAGE "gluecodium_generate_stubs must create target single.module.stubs.gluecodium.generate")

set(single_module_stubs_vars_file
    "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/single.module.stubs/cpp-dart/gluecodium-generate-configuration-single.module.stubs.cmake"
)

# Must be the same as original's target
check_stored_gluecodium_property(single.module.stubs.check.sets "${single_module_stubs_vars_file}"
                                 GLUECODIUM_SOURCE_SETS "MAIN\;COMMON")

# Known optional properties must be inherited
check_stored_gluecodium_property(single.module.stubs.check.tags "${single_module_stubs_vars_file}"
                                 GLUECODIUM_TAGS "Tag1\;Tag2")

# Options stubs must be ON to generate stubs
check_stored_gluecodium_property(single.module.stubs.check.stubs "${single_module_stubs_vars_file}"
                                 GLUECODIUM_STUBS "ON")

if(NOT EXPECTED_OUTPUT_DIR)
  set(EXPECTED_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/single.module.stubs/cpp-dart")
endif()

# Output dir must be its own and default for target
check_stored_gluecodium_property(
  single.module.stubs.check.output_dir "${single_module_stubs_vars_file}" GLUECODIUM_OUTPUT_DIR
  "${EXPECTED_OUTPUT_DIR}")
