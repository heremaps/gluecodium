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

set (TEST_ANDROID_API_LEVEL_VERSION 28)

function (
    prepare_detailed_information
    result
    testname
    status
    result_config
    output_config
    result_build
    output_build
    expectation_msg)
    set (
        ${result}
        "Test ${testname} ... ${status}:
##############################################################

CONFIGURE STEP (retcode ${result_config}):

${output_config}

BUILD STEP (retcode ${result_build}):

${output_build}

##############################################################

  ${expectation_msg}

"
        PARENT_SCOPE)
endfunction ()

function (print_output_information msgtype text)
    if (TEST_OUTPUT_FILE)
        file (APPEND "${TEST_OUTPUT_FILE}" ${text} "\n")
    endif ()

    if ("${msgtype}" STREQUAL "FATAL_ERROR" OR NOT TEST_OUTPUT_FILE)
        message (${msgtype} "${text}")
    endif ()
endfunction ()

function (
    print_detailed_information
    msgtype
    testname
    status
    result_config
    output_config
    result_build
    output_build
    expectation_msg)
    prepare_detailed_information (
        detailed_info
        ${testname}
        ${status}
        ${result_config}
        "${output_config}"
        ${result_build}
        "${output_build}"
        "${expectation_msg}")
    print_output_information (${msgtype} "${detailed_info}")
endfunction ()

