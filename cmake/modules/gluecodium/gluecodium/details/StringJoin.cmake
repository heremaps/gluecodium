# Copyright (C) 2020 HERE Europe B.V.
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

if(DEFINED includeguard_gluecodium_details_StringJoin)
  return()
endif()
set(includeguard_gluecodium_details_StringJoin ON)

cmake_minimum_required(VERSION 3.10)

#[===========================================================================================[.rst:

  Concatenate all the input arguments together and store the result in the named output variable.
  In CMake >= 3.12 default function `string(JOIN ...)` is used. Also variable
  `GLUECODIUM_DONT_USE_STRING_JOIN` can be set to `ON` to avoid using default function.

  string_join(
    glue            # The string to insert between input strings
    output          # The output variable
    [<input> ...]   # The list of strings to join
  )

#]===========================================================================================]

function(string_join glue output)
  unset(_output)
  if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_STRING_JOIN)
    string(JOIN ${glue} _output ${ARGN})
  else()
    # string (JOIN ...) is not available in old CMake
    unset(_glue)
    foreach(_chunk IN LISTS ARGN)
      string(APPEND _output ${_glue} ${_chunk})
      if(NOT DEFINED _glue)
        set(_glue ${glue})
      endif()
    endforeach()
  endif()
  set(${output} ${_output} PARENT_SCOPE)
endfunction()
