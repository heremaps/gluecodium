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

if(DEFINED includeguard_gluecodium_swift_TargetSwiftSources)
  return()
endif()
set(includeguard_gluecodium_swift_TargetSwiftSources ON)

include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/CheckArguments.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetAddModuleModulemap.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetCollectSwiftSources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetCopySwiftSources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/details/SetFrameworkSwiftSources.cmake)

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

#[===================================================================================================[.rst:
Adds swift sources to a target.
-------------------------------

.. command:: gluecodium_target_swift_sources

When the function `gluecodium_target_generated_sources` is called then unlike C++ all
swift sources are stored in the property `GLUECODIUM_SWIFT`. Bridging headers are also
stored in the property `GLUECODIUM_BRIDGING_HEADERS`.
This function helps to manage those properties and adds swift files as sources to target.

The general form of the command is::

  gluecodium_target_swift_sources(
    <target>                          # The target to add sources to. If the target is a framework
                                      # or bundle then Swift sources are added as
                                      # $<TARGET_PROPERTY:GLUECODIUM_SWIFT> expression.
    [COLLECT_FROM_DEPENDENCIES]       # If this option is set then enumerates all statically
                                      # linked dependencies and links all swift sources and
                                      # bridging headers which are found in `GLUECODIUM_SWIFT`
                                      # and `GLUECODIUM_BRIDGING_HEADERS` properties. Check
                                      # also function `gluecodium_target_collect_swift_sources`.
                                      # This option works correctly only when full hierarchy of
                                      # dependent targets is built.
    [ADD_MODULE_MODULEMAP]            # If this option is set then generates module.modulemap
                                      # file and adds `-import-underlying-module` option if the
                                      # target is a framework. Check also function
                                      # `gluecodium_target_add_module_modulemap`.
    [COPY_FROM_TARGETS <target> ...]  # The list of target to copy properties `GLUECODIUM_SWIFT`
                                      # and `GLUECODIUM_BRIDGING_HEADERS` from.
    [SWIFT_FILES <swift_file> ... ]   # The list of additional swift sources to add to
                                      # `GLUECODIUM_SWIFT` property. Objective-C files are also
                                      # might be added here.
    [BRIDGING_HEADERS <header> ...]   # The list of additional bridging headers to add to
                                      # `GLUECODIUM_BRIDGING_HEADERS` property.
  )


#]===================================================================================================]

function(gluecodium_target_swift_sources _target)
  set(_options COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
  set(_multi_args COPY_FROM_TARGETS SWIFT_FILES BRIDGING_HEADERS)
  cmake_parse_arguments(_args "${_options}" "" "${_multi_args}" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_target_swift_sources)

  if(_args_COLLECT_FROM_DEPENDENCIES)
    gluecodium_target_collect_swift_sources(${_target})
  endif()

  foreach(_target_dependency IN LISTS _args_COPY_FROM_TARGETS)
    gluecodium_target_copy_swift_sources(${_target} ${_target_dependency})
  endforeach()

  if(_args_ADD_MODULE_MODULEMAP)
    gluecodium_target_add_module_modulemap(${_target} RESULT_DIR_VARIABLE _underlying_dir
                                           REMOVE_AFTER_BUILD)
    target_include_directories(${_target} PRIVATE ${_underlying_dir})
  endif()

  if(_args_SWIFT_FILES)
    set_property(TARGET ${_target} APPEND PROPERTY GLUECODIUM_SWIFT "${_args_SWIFT_FILES}")
  endif()

  if(_args_BRIDGING_HEADERS)
    set_property(TARGET ${_target} APPEND PROPERTY GLUECODIUM_BRIDGING_HEADERS
                                                   "${_args_BRIDGING_HEADERS}")
  endif()

  _gluecodium_set_framework_swift_sources(${_target})
endfunction()
