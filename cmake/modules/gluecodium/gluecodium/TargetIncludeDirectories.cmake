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

if(DEFINED includeguard_gluecodium_TargetIncludeDirectories2)
  return()
endif()
set(includeguard_gluecodium_TargetIncludeDirectories2 ON)

include(${CMAKE_CURRENT_LIST_DIR}/details/FindPackageHost.cmake)

#[===================================================================================================[.rst:
Adds include directories with generated sources to a target.
----------------------------------------------------------

.. command:: gluecodium_target_include_directories

Adds directories with generated sources to target depending on `GLUECODIUM_GENERATORS`,
`GLUECODIUM_OUTPUT_DIR` and `GLUECODIUM_SOURCE_SETS` target properties.
This function must be called only after `gluecodium_add_generate_command` is called.

The general form of the command is::

  gluecodium_target_include_directories(
    <target>  # The target to add include directories.
    )

#]===================================================================================================]

function(gluecodium_get_target_include_directories _target)
  set(single_args RESULT_PUBLIC RESULT_PRIVATE)
  cmake_parse_arguments(_args "" "${single_args}" "" ${ARGN})

  gluecodium_check_no_unparsed_arguments(_args apigen_target_include_directories)

  gluecodium_read_required_properties(
    ${_target}
    SOURCE_SETS _source_sets
    GENERATORS _generators
    OUTPUT_MAIN_DIR _output_main_dir
    OUTPUT_COMMON_DIR _output_common_dir
    OUTPUT_UNITY_DIR _output_unity_dir)

  unset(_result_list_public)
  unset(_result_list_private)

  foreach(_source_set COMMON MAIN)
    if(NOT ${_source_set} IN_LIST _source_sets)
      continue()
    endif()

    string(TOLOWER "${_source_set}" _source_set_lower)

    if(cpp IN_LIST _generators)
      list(APPEND _result_list_public
                  "$<BUILD_INTERFACE:${_output_${_source_set_lower}_dir}/cpp/include>")
    endif()

    if(android IN_LIST _generators)
      list(APPEND _result_list_public
                  "$<BUILD_INTERFACE:${_output_${_source_set_lower}_dir}/android/jni>")
    endif()

    if(android-kotlin IN_LIST _generators)
      list(APPEND _result_list_public
                  "$<BUILD_INTERFACE:${_output_${_source_set_lower}_dir}/android-kotlin/jni>")
    endif()

    if(dart IN_LIST _generators)
      list(APPEND _result_list_public
                  "$<BUILD_INTERFACE:${_output_${_source_set_lower}_dir}/dart/ffi>")
    endif()

    if(swift IN_LIST _generators)
      list(APPEND _result_list_public "$<BUILD_INTERFACE:${_output_${_source_set_lower}_dir}>")
    endif()

  endforeach()

  if((android IN_LIST _generators) OR (android-kotlin IN_LIST _generators))
    # If we're not crosscompiling, we need to manually add JNI includes.
    if(NOT CMAKE_CROSSCOMPILING)
      find_package(JNI REQUIRED)
      list(APPEND _result_list_private "$<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>")
    endif()
  endif()

  if(dart IN_LIST _generators AND NOT GLUECODIUM_DONT_REQUIRE_DART_INCLUDES)
    gluecodium_find_package_host(DartLang REQUIRED)
    list(APPEND _result_list_private
                $<TARGET_PROPERTY:DartLang::dart,INTERFACE_INCLUDE_DIRECTORIES>)
  endif()

  if(_args_RESULT_PUBLIC)
    set(${_args_RESULT_PUBLIC} ${_result_list_public} PARENT_SCOPE)
  endif()

  if(_args_RESULT_PRIVATE)
    set(${_args_RESULT_PRIVATE} ${_result_list_private} PARENT_SCOPE)
  endif()

endfunction()

function(gluecodium_target_include_directories _target)
  gluecodium_get_target_include_directories(${_target} RESULT_PUBLIC _public_include_dirs
                                            RESULT_PRIVATE _private_include_dirs)

  get_target_property(_target_type ${_target} TYPE)

  if(_target_type STREQUAL "INTERFACE_LIBRARY")
    target_include_directories(${_target} INTERFACE ${_public_include_dirs}
                                                    ${_private_include_dirs})
  else()
    target_include_directories(${_target} PUBLIC ${_public_include_dirs}
                               PRIVATE ${_private_include_dirs})
  endif()
endfunction()
