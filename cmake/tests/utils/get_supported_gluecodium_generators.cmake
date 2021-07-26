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

#[=======================================================================[.rst:

.. command:get_supported_gluecodium_generators

Returns list of gluecodium generators which are suppoosed to be supported on given
platform (i.e. generated code must be compiled).

  get_supported_gluecodium_generators(
    <result>   # Variable to store result list
   )
#]=======================================================================]

function(get_supported_gluecodium_generators result)
  list(APPEND _gluecodium_generator cpp)
  if(ANDROID)
    list(APPEND _gluecodium_generator android)
  elseif(CMAKE_GENERATOR STREQUAL "Xcode")
    list(APPEND _gluecodium_generator swift)
  endif()

  find_program(_dart_exe dart)
  if(_dart_exe)
    list(APPEND _gluecodium_generator dart)
  endif()

  set(${result} ${_gluecodium_generator} PARENT_SCOPE)
endfunction()
