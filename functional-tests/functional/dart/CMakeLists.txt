# Copyright (C) 2016-2019 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.10)
project(test_dart)

if(NOT FUNCTIONAL_BUILD_DART_TESTS)
  return()
endif()

find_program(DART_VM dart)

if(DART_VM)
    execute_process(COMMAND ${DART_VM} --version ERROR_VARIABLE DART_VERSION)
    message(STATUS "[Dart] ${DART_VERSION}")
else()
    message(FATAL_ERROR "Dart SDK was not found")
endif()

configure_file("pubspec.yaml.in" "${CMAKE_CURRENT_BINARY_DIR}/pubspec.yaml")
configure_file("main.dart" "${CMAKE_CURRENT_BINARY_DIR}/main.dart" COPYONLY)
configure_file("test_suite.dart" "${CMAKE_CURRENT_BINARY_DIR}/test_suite.dart" COPYONLY)
file(GLOB_RECURSE testFiles "test/*_test.dart")
foreach(testFile ${testFiles})
    get_filename_component(testFileName ${testFile} NAME)
    configure_file(${testFile} "${CMAKE_CURRENT_BINARY_DIR}/test/${testFileName}" COPYONLY)
endforeach()

add_custom_target(test_dart ALL
    COMMENT "Compiling native executable from Dart sources"
    COMMAND ${DART_VM} pub get # Fetch dependencies according to pubspec.yaml file
    COMMAND ${DART_VM} compile exe "main.dart" "-o" "test_dart"
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS functional
    COMMAND_EXPAND_LISTS)

add_test(NAME unit_tests_dart COMMAND ${CMAKE_CURRENT_BINARY_DIR}/test_dart $<TARGET_FILE:functional>)

if(BUILD_DART_WITH_ASAN)
    find_library(LIBASAN NAMES asan libasan.so.5 libasan.so.4 REQUIRED)
    set_tests_properties(unit_tests_dart PROPERTIES
        ENVIRONMENT "LD_PRELOAD=${LIBASAN}")
endif()
