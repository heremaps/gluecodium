# Copyright (C) 2021 HERE Europe B.V.
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

if(DEFINED includeguard_gluecodium_GenerateStubs)
  return()
endif()
set(includeguard_gluecodium_GenerateStubs ON)

cmake_minimum_required(VERSION 3.7)

include(${CMAKE_CURRENT_LIST_DIR}/AddGenerateCommand.cmake)

#[===================================================================================================[.rst:
Creates step to generate stubs for unit testing instead of code for the given target.
---------------------------------------------------------------------------------

.. command:: gluecodium_generate_stubs

The general form of the command is::

gluecodium_add_generate_command(
    <target>                  # The target to add generate rules for.
    FOR_TARGET <target_src>   # The target which already has steps to generate gluecodium code.
                              # `gluecodium_generate` or `gluecodium_add_generate_command` must
                              # already be called for this target.
    [OUTPUT_DIR <path>]       # The path to output directory where stubs code will be
                              # generated. Has same meaning as the same parameter for
                              # `gluecodium_generate` or `gluecodium_add_generate_command`.
                              # This options is initialized by the value of
                              # `GLUECODIUM_BASE_STUBS_OUTPUT_DIR_DEFAULT` or
                              # `GLUECODIUM_OUTPUT_DIR_DEFAULT` variables if any is set when this
                              # function is called. `GLUECODIUM_BASE_STUBS_OUTPUT_DIR_DEFAULT`
                              # has precedence over `GLUECODIUM_OUTPUT_DIR_DEFAULT`.
                              # For default value refer to documentation of the
                              # `gluecodium_add_generate_command`
  )

This option performs next actions:
1. Copies all known optional gluecodium cmake properties from `target_src` to `target`.
2. Copies prime and interface lime sources from `target_src` to `target`.
3. Calls `gluecodium_add_generate_command` for the `target`.
4. Creates custom target `<target>.gluecodium.generate` which can be used to generate stubs.

Example:

add_library(library_with_generated_sources)
...
gluecodium_generate(library_with_generated_sources GENERATORS cpp swift dart)

add_library(library_with_stubs)
gluecodium_generate_stubs(library_with_stubs FOR_TARGET library_with_generated_sources)

#]===================================================================================================]

function(gluecodium_generate_stubs _target)
  set(_single_args OUTPUT_DIR FOR_TARGET)
  cmake_parse_arguments(_args "" "${_single_args}" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_generate_stubs)
  gluecodium_require_argument(_args FOR_TARGET gluecodium_generate_stubs)

  # Copy all known optional parameters from source target
  get_property(_known_optional_properties GLOBAL PROPERTY GLUECODIUM_KNOWN_OPTIONAL_PROPERTIES)
  foreach(_known_property ${_known_optional_properties})
    get_target_property(_existing_property ${_target} ${_known_property})
    if(_existing_property STREQUAL "_existing_property-NOTFOUND")
      _gluecodium_inherit_property(${_target} ${_args_FOR_TARGET} ${_known_property})
    endif()
  endforeach()

  # Inherit lime and interface sources from original target
  _gluecodium_get_property_or_genex_if_genex_eval_supported(_lime_sources ${_args_FOR_TARGET}
                                                            GLUECODIUM_LIME_SOURCES)
  if(NOT _lime_sources STREQUAL "_lime_sources-NOTFOUND")
    set_property(TARGET ${_target} APPEND PROPERTY GLUECODIUM_LIME_SOURCES ${_lime_sources})
  endif()
  set(_sources_genex $<TARGET_PROPERTY:${_args_FOR_TARGET},SOURCES>)
  if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.15 AND NOT
                                                  GLUECODIUM_DONT_USE_FILTER_GENERATOR_EXPRESSION)
    set(_sources_genex $<FILTER:${_sources_genex},INCLUDE,.*\\.lime$>)
  endif()
  # For cmake < 3.15 $<FILTER:...> is not applied. This causes problem on Xcode 11.x, luckily Xcode
  # 11.x doesn't work with old cmake at all.
  target_sources(${_target} PUBLIC ${_sources_genex})
  _gluecodium_inherit_property(${_target} ${_args_FOR_TARGET} INTERFACE_SOURCES)

  gluecodium_read_required_properties(${_args_FOR_TARGET} SOURCE_SETS _source_sets
                                      GENERATORS _generators)

  if(NOT "COMMON" IN_LIST _source_sets)
    set(_main_only MAIN_ONLY)
  endif()

  # Temporary init GLUECODIUM_BASE_OUTPUT_DIR to be used in gluecodium_add_generate_command
  unset(_previous_output_dir)
  if(GLUECODIUM_BASE_STUBS_OUTPUT_DIR_DEFAULT)
    if(DEFINED GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT)
      set(_previous_output_dir ${GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT})
    endif()
    set(GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT "${GLUECODIUM_BASE_STUBS_OUTPUT_DIR_DEFAULT}")
  endif()

  set_target_properties(${_target} PROPERTIES GLUECODIUM_STUBS ON)

  gluecodium_add_generate_command(
    ${_target}
    ${_main_only}
    GENERATORS ${_generators}
    OUTPUT_DIR ${_args_OUTPUT_DIR})

  # Restore previous value of GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT.
  if(GLUECODIUM_BASE_STUBS_OUTPUT_DIR_DEFAULT)
    if(DEFINED _previous_output_dir)
      set(GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT "${_previous_output_dir}")
    else()
      unset(GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT)
    endif()
  endif()

  # Add custom target to generate sources
  _gluecodium_create_default_generated_target(${_target})
endfunction()

function(_gluecodium_get_property_or_genex_if_genex_eval_supported result _target property_name)
  if(CMAKE_VERSION GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
    set(_property_value "$<TARGET_PROPERTY:${_target},${property_name}>")
    _gluecodium_wrap_genex_eval_if_possible(_property_value ${_target})
    set(${result} "${_property_value}" PARENT_SCOPE)
    return()
  endif()

  get_target_property(_property_value ${_target} ${property_name})
  if(NOT _property_value STREQUAL "_property_value-NOTFOUND")
    set(${result} "${_property_value}" PARENT_SCOPE)
    return()
  endif()

  set(${result} "${result}-NOTFOUND" PARENT_SCOPE)
endfunction()

function(_gluecodium_inherit_property _target _target_src _property_name)
  _gluecodium_get_property_or_genex_if_genex_eval_supported(_property_src_value ${_target_src}
                                                            ${_property_name})
  if(NOT _property_src_value STREQUAL "_property_src_value-NOTFOUND")
    set_target_properties(${_target} PROPERTIES ${_property_name} "${_property_src_value}")
  endif()
endfunction()
