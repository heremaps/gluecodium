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

if(DEFINED includeguard_gluecodium_TargetIncludeDirectories)
  return()
endif()
set(includeguard_gluecodium_TargetIncludeDirectories ON)

cmake_minimum_required(VERSION 3.5)

include(${CMAKE_CURRENT_LIST_DIR}/CheckArguments.cmake)

#[===========================================================================================[.rst:
Generated target_include_directories module
-------------------------------------------

.. command:: apigen_get_target_include_directories

    Returns list of include directories of the provided target. Result
    might depend on the previously used generator (cpp, android,
    swift, etc.). This method depends on apigen_generate() to have been run on
    the target first.

The general form of the command is::

    apigen_get_target_include_directories(
      target                                Target for which source was
                                            generated via `apigen_generate`.
      [MAIN]                                Optional flag to add the include path of
                                            the MAIN generated source set, i.e. code
                                            generated for the input Lime IDL files.
      [COMMON]                              Optional flag to add the include path of
                                            the common generated source set.
      PUBLIC_RESULT_VARIABLE <variable>     Variable to return result with list of
                                            public include directories.
      [PRIVATE_RESULT_VARIABLE <variable>]  Optional variable to return result with
                                            list of private include directories.
    )
    Note: If neither MAIN nor COMMON are specified, both are added. Specifying a
    source set requires a separate common output directory to be set for
    `apigen_generate`.

.. command:: apigen_target_include_directories

    Attaches additional include directories to the provided target.
    These might differ depending on the previously used generator (cpp, android,
    swift, etc.). This method depends on apigen_generate() to have been run on
    the target first.

The general form of the command is::

    apigen_target_include_directories(
       target     Target for which source was generated via `apigen_generate`
       [MAIN]     Add the include path to the MAIN generated source set, i.e.
                  code generated for the input Lime IDL files.
       [COMMON] Add the include path to the common generated source set.
    )
    Note: If neither MAIN nor COMMON are specified, both are added. Specifying a
    source set requires a separate common output directory to be set for
    `apigen_generate`.

#]===========================================================================================]

function(apigen_get_target_include_directories target)
  set(options MAIN COMMON)
  set(single_args PUBLIC_RESULT_VARIABLE PRIVATE_RESULT_VARIABLE)
  cmake_parse_arguments(APIGEN_TARGET_INCLUDE_DIRECTORIES "${options}" "${single_args}" "" ${ARGN})

  apigen_check_no_unparsed_arguments(APIGEN_TARGET_INCLUDE_DIRECTORIES apigen_target_include_directories)

  unset (_properties_out_dir)
  if (APIGEN_TARGET_INCLUDE_DIRECTORIES_MAIN)
    list (APPEND _properties_out_dir APIGEN_OUTPUT_DIR)
  endif ()

  if (APIGEN_TARGET_INCLUDE_DIRECTORIES_COMMON)
    get_target_property(COMMON_OUTPUT_DIR ${target} APIGEN_COMMON_OUTPUT_DIR)
    if(NOT COMMON_OUTPUT_DIR)
      message(FATAL_ERROR "COMMON include directoriy is necessary, but apigen_target was called "
                          "without COMMON_OUTPUT_DIR argument. Please specify this argument.")
    endif()
    list (APPEND _properties_out_dir APIGEN_COMMON_OUTPUT_DIR)
  endif ()

  if (NOT _properties_out_dir)
    list (APPEND _properties_out_dir APIGEN_OUTPUT_DIR APIGEN_COMMON_OUTPUT_DIR)
  endif ()

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)

  unset (_result_list_public)
  foreach (_property_out_dir ${_properties_out_dir})
    get_target_property(OUTPUT_DIR ${target} ${_property_out_dir})
    if (OUTPUT_DIR)
      list(APPEND _result_list_public $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>)
      if(NOT ${GENERATOR} STREQUAL cpp)
        list(APPEND _result_list_public $<BUILD_INTERFACE:${OUTPUT_DIR}>)
      endif()

      if(${GENERATOR} MATCHES android)
        list(APPEND _result_list_public $<BUILD_INTERFACE:${OUTPUT_DIR}/android/jni>)
      endif()

      if(GENERATOR MATCHES dart)
        list(APPEND _result_list_public $<BUILD_INTERFACE:${OUTPUT_DIR}/dart/ffi>)
      endif()
    endif()
  endforeach ()

  if(${GENERATOR} MATCHES android)
    # If we're not crosscompiling, we need to manually add JNI includes.
    if(NOT CMAKE_CROSSCOMPILING)
      find_package(JNI REQUIRED)
      list(APPEND _result_list_private $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
    endif()
  endif()

  if (APIGEN_TARGET_INCLUDE_DIRECTORIES_PUBLIC_RESULT_VARIABLE)
    set (${APIGEN_TARGET_INCLUDE_DIRECTORIES_PUBLIC_RESULT_VARIABLE} ${_result_list_public} PARENT_SCOPE)
  endif()

  if (APIGEN_TARGET_INCLUDE_DIRECTORIES_PRIVATE_RESULT_VARIABLE)
    set (${APIGEN_TARGET_INCLUDE_DIRECTORIES_PRIVATE_RESULT_VARIABLE} ${_result_list_private} PARENT_SCOPE)
  endif()
endfunction()


function(apigen_target_include_directories target)
  apigen_get_target_include_directories(${target} ${ARGN} PUBLIC_RESULT_VARIABLE _public_include_dirs
    PRIVATE_RESULT_VARIABLE _private_include_dirs)

  if (_public_include_dirs)
    target_include_directories(${target} PUBLIC ${_public_include_dirs})
  endif()

  if (_private_include_dirs)
    target_include_directories(${target} PRIVATE ${_private_include_dirs})
  endif ()
endfunction()
