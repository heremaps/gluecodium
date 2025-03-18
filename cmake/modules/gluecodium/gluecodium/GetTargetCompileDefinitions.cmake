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

if(DEFINED includeguard_gluecodium_GetTargetCompileDefinitions)
  return()
endif()
set(includeguard_gluecodium_GetTargetCompileDefinitions ON)

include(${CMAKE_CURRENT_LIST_DIR}/details/CheckArguments.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/details/GeneratorExpressions.cmake)

#[===================================================================================================[.rst:
Returns private and public compile definitions for target as if it's shared library.
------------------------------------------------------------------------------------

.. command:: gluecodium_get_target_compile_definitions

Gluecodium generates export macros and necessary compilation definitions are added
with the `gluecodium_target_compile_definitions` function if a target is `SHARED` library.
In other cases it's necessary to retrieve such macros with this function and add them manually.
See example 2 for `gluecodium_generate` function.
This function takes into account source set (`COMMON`/`MAIN`) and target properties
`GLUECODIUM_CPP_EXPORT_MACRO_NAME` and `GLUECODIUM_CPP_EXPORT_MACRO_NAME`.

The general form of the command is::

  gluecodium_get_target_compile_definitions(
    <target>                    # The target to get compile definitions for.
    [RESULT_PUBLIC <variable>]  # The name of variable to store public compile definitions
    [RESULT_PRIVATE <variable>] # The name of variable to store private compile definitions.
    )

#]===================================================================================================]

# Make a generator expression which should check state of property
# GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS on the given target.
# Definition `-DGLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS` should be added to the target in the following cases:
# - Target property `GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS` is set to ON
# - Target property `GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS` is not set and build is debug.
# - Target property `GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS` is not set, but
#   `GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS_DEFAULT` is set to ON before calling to `gluecodium_add_generate_command`.
#
# Note: the last condition implicitly works and doesn't require additional generator expression statements.
function(_gluecodium_enable_internal_debug_check_genex result _target)
  set(_read_property "$<TARGET_PROPERTY:${_target},GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS>")
  set(_debug_and_property_not_exists "$<AND:$<CONFIG:Debug>,$<STREQUAL:${_read_property},>>")
  set(_debug_and_property_not_exists_or_value "$<OR:${_debug_and_property_not_exists},$<BOOL:${_read_property}>>")
  set(${result} ${_debug_and_property_not_exists_or_value} PARENT_SCOPE)
endfunction()


function(gluecodium_get_target_compile_definitions _target)
  set(_single_args RESULT_PUBLIC RESULT_PRIVATE)
  cmake_parse_arguments(_args "" "${_single_args}" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_get_target_compile_definitions)

  gluecodium_read_required_properties(${_target} SOURCE_SETS _source_sets GENERATORS _generators)

  if(cpp IN_LIST _generators)
    unset(_public)
    unset(_private)
    _gluecodium_use_property_or_default_expression(
      _common ${_target} "GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME" "_GLUECODIUM_CPP")
    _gluecodium_use_property_or_default_expression(
      _main ${_target} "GLUECODIUM_CPP_EXPORT_MACRO_NAME" "_GLUECODIUM_CPP")

    if("MAIN" IN_LIST _source_sets)
      list(APPEND _public ${_main}_SHARED)
      list(APPEND _private ${_main}_INTERNAL)
    endif()

    if("COMMON" IN_LIST _source_sets)
      set(_sync_cache_property "$<TARGET_PROPERTY:${_target},GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE>")
      _gluecodium_enable_internal_debug_check_genex(_enable_internal_debug_check ${_target})
      list(APPEND _public $<$<NOT:$<STREQUAL:${_common},${_main}>>:${_common}_SHARED>)
      list(APPEND _private $<$<NOT:$<STREQUAL:${_common},${_main}>>:${_common}_INTERNAL>
                           $<$<BOOL:${_sync_cache_property}>:GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE>
                           $<${_enable_internal_debug_check}:GLUECODIUM_ENABLE_INTERNAL_DEBUG_CHECKS>)
    endif()

    if(_args_RESULT_PUBLIC)
      set(${_args_RESULT_PUBLIC} ${_public} PARENT_SCOPE)
    endif()

    if(_args_RESULT_PRIVATE)
      set(${_args_RESULT_PRIVATE} ${_private} PARENT_SCOPE)
    endif()
  endif()
endfunction()
