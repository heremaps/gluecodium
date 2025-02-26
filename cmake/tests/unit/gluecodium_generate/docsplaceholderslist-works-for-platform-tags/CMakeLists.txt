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

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")
include(gluecodium/Gluecodium)

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_contains_string_after_build.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
target_link_libraries(dummySharedLibrary PRIVATE Threads::Threads)

get_supported_gluecodium_generators(_gluecodium_generators)
list(SORT _gluecodium_generators)

gluecodium_generate(dummySharedLibrary GENERATORS ${_gluecodium_generators})
gluecodium_target_lime_sources(dummySharedLibrary
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set_target_properties(dummySharedLibrary
                      PROPERTIES GLUECODIUM_DOCS_PLACEHOLDERS_LIST "${CMAKE_CURRENT_LIST_DIR}/placeholders.properties")

string(REPLACE ";" "-" GENERATORS_DIR_NAME "${_gluecodium_generators}")

set(GENERATED_MAIN_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/${GENERATORS_DIR_NAME}/main")
set(GENERATED_MAIN_DART_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/dart/lib/src/unit/test")
set(GENERATED_MAIN_JAVA_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/android/com/example/unit/test")
set(GENERATED_MAIN_CPP_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/cpp/include/unit/test")
set(GENERATED_MAIN_SWIFT_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/swift/unit/test")

if(dart IN_LIST _gluecodium_generators)
    check_file_contains_string_after_build(
        dummySharedLibrary "${GENERATED_MAIN_DART_FILES_PATH}/foo.dart" "'A sentence for Dart is nice.'")
endif()

if(android IN_LIST _gluecodium_generators)
    check_file_contains_string_after_build(
        dummySharedLibrary "${GENERATED_MAIN_JAVA_FILES_PATH}/Foo.java" "'A sentence for Java is funny.'")
endif()

if(swift IN_LIST _gluecodium_generators)
    check_file_contains_string_after_build(
            dummySharedLibrary "${GENERATED_MAIN_SWIFT_FILES_PATH}/Foo.swift" "'A sentence for Swift is good.'")
endif()

check_file_contains_string_after_build(
    dummySharedLibrary "${GENERATED_MAIN_CPP_FILES_PATH}/Foo.h" "'A sentence for Cpp is the best.'")