function (get_parameters_for_build_environment result)
    if (NOT GLUECODIUM_BUILD_ENVIRONMENT)
        set (${result} "-GUnix Makefiles" PARENT_SCOPE)
        return()
    endif ()

    unset (_params)

    if (GLUECODIUM_BUILD_ENVIRONMENT STREQUAL "ios-x86_64")
        list (APPEND _params
            -GXcode
            -DCMAKE_OSX_ARCHITECTURES=x86_64
            -DCMAKE_OSX_SYSROOT=iphonesimulator
            -DCMAKE_SYSTEM_NAME=iOS
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,-undefined,error)
    elseif (GLUECODIUM_BUILD_ENVIRONMENT STREQUAL "android-x86_64")
        foreach(env_variable ANDROID_HOME ANDROID_NDK_HOME)
            if (NOT DEFINED ENV{${env_variable}})
                message(FATAL_ERROR "Environment variable must be set: ${env_variable}")
            endif ()
        endforeach()
        list (APPEND _params
            -GNinja
            -DANDROID_ABI=x86_64
            -DANDROID_PLATFORM=android-${TEST_ANDROID_API_LEVEL_VERSION}
            -DANDROID_HOME=$ENV{ANDROID_HOME}
            -DANDROID_STL=c++_shared
            -DCMAKE_TOOLCHAIN_FILE=$ENV{ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,--no-undefined)
    elseif(GLUECODIUM_BUILD_ENVIRONMENT STREQUAL "android-host")
        # Pretend as if we really going to build for Android
        list (APPEND _params
            -GNinja
            -DANDROID=ON
            -DANDROID_PLATFORM=android-${TEST_ANDROID_API_LEVEL_VERSION}
            -DANDROID_HOME=$ENV{ANDROID_HOME}
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,--no-undefined)
    else ()
        message(FATAL_ERROR "Unknown build environment: ${GLUECODIUM_BUILD_ENVIRONMENT}")
    endif ()

    set (${result} ${_params} PARENT_SCOPE)
endfunction ()

# This function will be invoked when run in script mode:
function (base_devel_run_test test_file builddir)
    cmake_minimum_required (VERSION 3.5)

    if (NOT _TEST_DIR)
        print_output_information (FATAL_ERROR "Cannot run without a test directory!")
    endif ()

    get_filename_component (testname "${test_file}" NAME)
    file (REMOVE_RECURSE "${builddir}")
    file (MAKE_DIRECTORY "${builddir}")
    if ($ENV{ENABLE_TRACING})
        set (maybe_trace "--trace-expand")
    endif ()

    if (_TEST_PARAMETERS)
        file (READ ${_TEST_PARAMETERS} _test_parameters)
        string(REPLACE "\n" ";" _test_parameters "${_test_parameters}")
    endif()

    get_parameters_for_build_environment (_env_params)

    execute_process (
        COMMAND
            ${CMAKE_COMMAND} ${maybe_trace}
                "-DCMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}"
                "-DCMAKE_POSITION_INDEPENDENT_CODE=ON"
                "-DGLUECODIUM_CMAKE_TESTS_DIR=${CMAKE_CURRENT_LIST_DIR}"
                "-DGLUECODIUM_CMAKE_DIR=${CMAKE_CURRENT_LIST_DIR}/.."
                "-DGLUECODIUM_BUILD_ENVIRONMENT=${GLUECODIUM_BUILD_ENVIRONMENT}"
            ${_test_parameters}
            ${_env_params}
            ${test_file}
        WORKING_DIRECTORY "${builddir}"
        COMMAND_ECHO STDOUT
        OUTPUT_VARIABLE output_config
        ERROR_VARIABLE output_config
        RESULT_VARIABLE result_config)

    set (result_build "NOT-RUN") # default value
    if (result_config EQUAL 0)
        execute_process (
            COMMAND ${CMAKE_COMMAND} --build .
            WORKING_DIRECTORY "${builddir}"
            OUTPUT_VARIABLE output_build
            ERROR_VARIABLE output_build
            RESULT_VARIABLE result_build)
    endif ()

    set (expectations_matched TRUE)
    set (expectation_file "${test_file}/successful.regex")
    if (EXISTS "${expectation_file}" AND NOT output_config MATCHES "skipping this test")
        print_output_information (STATUS "Checking expectations ...")
        file (STRINGS "${expectation_file}" expectations)
        string (REGEX REPLACE "[\n\r]" "" output_to_match "${output_config}" "${output_build}")
        string (REGEX REPLACE "[ ]+" " " output_to_match "${output_to_match}")
        set (i 0)
        foreach (expectation IN LISTS expectations)
            if (NOT expectation)
                continue ()
            endif ()

            math (EXPR i "${i} + 1")
            string (REGEX MATCH "${expectation}" matched "${output_to_match}")
            if (NOT matched)
                set (expectations_matched FALSE)
                set (failed_expectation "${expectation}")
                # You can uncomment the following line for debug: file(WRITE ${builddir}/runtest-
                # remanining-output.txt
                # "${output_to_match}")
                break ()
            else ()
                string (FIND "${output_to_match}" "${matched}" pos)
                string (LENGTH "${matched}" len)
                math (EXPR pos "${pos} + ${len}")
                string (SUBSTRING "${output_to_match}" ${pos} -1 output_to_match)
            endif ()
        endforeach ()
        print_output_information (STATUS "Checking expectations ... done")
    endif ()

    # tests ending with the '-XFAIL' suffix are eXpected to FAIL, so we invert the result condition
    # for them.
    if (((NOT test_file MATCHES "-XFAIL$" AND result_config EQUAL 0 AND result_build EQUAL 0)
         OR (test_file MATCHES "-XFAIL$" AND NOT (result_config EQUAL 0 AND result_build EQUAL 0)))
        AND expectations_matched)
        set (msgtype STATUS)
        set (status "passed")
    else ()
        set (msgtype FATAL_ERROR)
        set (status "failed")
        if (NOT expectations_matched)
            set (expectation_msg "Failed to match expectation ${i}:\n    * ${failed_expectation}")
        endif ()
    endif ()

    print_detailed_information (
        ${msgtype}
        ${testname}
        ${status}
        ${result_config}
        "${output_config}"
        ${result_build}
        "${output_build}"
        "${expectation_msg}")

endfunction (base_devel_run_test)

# --- if run in script mode, run the test: -------------------------

if (CMAKE_SCRIPT_MODE_FILE)
    base_devel_run_test (${_CURRENT_TEST} ${_TEST_DIR})
    return ()
endif ()

# --- else, just add all tests to the list -------------------------

file (GLOB tests ${CMAKE_CURRENT_SOURCE_DIR}/unit/*/*)
list (SORT tests)

enable_testing ()

foreach (test_file IN LISTS tests)
    file (RELATIVE_PATH relpath "${CMAKE_CURRENT_SOURCE_DIR}/unit" "${test_file}")
    if (NOT IS_DIRECTORY ${test_file} OR test_file MATCHES "-DISABLED$")
        continue ()
    endif ()

    file (GLOB test_parameter_files ${test_file}/test_parameters/*.txt)

    function(_add_test test_name test_file test_dir test_parameter_file)
        add_test (
            NAME "${test_name}"
            COMMAND
                ${CMAKE_COMMAND}
                "-DGLUECODIUM_BUILD_ENVIRONMENT=$ENV{GLUECODIUM_BUILD_ENVIRONMENT}"
                "-DCMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}" "-D_CURRENT_TEST=${test_file}"
                "-D_TEST_DIR=${test_dir}"
                "-D_TEST_PARAMETERS=${test_parameter_file}"
                "-DTEST_OUTPUT_FILE=${TEST_OUTPUT_FILE}" -P ${CMAKE_CURRENT_LIST_FILE})
    endfunction()

    if (test_parameter_files)
        foreach(test_parameter_file ${test_parameter_files})
            get_filename_component(parameter_filename ${test_parameter_file} NAME_WLE)

            _add_test("${PROJECT_NAME}.${relpath}/${parameter_filename}"
                "${test_file}"
                "${CMAKE_CURRENT_BINARY_DIR}/test/${relpath}/${parameter_filename}"
                "${test_parameter_file}")
        endforeach()
    else()
        _add_test("${PROJECT_NAME}.${relpath}"
                "${test_file}"
                "${CMAKE_CURRENT_BINARY_DIR}/test/${relpath}"
                "")
    endif()
endforeach ()
