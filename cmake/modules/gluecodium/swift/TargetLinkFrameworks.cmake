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

if(DEFINED includeguard_gluecodium_swift_TargetLinkFrameworks)
  return()
endif()
set(includeguard_gluecodium_swift_TargetLinkFrameworks ON)

#[===================================================================================================[.rst:
Links frameworks with generated sources to a target.
----------------------------------------------------

.. command:: gluecodium_target_link_frameworks

Frameworks usually consist of shared library and Swift sources.
If a shared library might other use mechanisms which gluecodium-cmake provides
there is still necessary to process generated Swift code.

The general form of the command is::

  gluecodium_target_link_frameworks(
    <target>                        # The target to link frameworks to.
    [COMMON_FRAMEWORK <framework>]  # The framework which contains `COMMON` code. Targets of
                                    # this framework are enumerated to find the target whicn
                                    # contains `COMMON` source set. The rest is processed as if
                                    # this target is passed to this function with `COMMON_TARGET`
                                    # parameter.
    [COMMON_TARGET <target>]        # The target with `COMMON` source code. It's `COMMON` Swift
                                    # files are added to the target.
    [FRAMEWORKS <framework> ...]    # The list of frameworks which the target depends on (in
                                    # terms of generated code). This list is added to generated
                                    # Swift code as sequence of imports. Frameworks and paths to
                                    # frameworks locations are added as compilation options to
                                    # target via `XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS` property.
  )

Note:
If framework which contains `COMMON` code should also be linked to the target it must be listed
in `FRAMEWORKS` option as well.


#]===================================================================================================]

include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/ListGeneratedFiles.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/ReadRequiredProperties.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/ResolvePossibleAlias.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/GeneratorExpressions.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/GetLinkedTargetsWithGeneratedSources.cmake)

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

function(gluecodium_target_link_frameworks _target)

  set(_single_args COMMON_FRAMEWORK COMMON_TARGET)
  set(_multi_args FRAMEWORKS)
  cmake_parse_arguments(_args "" "${_single_args}" "${_multi_args}" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_target_link_common_framework)

  foreach(_framework IN LISTS _args_FRAMEWORKS)
    _gluecodium_target_link_framework(${_target} ${_framework})
  endforeach()

  if(NOT _args_COMMON_TARGET AND _args_COMMON_FRAMEWORK)
    _gluecodium_find_common_target_in_framework(_args_COMMON_TARGET ${_args_COMMON_FRAMEWORK})
  endif()

  if(_args_COMMON_TARGET)
    _gluecodium_target_link_common_target(${_target} ${_args_COMMON_TARGET})
  endif()

endfunction()

function(_gluecodium_target_link_framework target_dst target_framework)
  gluecodium_get_linked_targets_with_generated_sources(_targets_with_generated_sources
                                                       ${target_dst} ONLY_STATIC)

  gluecodium_resolve_possible_alias(target_framework_aliased ${target_framework})
  if(CMAKE_VERSION GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
    _gluecodium_get_framework_name_expression(_framework_name ${target_framework_aliased})
  else()
    get_target_property(_framework_name ${target_framework} OUTPUT_NAME)
    if(NOT _framework_name)
      string(MAKE_C_IDENTIFIER "${target_framework_aliased}" _framework_name)
    endif()
  endif()

  foreach(_target_with_generated_sources IN LISTS _targets_with_generated_sources)
    gluecodium_resolve_possible_alias(_target_with_generated_source_aliased
                                      ${_target_with_generated_sources})
    set_property(TARGET ${_target_with_generated_source_aliased} APPEND
                 PROPERTY GLUECODIUM_IMPORT_FRAMEWORKS ${_framework_name})
  endforeach()

  set(framework_dir $<TARGET_BUNDLE_DIR:${target_framework}>/..)

  target_link_libraries(${target_dst} PRIVATE ${target_framework})
  # TODO: Check if directory specified with -F already exists or use $<REMOVE_DUPLICATES:...>
  set_property(
    TARGET ${target_dst} APPEND_STRING
    PROPERTY XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS " -framework ${_framework_name} -F${framework_dir} ")
endfunction()

function(_gluecodium_find_common_target_in_framework result target_framework)
  gluecodium_get_linked_targets_with_generated_sources(_targets_with_generated_sources
                                                       ${target_framework} ONLY_STATIC)

  unset(_common_target)
  foreach(_target_with_generated_sources ${_targets_with_generated_sources})
    gluecodium_read_required_properties(${_target_with_generated_sources} SOURCE_SETS _sourse_sets)
    if(COMMON IN_LIST _sourse_sets)
      set(_common_target ${_target_with_generated_sources})
    endif()
  endforeach()

  if(NOT _common_target)
    message(
      FATAL_ERROR
        "Failed to detect a target with COMMON generated sources in the framework ${target_common_framework}."
        "Please specify such target with COMMON_TARGET option.")
  endif()
  set(${result} ${_common_target} PARENT_SCOPE)
endfunction()

function(_gluecodium_target_link_common_target target_dst common_target)
  gluecodium_list_generated_files(
    ${common_target}
    COMMON
    OUTPUT_SWIFT _common_swift
    OUTPUT_BRIDGING_HEADERS _common_bridging_headers)

  _gluecodium_is_framework_expression(_is_framework_expression ${target_dst})

  gluecodium_resolve_possible_alias(target_dst_aliased ${target_dst})

  target_sources(${target_dst_aliased} PRIVATE "$<${_is_framework_expression}:${_common_swift}>")

  set_property(TARGET ${target_dst_aliased} APPEND PROPERTY GLUECODIUM_BRIDGING_HEADERS
                                                            ${_common_bridging_headers})

  set_property(TARGET ${target_dst_aliased} APPEND PROPERTY GLUECODIUM_SWIFT ${_common_swift})
endfunction()
