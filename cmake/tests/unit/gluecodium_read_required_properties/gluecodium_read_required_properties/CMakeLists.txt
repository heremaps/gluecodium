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

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/unset_all.cmake)

add_library(cpp.main.common SHARED EXCLUDE_FROM_ALL )

gluecodium_generate(cpp.main.common GENERATORS cpp)

gluecodium_read_required_properties(
  cpp.main.common
  GENERATORS _generators
  SOURCE_SETS _source_sets
  OUTPUT_DIR _output_dir
  OUTPUT_MAIN_DIR _output_main_dir
  OUTPUT_COMMON_DIR _output_common_dir
  OUTPUT_BUILD_DIR _output_build_dir)

test_expect_strequal_lists(EXPECTED "cpp" ACTUAL ${_generators})
test_expect_strequal_lists(EXPECTED "MAIN" "COMMON" ACTUAL ${_source_sets})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main.common/cpp"
                     ACTUAL ${_output_dir})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main.common/cpp/main"
                     ACTUAL ${_output_main_dir})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main.common/cpp/common"
                     ACTUAL ${_output_common_dir})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main.common/cpp/build"
                     ACTUAL ${_output_build_dir})

unset_all(_generators _source_sets _output_dir _output_main_dir _output_common_dir
          _output_build_dir)
add_library(cpp.main SHARED EXCLUDE_FROM_ALL )
gluecodium_generate(cpp.main GENERATORS cpp MAIN_ONLY)
gluecodium_read_required_properties(
  cpp.main
  GENERATORS _generators
  SOURCE_SETS _source_sets
  OUTPUT_DIR _output_dir
  OUTPUT_MAIN_DIR _output_main_dir
  OUTPUT_COMMON_DIR _output_common_dir
  OUTPUT_BUILD_DIR _output_build_dir)

test_expect_strequal_lists(EXPECTED "cpp" ACTUAL ${_generators})
test_expect_strequal_lists(EXPECTED "MAIN" ACTUAL ${_source_sets})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main/cpp"
                     ACTUAL ${_output_dir})
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main/cpp/main"
                     ACTUAL ${_output_main_dir})
test_expect_false(CONDITION DEFINED _output_common_dir)
test_expect_strequal(EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.main/cpp/build"
                     ACTUAL ${_output_build_dir})

add_library(test::alias.to.cpp.main ALIAS cpp.main)
gluecodium_read_required_properties(
  test::alias.to.cpp.main
  GENERATORS _generators_alias
  SOURCE_SETS _source_sets_alias
  OUTPUT_DIR _output_dir_alias
  OUTPUT_MAIN_DIR _output_main_dir_alias
  OUTPUT_COMMON_DIR _output_common_dir_alias
  OUTPUT_BUILD_DIR _output_build_dir_alias)

test_expect_strequal(EXPECTED ${_generators} ACTUAL ${_generators_alias})
test_expect_strequal(EXPECTED ${_source_sets} ACTUAL ${_source_sets_alias})
test_expect_strequal(EXPECTED ${_output_dir} ACTUAL ${_output_dir_alias})
test_expect_strequal(EXPECTED ${_output_main_dir} ACTUAL ${_output_main_dir_alias})
test_expect_strequal(EXPECTED ${_output_common_dir} ACTUAL ${_output_common_dir_alias})
test_expect_strequal(EXPECTED ${_output_build_dir} ACTUAL ${_output_build_dir_alias})

unset_all(_generators _source_sets _output_dir _output_main_dir _output_common_dir
          _output_build_dir)
add_library(cpp.android.main.common SHARED EXCLUDE_FROM_ALL )
gluecodium_generate(cpp.android.main.common GENERATORS cpp android)
gluecodium_read_required_properties(
  cpp.android.main.common
  GENERATORS _generators
  SOURCE_SETS _source_sets
  OUTPUT_DIR _output_dir
  OUTPUT_MAIN_DIR _output_main_dir
  OUTPUT_COMMON_DIR _output_common_dir
  OUTPUT_BUILD_DIR _output_build_dir)

test_expect_strequal_lists(EXPECTED "android" "cpp" ACTUAL ${_generators})
test_expect_strequal_lists(EXPECTED "MAIN" "COMMON" ACTUAL ${_source_sets})
test_expect_strequal(
  EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.android.main.common/android-cpp"
  ACTUAL ${_output_dir})
test_expect_strequal(
  EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.android.main.common/android-cpp/main"
  ACTUAL ${_output_main_dir})
test_expect_strequal(
  EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.android.main.common/android-cpp/common"
  ACTUAL ${_output_common_dir})
test_expect_strequal(
  EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/cpp.android.main.common/android-cpp/build"
  ACTUAL ${_output_build_dir})
