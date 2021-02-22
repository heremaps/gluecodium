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

set(GLUECODIUM_DONT_REQUIRE_DART_INCLUDES ON)

list(APPEND _gluecodium_generator cpp dart)
if(ANDROID)
  list(APPEND _gluecodium_generator android)
elseif(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  list(APPEND _gluecodium_generator swift)
endif()

include(gluecodium/Gluecodium)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)

add_library(shared.module SHARED EXCLUDE_FROM_ALL )

set(GLUECODIUM_GENERATOR_FOLDER_DEFAULT "generated-sources")
gluecodium_generate(shared.module GENERATORS ${_gluecodium_generator})
gluecodium_target_lime_sources(shared.module PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

gluecodium_list_generated_files(
  shared.module
  OUTPUT_ALL _all_files
  OUTPUT_CPP _cpp_files
  OUTPUT_SWIFT _swift_files
  OUTPUT_BRIDGING_HEADERS _bridging_files)

set(_unity_dir "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/shared.module/generated-sources/unity")

if(APPLE)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.cpp"
             "${_unity_dir}/cbridge/shared.module_common_cglue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.h"
             "${_unity_dir}/cbridge/shared.module_common_cglue.h"
             "${_unity_dir}/swift/shared.module_main_glue.swift"
             "${_unity_dir}/swift/shared.module_common_glue.swift"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.cpp"
             "${_unity_dir}/cbridge/shared.module_common_cglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for cpp files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/swift/shared.module_main_glue.swift"
             "${_unity_dir}/swift/shared.module_common_glue.swift"
    ACTUAL ${_swift_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for swift files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cbridge/shared.module_main_cglue.h"
             "${_unity_dir}/cbridge/shared.module_common_cglue.h"
    ACTUAL ${_bridging_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for bridging files")
elseif(ANDROID)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/android/shared.module_main_jniglue.cpp"
             "${_unity_dir}/android/shared.module_common_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/android/shared.module_main_jniglue.cpp"
             "${_unity_dir}/android/shared.module_common_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When neither COMMON nor MAIN is specified"
            "then both source sets must be returned for cpp files")

  test_assert_false(
    CONDITION DEFINED _swift_files MESSAGE "When Swift code is not generated"
                                           "then variable with Swift files should be undefined")

  test_assert_false(
    CONDITION DEFINED _bridging_files
    MESSAGE "When Swift code is not generated"
            "then variable with bridging headers should be undefined")
endif()

gluecodium_list_generated_files(
  shared.module
  COMMON
  OUTPUT_ALL _all_files
  OUTPUT_CPP _cpp_files
  OUTPUT_SWIFT _swift_files
  OUTPUT_BRIDGING_HEADERS _bridging_files)

if(APPLE)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_common_cglue.cpp"
             "${_unity_dir}/cbridge/shared.module_common_cglue.h"
             "${_unity_dir}/swift/shared.module_common_glue.swift"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_common_cglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for cpp files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/swift/shared.module_common_glue.swift" ACTUAL ${_swift_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for swift files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cbridge/shared.module_common_cglue.h" ACTUAL ${_bridging_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for bridging files")
elseif(ANDROID)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/android/shared.module_common_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_common_glue.cpp"
             "${_unity_dir}/android/shared.module_common_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_common_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When COMMON source set is specified"
            "then files from only COMMON source set must be returned for cpp files")
endif()

gluecodium_list_generated_files(
  shared.module
  MAIN
  OUTPUT_ALL _all_files
  OUTPUT_CPP _cpp_files
  OUTPUT_SWIFT _swift_files
  OUTPUT_BRIDGING_HEADERS _bridging_files)

if(APPLE)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.h"
             "${_unity_dir}/swift/shared.module_main_glue.swift"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/cbridge/shared.module_main_cglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for cpp files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/swift/shared.module_main_glue.swift" ACTUAL ${_swift_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for swift files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cbridge/shared.module_main_cglue.h" ACTUAL ${_bridging_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for bridging files")
elseif(ANDROID)
  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/android/shared.module_main_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
    ACTUAL ${_all_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for all files")

  test_expect_strequal_lists(
    EXPECTED "${_unity_dir}/cpp/shared.module_main_glue.cpp"
             "${_unity_dir}/android/shared.module_main_jniglue.cpp"
             "${_unity_dir}/dart/shared.module_main_ffiglue.cpp"
    ACTUAL ${_cpp_files}
    MESSAGE "When MAIN source set is specified"
            "then files from only MAIN source set must be returned for cpp files")
endif()
