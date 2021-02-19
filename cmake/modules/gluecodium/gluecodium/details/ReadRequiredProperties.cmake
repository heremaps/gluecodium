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

if(DEFINED includeguard_gluecodium_details_ReadRequiredProperties)
  return()
endif()
set(includeguard_gluecodium_details_ReadRequiredProperties ON)

cmake_minimum_required(VERSION 3.7)

include(${CMAKE_CURRENT_LIST_DIR}/GetOutputDirs.cmake)

function(gluecodium_read_required_properties _target)

  set(_single_value
      GENERATORS
      SOURCE_SETS
      OUTPUT_DIR
      OUTPUT_MAIN_DIR
      OUTPUT_COMMON_DIR
      OUTPUT_UNITY_DIR
      OUTPUT_BUILD_DIR)
  cmake_parse_arguments(_args "" "${_single_value}" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_read_required_properties)

  if(NOT TARGET ${_target})
    message(FATAL_ERROR "Specified target '${_target}' doesn't exist")
  endif()

  set(GLUECODIUM_SUPPORTED_GENERATORS cpp android swift dart)

  function(_read_required_property result _target property_name)
    get_target_property(_property_value ${_target} ${property_name})
    if(NOT _property_value)
      message(
        FATAL_ERROR "Property '${property_name}' is undefined for target '${_target}', "
                    "please call gluecodium_add_generate_command or gluecodium_generate before")
    endif()
    set(${result} ${_property_value} PARENT_SCOPE)

  endfunction()

  _read_required_property(_gluecodium_source_sets ${_target} GLUECODIUM_SOURCE_SETS)
  _read_required_property(_gluecodium_generators ${_target} GLUECODIUM_GENERATORS)
  _read_required_property(_gluecodium_output_dir ${_target} GLUECODIUM_OUTPUT_DIR)

  foreach(_generator ${_gluecodium_generators})
    if(NOT _generator IN_LIST GLUECODIUM_SUPPORTED_GENERATORS)
      message(
        FATAL_ERROR
          "Generator ${_generator} is not in list of supported generators: ${GLUECODIUM_SUPPORTED_GENERATORS}"
      )
    endif()
  endforeach()

  if(_args_SOURCE_SETS)
    set(${_args_SOURCE_SETS} ${_gluecodium_source_sets} PARENT_SCOPE)
  endif()
  if(_args_GENERATORS)
    set(${_args_GENERATORS} ${_gluecodium_generators} PARENT_SCOPE)
  endif()
  if(_args_OUTPUT_DIR)
    set(${_args_OUTPUT_DIR} ${_gluecodium_output_dir} PARENT_SCOPE)
  endif()

  get_target_property(_target_binary_dir ${_target} BINARY_DIR)

  gluecodium_get_output_dirs(
    ${_gluecodium_output_dir} ${_target_binary_dir} _gluecodium_output_main_dir
    _gluecodium_output_common_dir _gluecodium_output_unity_dir _gluecodium_output_build_dir)

  if(_args_OUTPUT_MAIN_DIR AND MAIN IN_LIST _gluecodium_source_sets)
    set(${_args_OUTPUT_MAIN_DIR} ${_gluecodium_output_main_dir} PARENT_SCOPE)
  endif()
  if(_args_OUTPUT_COMMON_DIR AND COMMON IN_LIST _gluecodium_source_sets)
    set(${_args_OUTPUT_COMMON_DIR} ${_gluecodium_output_common_dir} PARENT_SCOPE)
  endif()
  if(_args_OUTPUT_UNITY_DIR)
    set(${_args_OUTPUT_UNITY_DIR} ${_gluecodium_output_unity_dir} PARENT_SCOPE)
  endif()
  if(_args_OUTPUT_BUILD_DIR)
    set(${_args_OUTPUT_BUILD_DIR} ${_gluecodium_output_build_dir} PARENT_SCOPE)
  endif()

endfunction()
