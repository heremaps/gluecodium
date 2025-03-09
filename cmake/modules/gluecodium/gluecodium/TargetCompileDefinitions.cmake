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

if(DEFINED includeguard_gluecodium_TargetCompileDefinitions)
  return()
endif()
set(includeguard_gluecodium_TargetCompileDefinitions ON)

cmake_minimum_required(VERSION 3.10)

include(${CMAKE_CURRENT_LIST_DIR}/details/ReadRequiredProperties.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/GetTargetCompileDefinitions.cmake)

#[===================================================================================================[.rst:
Adds compile definitions for target if it's shared library.
-----------------------------------------------------------

.. command:: gluecodium_target_compile_definitions

Gluecodium generates export macros and necessary compilation definitions are added
with this function if a target is `SHARED` library.
In other cases it's necessary to retrieve such macros with function
`gluecodium_get_target_compile_definitions` and add them manually.
See example 2 for `gluecodium_generate` function.
This function must be called only after `gluecodium_add_generate_command` is called.

The general form of the command is::

  gluecodium_target_compile_definitions(
    <target>  # The target to set compile definitions.
    )

#]===================================================================================================]

function(gluecodium_target_compile_definitions _target)
  get_target_property(_target_type ${_target} TYPE)
  if(_target_type STREQUAL "SHARED_LIBRARY")
    gluecodium_get_target_compile_definitions(${_target} RESULT_PUBLIC _public
                                              RESULT_PRIVATE _private)

    target_compile_definitions(${_target} PUBLIC ${_public} PRIVATE ${_private})
  endif()
endfunction()
