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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)

add_library(single.module.package SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

if (ANDROID)
    set (_gluecodium_generator android)
elseif (APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
    set (_gluecodium_generator swift)
else ()
    set (_gluecodium_generator cpp)
endif ()

apigen_generate(
    TARGET single.module.package
    LIME_SOURCES "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime"
    GENERATOR ${_gluecodium_generator}
    CPP_INTERNAL_NAMESPACE test)

apigen_target_include_directories (single.module.package)
apigen_target_sources (single.module.package)

get_target_property(_actual_generator single.module.package APIGEN_GENERATOR)
test_expect_strequal(
    EXPECTED ${_gluecodium_generator}
    ACTUAL ${_actual_generator}
    MESSAGE "apigen_generate must set APIGEN_GENERATOR property")

get_target_property(_output_dir single.module.package APIGEN_OUTPUT_DIR)
test_expect_strequal(
    EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/single.module.package/${_gluecodium_generator}"
    ACTUAL ${_output_dir}
    MESSAGE "apigen_generate must set APIGEN_OUTPUT_DIR property")

get_target_property(_common_output_dir single.module.package APIGEN_COMMON_OUTPUT_DIR)
test_expect_strequal(
    EXPECTED ""
    ACTUAL ${_common_output_dir}
    MESSAGE "apigen_generate must set APIGEN_COMMON_OUTPUT_DIR property")

get_target_property(_build_output_dir single.module.package APIGEN_BUILD_OUTPUT_DIR)
test_expect_strequal(
    EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/single.module.package/build"
    ACTUAL ${_build_output_dir}
    MESSAGE "apigen_generate must set APIGEN_BUILD_OUTPUT_DIR property")

get_target_property(_build_output_dir single.module.package APIGEN_BUILD_OUTPUT_DIR)
test_expect_strequal(
    EXPECTED "${CMAKE_CURRENT_BINARY_DIR}/single.module.package/build"
    ACTUAL ${_build_output_dir}
    MESSAGE "apigen_generate must set APIGEN_BUILD_OUTPUT_DIR property")

get_target_property(_cpp_export single.module.package GLUECODIUM_CPP_EXPORT)
test_expect_strequal(
    EXPECTED "_GLUECODIUM_CPP"
    ACTUAL ${_cpp_export}
    MESSAGE "apigen_generate must set APIGEN_CPP_EXPORT property")

get_target_property(_cpp_common_export single.module.package GLUECODIUM_CPP_EXPORT_COMMON)
test_expect_strequal(
    EXPECTED "_GLUECODIUM_CPP"
    ACTUAL ${_cpp_common_export}
    MESSAGE "apigen_generate must set APIGEN_CPP_EXPORT_COMMON property")