# Copyright (C) 2016-2021 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

include("${CMAKE_CURRENT_LIST_DIR}/message_colored.cmake")

set(_required_vars CHECK_SYMBOL_BINARY_PATH CHECK_SYMBOL_NM_PATH CHECK_SYMBOL_GREP_PATH)

foreach(_required_variable ${_required_vars})
  if(NOT DEFINED ${_required_variable})
    message_colored(RED FATAL_ERROR "${_required_variable} must be specified")
  endif()
endforeach()

if(NOT EXISTS "${CHECK_SYMBOL_BINARY_PATH}")
  message_colored(RED FATAL_ERROR
                  "Binary to check symbols doesn't exits: \"${CHECK_SYMBOL_BINARY_PATH}\"")
endif()

function(_check_existance result binary_path regex)
  execute_process(
    COMMAND ${CHECK_SYMBOL_NM_PATH} "${binary_path}"
    COMMAND ${CHECK_SYMBOL_GREP_PATH} -E "${regex}"
    RESULT_VARIABLE _regex_result
    OUTPUT_VARIABLE _output)

  if(_regex_result)
    set(${result} FALSE PARENT_SCOPE)
  else()
    set(${result} TRUE PARENT_SCOPE)
  endif()
endfunction()

foreach(_regex IN LISTS CHECK_SYMBOL_EXIST_REGEXES)
  _check_existance(_exists "${CHECK_SYMBOL_BINARY_PATH}" "${_regex}")

  if(NOT _exists)
    message_colored(RED FATAL_ERROR "Required symbol with regex pattern \"${_regex}\" "
                                    "doesn't exist in the binary \"${CHECK_SYMBOL_BINARY_PATH}\"")
  endif()
endforeach()

foreach(_regex IN LISTS CHECK_SYMBOL_NOT_EXIST_REGEXES)
  _check_existance(_exists "${CHECK_SYMBOL_BINARY_PATH}" "${_regex}")

  if(_exists)
    message_colored(
      RED FATAL_ERROR "Symbol with regex pattern \"${_regex}\" "
                      "exists in the binary \"${CHECK_SYMBOL_BINARY_PATH}\" but it shouldn't")
  endif()
endforeach()
