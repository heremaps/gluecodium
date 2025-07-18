# Copyright (C) 2025 HERE Europe B.V.
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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_does_not_contain_string_after_build.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

get_supported_gluecodium_generators(_gluecodium_generators)

if(NOT dart IN_LIST _gluecodium_generators)
  return()
endif()

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(dummySharedLibrary GENERATORS cpp dart)
gluecodium_target_lime_sources(dummySharedLibrary
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set_target_properties(dummySharedLibrary PROPERTIES GLUECODIUM_DART_DISABLE_FINALIZABLE_MARKER "ON")

set(GENERATED_MAIN_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/cpp-dart/main")
set(GENERATED_MAIN_DART_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/dart/lib/src/unit/test")

check_file_does_not_contain_string_after_build(
    dummySharedLibrary "${GENERATED_MAIN_DART_FILES_PATH}/foo.dart" "Finalizable")

check_file_does_not_contain_string_after_build(
    dummySharedLibrary "${GENERATED_MAIN_DART_FILES_PATH}/bar.dart" "Finalizable")

check_file_does_not_contain_string_after_build(
    dummySharedLibrary "${GENERATED_MAIN_DART_FILES_PATH}/baz.dart" "Finalizable")