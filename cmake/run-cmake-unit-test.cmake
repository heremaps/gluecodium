#!/usr/bin/env cmake -P
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

# Script is configured with following environment variables:
#
#   CTEST_FILTER                    Filter tests. Parameter is passed
#                                   as regex to ctest like:
#                                   ctest -R $ENV{CTEST_FILTER}
#
#   GLUECODIUM_BUILD_ENVIRONMENT    Build environment to run unit tests.
#                                   Next environments are supported:
#                                   android-x86_64, ios-x86_64
#
# Example:
# > GLUECODIUM_BUILD_ENVIRONMENT=ios-x86_64 CTEST_FILTER="example" ./run-cmake-unit-test.cmake

set (TEST_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/_test_build")
set (OUTPUT_FILE cmake_unit_test_output.txt)
set (DIRECTORY_WRITH_TESTS "${CMAKE_CURRENT_LIST_DIR}/tests")

list (APPEND cmake_module_paths ${CMAKE_MODULE_PATH} "${DIRECTORY_WRITH_TESTS}")

function (heresdk_configure_cmake)
    file (MAKE_DIRECTORY ${TEST_BUILD_DIR})
    set (_test_output_file "${TEST_BUILD_DIR}/${OUTPUT_FILE}")
    file (REMOVE "${_test_output_file}")
    execute_process (
        COMMAND
            ${CMAKE_COMMAND} -Wno-dev ${DIRECTORY_WRITH_TESTS}
            -DTEST_OUTPUT_FILE=${_test_output_file}
            "-DCMAKE_MODULE_PATH=${cmake_module_paths}"
            ${ARGN}
        WORKING_DIRECTORY ${TEST_BUILD_DIR}
        RESULT_VARIABLE CMAKE_PROCESS_RESULT)
    if (CMAKE_PROCESS_RESULT)
        message (FATAL_ERROR "CMake configuration failed")
    endif ()
endfunction ()

function (heresdk_test_cmake)
    if (DEFINED ENV{CTEST_FILTER})
        set (_filter -R $ENV{CTEST_FILTER})
    endif ()
    execute_process (COMMAND ${CMAKE_CTEST_COMMAND} --verbose -C "Debug" ${_filter}
                     WORKING_DIRECTORY ${TEST_BUILD_DIR} RESULT_VARIABLE CMAKE_PROCESS_RESULT)
    if (CMAKE_PROCESS_RESULT)
        message (FATAL_ERROR "CMake test failed")
    endif ()
endfunction ()

heresdk_configure_cmake ()
heresdk_test_cmake ()
