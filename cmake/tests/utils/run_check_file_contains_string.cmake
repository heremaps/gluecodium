# Copyright (C) 2016-2025 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

include("${CMAKE_CURRENT_LIST_DIR}/message_colored.cmake")

set(_required_vars CHECK_FILE_CONTAINS_FILE_PATH CHECK_FILE_CONTAINS_NEEDLE)

foreach(_required_variable ${_required_vars})
  if(NOT DEFINED ${_required_variable})
    message_colored(RED FATAL_ERROR "${_required_variable} must be specified")
  endif()
endforeach()

if(NOT EXISTS ${CHECK_FILE_CONTAINS_FILE_PATH})
    message_colored(RED FATAL_ERROR "${CHECK_FILE_CONTAINS_FILE_PATH} does not exist!")
endif()

file(STRINGS ${CHECK_FILE_CONTAINS_FILE_PATH} _lines)

set(FOUND_NEEDLE FALSE)

foreach(_line IN LISTS _lines)
    if("${_line}" MATCHES "${CHECK_FILE_CONTAINS_NEEDLE}")
        set(FOUND_NEEDLE TRUE)
        break()
    endif()
endforeach()

if(NOT ${FOUND_NEEDLE})
    message_colored(RED FATAL_ERROR "The file ${CHECK_FILE_CONTAINS_FILE_PATH} does not contain: ${CHECK_FILE_CONTAINS_NEEDLE}")
endif()