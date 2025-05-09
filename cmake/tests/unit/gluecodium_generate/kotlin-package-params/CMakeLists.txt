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

if(NOT ANDROID)
  return()
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")
include(gluecodium/Gluecodium)

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_contains_string_after_build.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_or_directory_exists_after_build.cmake)

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(dummySharedLibrary GENERATORS cpp android-kotlin)
gluecodium_target_lime_sources(dummySharedLibrary
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set_target_properties(dummySharedLibrary PROPERTIES
                      GLUECODIUM_KOTLIN_PACKAGE "my.pubz.xlib"
                      GLUECODIUM_KOTLIN_INTERNAL_PACKAGE "xinternals.xlib")

set(GENERATED_MAIN_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/android-kotlin-cpp/main")
set(GENERATED_MAIN_KOTLIN_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/android-kotlin/my/pubz/xlib/unit/test")

check_file_or_directory_exists_after_build(dummySharedLibrary "${GENERATED_MAIN_KOTLIN_FILES_PATH}")
check_file_or_directory_exists_after_build(dummySharedLibrary "${GENERATED_MAIN_KOTLIN_FILES_PATH}/Foo.kt")
check_file_contains_string_after_build(dummySharedLibrary "${GENERATED_MAIN_KOTLIN_FILES_PATH}/Foo.kt" "package my.pubz.xlib.unit.test")

set(GENERATED_COMMON_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/android-kotlin-cpp/common")
set(GENERATED_COMMON_KOTLIN_FILES_PATH "${GENERATED_COMMON_DIR_PATH}/android-kotlin/my/pubz/xlib/xinternals/xlib")

check_file_or_directory_exists_after_build(dummySharedLibrary "${GENERATED_COMMON_KOTLIN_FILES_PATH}")
check_file_or_directory_exists_after_build(dummySharedLibrary "${GENERATED_COMMON_KOTLIN_FILES_PATH}/NativeBase.kt")
check_file_contains_string_after_build(dummySharedLibrary "${GENERATED_COMMON_KOTLIN_FILES_PATH}/NativeBase.kt" "package my.pubz.xlib.xinternals.xlib")