# Copyright (C) 2026 HERE Europe B.V.
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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_contains_string_after_build.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_or_directory_exists_after_build.cmake)

if(NOT ANDROID)
  return()
endif()

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(dummySharedLibrary GENERATORS cpp android-kotlin)
gluecodium_target_lime_sources(dummySharedLibrary
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set_target_properties(dummySharedLibrary PROPERTIES
    GLUECODIUM_ANDROID_OPT_IN_ANNOTATION "OptIn"
    GLUECODIUM_ANDROID_REQUIRES_OPT_IN_ANNOTATION "RequiresOptIn"
    GLUECODIUM_ANDROID_INTERNAL_ANNOTATION_NAME "FancyLibraryInternalAPI")

set(GENERATED_ROOT_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/android-kotlin-cpp")
set(GENERATED_MAIN_KOTLIN_DIR_PATH "${GENERATED_ROOT_DIR_PATH}/main/android-kotlin/com/example")
set(GENERATED_COMMON_KOTLIN_FILES_PATH "${GENERATED_ROOT_DIR_PATH}/common/android-kotlin/com/example")

set(INTERNAL_ANNOTATION_FILE_PATH "${GENERATED_COMMON_KOTLIN_FILES_PATH}/FancyLibraryInternalAPI.kt")
set(SOME_INTERNAL_CLASS_FILE_PATH "${GENERATED_MAIN_KOTLIN_DIR_PATH}/unit/test/Foo.kt")

# 1. Verify that internal API annotation file exists.
check_file_or_directory_exists_after_build(dummySharedLibrary "${INTERNAL_ANNOTATION_FILE_PATH}")

# 2. Verify that the file defines the needed annotation.
check_file_contains_string_after_build(dummySharedLibrary
    "${INTERNAL_ANNOTATION_FILE_PATH}"
    "public annotation class FancyLibraryInternalAPI")

# 3. Ensure that the specified 'RequiresOptIn' annotation is used to define the internal API annotation.
check_file_contains_string_after_build(dummySharedLibrary
    "${INTERNAL_ANNOTATION_FILE_PATH}"
    "@RequiresOptIn")

# 4. Check if the internal API annotation is imported by the file.
check_file_contains_string_after_build(dummySharedLibrary
    "${SOME_INTERNAL_CLASS_FILE_PATH}"
    "import com.example.FancyLibraryInternalAPI")

# 5. Check if the annotation is used.
check_file_contains_string_after_build(dummySharedLibrary
    "${SOME_INTERNAL_CLASS_FILE_PATH}"
    "@FancyLibraryInternalAPI")

# 6. Check if file uses 'OptIn'.
check_file_contains_string_after_build(dummySharedLibrary
    "${SOME_INTERNAL_CLASS_FILE_PATH}"
    "@file:OptIn")
