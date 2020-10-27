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

include (${CMAKE_CURRENT_LIST_DIR}/message_colored.cmake)

#[=======================================================================[.rst:

.. command:test_assert_true

If variables are specified checks that theirs values are 1, ON, YES, TRUE, Y, or a non-zero number.
If condition is specified checks that it's TRUE with if/else clauses.
Prints error and breaks execution if any of checks didn't pass.

  test_assert_true(
     [VARIABLE] <variable_name>             # Variable or variable list to check
     [CONDITION] <condition>                # Condition to check. It's possible to pass any condition which
                                            # default CMake's if/else clauses may process.
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_true

If variables are specified checks that theirs values are 1, ON, YES, TRUE, Y, or a non-zero number.
If condition is specified checks that it's TRUE with if/else clauses.
Prints error but doesn't break execution if any of checks didn't pass.

  test_expect_true(
     [VARIABLE] <variable_name>             # Variable or variable list to check
     [CONDITION] <condition>                # Condition to check. It's possible to pass any condition which
                                            # default CMake's if/else clauses may process.
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_false

Checks that variable's value is 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, the empty string,
or ends in the suffix -NOTFOUND. If condition is specified checks that it's FALSE with if/else clauses.
Prints error and breaks execution if any of checks didn't pass.

  test_assert_false(
     [VARIABLE] <variable_name>             # Variable or variable list to check
     [CONDITION] <condition>                # Condition to check. It's possible to pass any condition which
                                            # default CMake's if/else clauses may process.
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_false

Checks that variable's value is 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, the empty string,
or ends in the suffix -NOTFOUND. If condition is specified checks that it's FALSE with if/else clauses.
Prints error but doesn't break execution if any of checks didn't pass.

  test_expect_false(
     VARIABLE <variable_name>               # Variable to check
     [CONDITION] <condition>                # Condition to check. It's possible to pass any condition which
                                            # default CMake's if/else clauses may process.
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_strequal

Checks that arguments are STREQUAL. Prints error and breaks execution in case if values are mismatched
  test_assert_strequal(
     EXPECTED <expected>                    # Expected value
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_strequal

Checks that arguments are STREQUAL. Prints error but doesn't break execution in case if values are mismatched
  test_expect_strequal(
     EXPECTED <expected>                    # Expected value
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_not_strequal

Checks that arguments are NOT STREQUAL. Prints error and breaks execution in case if values are matched
  test_assert_not_strequal(
     EXPECTED <expected>                    # Expected value
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_not_strequal

Checks that arguments are NOT STREQUAL. Prints error but doesn't break execution in case if values are matched
  test_expect_not_strequal(
     EXPECTED <expected>                    # Expected value
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_matches_regex

Checks that actual value matches to expected regex. Prints error and breaks execution in case if values are mismatched
  test_assert_matches_regex(
     EXPECTED <expected_regex>              # Expected regex
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_matches_regex

Checks that actual value matches to expected regex. Prints error but doesn't break execution in case if values are mismatched
  test_expect_matches_regex(
     EXPECTED <expected_regex>              # Expected regex
     ACTUAL <actual>                        # Actual value
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_defined

Checks that variable is defined. Prints error and breaks execution in case if variable is not defined
  test_assert_defined(
     VARIABLE <variable_name>               # Variable to check
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_defined

Checks that variable is defined. Prints error but doesn't breakg execution in case if variable is not defined
  test_expect_defined(
     VARIABLE <variable_name>               # Variable to check
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_not_defined

Checks that variable is NOT defined. Prints error and breaks execution in case if variable is defined
  test_assert_not_defined(
     VARIABLE <variable_name>               # Variable to check
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_not_defined

Checks that variable is NOT defined. Prints error but doesn't break execution in case if variable is defined
  test_expect_not_defined(
     VARIABLE <variable_name>               # Variable to check
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_strequal_lists

Checks that lists have same count of items and items at the same positions are STREQUAL.
Prints error and breaks execution in case if values are mismatched
  test_assert_strequal_lists(
     EXPECTED item1 item2 ...               # Expected list
     ACTUAL item1 item2 ...                 # Actual list
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_strequal_lists

Checks that lists have same count of items and items at the same positions are STREQUAL.
Prints error but doesn't break execution in case if values are mismatched
  test_expect_strequal_lists(
     EXPECTED item1 item2 ...               # Expected list
     ACTUAL item1 item2 ...                 # Actual list
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_execute_process_succeed

Checks that process was executed and succeed. Prints execution output, error and breaks execution
if execution failed.
  test_assert_execute_process_succeed(
     option1 option2 ...                    # All options will be passed to CMake execute_process function
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_assert_execute_process_failed

Checks that process was executed and failed. Prints execution output and breaks execution
if execution succeed.
  test_assert_execute_process_failed(
     option1 option2 ...                    # All options will be passed to CMake execute_process function
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_execute_process_succeed

Checks that process was executed and succeed. Prints execution output and error
if execution failed.
  test_expect_execute_process_succeed(
     option1 option2 ...                    # All options will be passed to CMake execute_process function
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )


.. command:test_expect_execute_process_failed

Checks that process was executed and failed. Prints execution output if execution succeed.
  test_expect_execute_process_failed(
     option1 option2 ...                    # All options will be passed to CMake execute_process function
     [MESSAGE] "message1" "message1" ...    # Optional message list to display in case of failed test
   )

#]=======================================================================]

function (_report_test_error mode additional_message)
    set (_message "")
    foreach (arg ${ARGN})
        set (_message "${_message}
        ${arg}")
    endforeach ()
    if (additional_message)
        set (_message "${_message}
        Message: ${additional_message}")
    endif ()

    message_colored (RED ${mode} "${_message}")
endfunction ()

macro (_test_parse_variable_message)
    unset (_test_check_parameters_args_MESSAGE)
    unset (_test_check_parameters_args_VARIABLE)

    set (_multi_value_args VARIABLE MESSAGE)

    cmake_parse_arguments (_test_check_parameters_args "" "" "${_multi_value_args}" ${ARGN})
endmacro ()

macro (_test_parse_condition_variable_message)
    unset (_test_check_parameters_args_MESSAGE)
    unset (_test_check_parameters_args_VARIABLE)
    unset (_test_check_parameters_args_CONDITION)

    set (_multi_value_args CONDITION VARIABLE MESSAGE)

    cmake_parse_arguments (_test_check_parameters_args "" "" "${_multi_value_args}" ${ARGN})

    if (NOT DEFINED _test_check_parameters_args_VARIABLE AND NOT DEFINED
                                                             _test_check_parameters_args_CONDITION)
        _report_test_error (FATAL_ERROR "Either VARIABLE or CONDITION parameter should be passed")
    endif ()
endmacro ()

macro (_test_parse_expected_actual_message)
    unset (_test_check_parameters_args_EXPECTED)
    unset (_test_check_parameters_args_ACTUAL)
    unset (_test_check_parameters_args_MESSAGE)

    set (_single_value_args EXPECTED ACTUAL)
    set (_multi_value_args MESSAGE)

    cmake_parse_arguments (_test_check_parameters_args "" "${_single_value_args}"
                           "${_multi_value_args}" ${ARGN})

    if (NOT DEFINED _test_check_parameters_args_EXPECTED)
        if (EXPECTED IN_LIST ARGN)
            set (_test_check_parameters_args_EXPECTED "")
        else ()
            _report_test_error (FATAL_ERROR "Missed EXPECTED parameter")
        endif ()
    endif ()

    if (NOT DEFINED _test_check_parameters_args_ACTUAL)
        if (ACTUAL IN_LIST ARGN)
            set (_test_check_parameters_args_ACTUAL "")
        else ()
            _report_test_error (FATAL_ERROR "Missed ACTUAL parameter")
        endif ()
    endif ()
endmacro ()

macro (_test_parse_multi_expected_actual_message)
    unset (_test_check_parameters_args_EXPECTED)
    unset (_test_check_parameters_args_ACTUAL)
    unset (_test_check_parameters_args_MESSAGE)

    set (_multi_value_args EXPECTED ACTUAL MESSAGE)

    cmake_parse_arguments (_test_check_parameters_args "" "" "${_multi_value_args}" ${ARGN})

    if (NOT DEFINED _test_check_parameters_args_EXPECTED)
        if (EXPECTED IN_LIST ARGN)
            set (_test_check_parameters_args_EXPECTED "")
        else ()
            _report_test_error (FATAL_ERROR "Missed EXPECTED parameter")
        endif ()
    endif ()

    if (NOT DEFINED _test_check_parameters_args_ACTUAL)
        if (ACTUAL IN_LIST ARGN)
            set (_test_check_parameters_args_ACTUAL "")
        else ()
            _report_test_error (FATAL_ERROR "Missed ACTUAL parameter")
        endif ()
    endif ()
endmacro ()

function (_test_check_strequal message_mode)
    _test_parse_expected_actual_message (${ARGN})

    if (NOT _test_check_parameters_args_EXPECTED STREQUAL _test_check_parameters_args_ACTUAL)
        _report_test_error (
            ${message_mode} "${_test_check_parameters_args_MESSAGE}"
            "Comparison failed" "Expected:  ${_test_check_parameters_args_EXPECTED}"
            "Actual:    ${_test_check_parameters_args_ACTUAL}")
    endif ()
endfunction ()

function (test_assert_strequal)
    _test_check_strequal (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_strequal)
    _test_check_strequal (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_not_strequal message_mode)
    _test_parse_expected_actual_message (${ARGN})

    if (_test_check_parameters_args_EXPECTED STREQUAL _test_check_parameters_args_ACTUAL)
        _report_test_error (
            ${message_mode} "${_test_check_parameters_args_MESSAGE}"
            "Comparison failed" "Expected:  Not equal to ${_test_check_parameters_args_EXPECTED}"
            "Actual:    ${_test_check_parameters_args_ACTUAL}")
    endif ()
endfunction ()

function (test_assert_not_strequal)
    _test_check_not_strequal (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_not_strequal)
    _test_check_not_strequal (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_matches_regex message_mode)
    _test_parse_expected_actual_message (${ARGN})

    if (NOT _test_check_parameters_args_ACTUAL MATCHES ${_test_check_parameters_args_EXPECTED})
        _report_test_error (
            ${message_mode} "${_test_check_parameters_args_MESSAGE}"
            "Regex matching failed"
            "Expected:  Matches to regex '${_test_check_parameters_args_EXPECTED}'"
            "Actual:    '${_test_check_parameters_args_ACTUAL}'")
    endif ()
endfunction ()

function (test_assert_matches_regex)
    _test_check_matches_regex (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_matches_regex)
    _test_check_matches_regex (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_defined message_mode)
    _test_parse_variable_message (${ARGN})

    if (NOT DEFINED ${_test_check_parameters_args_VARIABLE})
        _report_test_error (
            ${message_mode} "${_test_check_parameters_args_MESSAGE}"
            "Variable check definition failed"
            "Expected:  Variable '${_test_check_parameters_args_VARIABLE}' defined"
            "Actual:    Not defined")
    endif ()
endfunction ()

function (test_assert_defined)
    _test_check_defined (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_defined)
    _test_check_defined (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_not_defined message_mode)
    _test_parse_variable_message (${ARGN})

    if (DEFINED ${_test_check_parameters_args_VARIABLE})
        _report_test_error (
            ${message_mode} "${_test_check_parameters_args_MESSAGE}"
            "Variable check definition failed"
            "Expected:  Variable '${_test_check_parameters_args_VARIABLE}' NOT defined"
            "Actual:    Defined and contains: ${${_test_check_parameters_args_VARIABLE}}")
    endif ()
endfunction ()

function (test_assert_not_defined)
    _test_check_not_defined (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_not_defined)
    _test_check_not_defined (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_true message_mode)
    _test_parse_condition_variable_message (${ARGN})
    foreach (_var ${_test_check_parameters_args_VARIABLE})
        if (NOT ${_var})
            if (NOT DEFINED ${_var})
                set (_actual_status "Not defined")
            else ()
                set (_actual_status "${${_var}}")
            endif ()
            _report_test_error (
                ${message_mode} "${_test_check_parameters_args_MESSAGE}"
                "Variable boolean check failed"
                "Expected:  Variable '${_var}' is 1, ON, YES, TRUE, Y, or a non-zero number"
                "Actual:    ${_actual_status}")
        endif ()
    endforeach ()
    if (DEFINED _test_check_parameters_args_CONDITION)
        if (${_test_check_parameters_args_CONDITION})

        else ()
            string (REPLACE ";" " " _condition "${_test_check_parameters_args_CONDITION}")
            _report_test_error (${message_mode} "${_test_check_parameters_args_MESSAGE}"
                                "Condition expectation failed: '${_condition}'")
        endif ()
    endif ()
endfunction ()

function (test_assert_true)
    _test_check_true (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_true)
    _test_check_true (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_false message_mode)
    _test_parse_condition_variable_message (${ARGN})
    foreach (_var ${_test_check_parameters_args_VARIABLE})
        if (${_var})
            _report_test_error (
                ${message_mode} "${_test_check_parameters_args_MESSAGE}"
                "Variable boolean check failed"
                "Expected:  Variable '${_var}' is 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, the empty string, or ends in the suffix -NOTFOUND"
                "Actual:    ${${_var}}")
        endif ()
    endforeach ()
    if (DEFINED _test_check_parameters_args_CONDITION)
        if (${_test_check_parameters_args_CONDITION})
            string (REPLACE ";" " " _condition "${_test_check_parameters_args_CONDITION}")
            _report_test_error (${message_mode} "${_test_check_parameters_args_MESSAGE}"
                                "Condition expectation failed: NOT (${_condition})")
        endif ()
    endif ()
endfunction ()

function (test_assert_false)
    _test_check_false (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_false)
    _test_check_false (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_strequal_lists message_mode)
    _test_parse_multi_expected_actual_message (${ARGN})

    list (LENGTH _test_check_parameters_args_EXPECTED expected_length)
    list (LENGTH _test_check_parameters_args_ACTUAL actual_length)

    unset (_error_message)

    if (NOT expected_length STREQUAL actual_length)
        list (
            APPEND _error_message
                   "List lengths mismatched"
                   "Expected list length:  ${expected_length}"
                   "Actual list length:    ${actual_length}")
    endif ()

    if (NOT _error_message)
        if (expected_length EQUAL 0)
            return ()
        endif ()

        math (EXPR expected_length "${expected_length} - 1")

        foreach (index RANGE ${expected_length})
            list (GET _test_check_parameters_args_EXPECTED ${index} expected_item)
            list (GET _test_check_parameters_args_ACTUAL ${index} actual_item)
            if (NOT expected_item STREQUAL actual_item)
                list (APPEND _error_message "Mismatch at position ${index}")
            endif ()
        endforeach ()
    endif ()

    if (_error_message)
        string (REPLACE ";" ", " _test_check_parameters_args_EXPECTED
                        "${_test_check_parameters_args_EXPECTED}")
        string (REPLACE ";" ", " _test_check_parameters_args_ACTUAL
                        "${_test_check_parameters_args_ACTUAL}")
        list (APPEND _error_message "Expected list: [${_test_check_parameters_args_EXPECTED}]"
                     "Actual list: [${_test_check_parameters_args_ACTUAL}]")
        _report_test_error (${message_mode} "${_test_check_parameters_args_MESSAGE}"
                            ${_error_message})
    endif ()
endfunction ()

function (test_assert_strequal_lists)
    _test_check_strequal_lists (FATAL_ERROR ${ARGN})
endfunction ()

function (test_expect_strequal_lists)
    _test_check_strequal_lists (SEND_ERROR ${ARGN})
endfunction ()

function (_test_check_execute_process message_mode expect_success)
    set (_single_args RESULT_VARIABLE RESULTS_VARIABLE OUTPUT_VARIABLE ERROR_VARIABLE MESSAGE)
    cmake_parse_arguments (_args "" "${_single_args}" "" ${ARGN})

    if (_args_RESULTS_VARIABLE)
        message (FATAL_ERROR "RESULTS_VARIABLE is not supported")
    endif ()

    if (_args_OUTPUT_VARIABLE AND _args_ERROR_VARIABLE AND NOT _args_OUTPUT_VARIABLE STREQUAL
                                                           _args_ERROR_VARIABLE)
        message (
            FATAL_ERROR "Case when OUTPUT_VARIABLE is NOT equal to ERROR_VARIABLE not supported")
    endif ()

    execute_process (
        ${_args_UNPARSED_ARGUMENTS}
        RESULT_VARIABLE _utils_asserts_result
        OUTPUT_VARIABLE _utils_asserts_output
        ERROR_VARIABLE _utils_asserts_output
        OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_STRIP_TRAILING_WHITESPACE)

    if (_args_RESULT_VARIABLE)
        set (${_args_RESULT_VARIABLE} ${_utils_asserts_result} PARENT_SCOPE)
    endif ()
    if (_args_OUTPUT_VARIABLE)
        set (${_args_OUTPUT_VARIABLE} ${_utils_asserts_output} PARENT_SCOPE)
    endif ()

    if (expect_success)
        if (_utils_asserts_result)
            _report_test_error (
                ${message_mode} "${_args_MESSAGE}"
                "Execution failed." "Exit code: ${_utils_asserts_result}"
                "Output:" "============================================"
                ${_utils_asserts_output} "============================================")
        endif ()
    else ()
        if (NOT _utils_asserts_result)
            _report_test_error (
                ${message_mode} "${_args_MESSAGE}"
                "Execution succeed" "Output:"
                "============================================" ${_utils_asserts_output}
                "============================================")
        endif ()
    endif ()
endfunction ()

macro (test_assert_execute_process_succeed)
    _test_check_execute_process (FATAL_ERROR YES ${ARGN})
endmacro ()

macro (test_assert_execute_process_failed)
    _test_check_execute_process (FATAL_ERROR NO ${ARGN})
endmacro ()

macro (test_expect_execute_process_succeed)
    _test_check_execute_process (SEND_ERROR YES ${ARGN})
endmacro ()

macro (test_expect_execute_process_failed)
    _test_check_execute_process (SEND_ERROR NO ${ARGN})
endmacro ()
