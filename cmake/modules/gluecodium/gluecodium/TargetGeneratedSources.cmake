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

if(DEFINED includeguard_gluecodium_TargetGeneratedSources)
  return()
endif()
set(includeguard_gluecodium_TargetGeneratedSources ON)

include(${CMAKE_CURRENT_LIST_DIR}/details/ListGeneratedFiles.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/details/GeneratorExpressions.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/../swift/TargetAddModuleModulemap.cmake)

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

#[===================================================================================================[.rst:
Adds generated sources to a target.
-----------------------------------

.. command:: gluecodium_target_generated_sources

Adds generated sources to target depending on `GLUECODIUM_GENERATORS`,
`GLUECODIUM_OUTPUT_DIR` and `GLUECODIUM_SOURCE_SETS` target properties.
This function must be called only after `gluecodium_add_generate_command` is called.

The general form of the command is::

  gluecodium_target_generated_sources(
    <target>  # The target add generated sources.
    )

#]===================================================================================================]

function(gluecodium_target_generated_sources _target)
  gluecodium_list_generated_files(
    ${_target}
    OUTPUT_CPP _generated_cpp
    OUTPUT_SWIFT _generated_swift
    OUTPUT_BRIDGING_HEADERS _generated_bridging_headers)
  if(_generated_cpp)
    get_target_property(_target_type ${_target} TYPE)
    if(_target_type STREQUAL "INTERFACE_LIBRARY")
      target_sources(${_target} PUBLIC ${_generated_cpp})
    else()
      target_sources(${_target} PRIVATE ${_generated_cpp})
    endif()
  endif()

  gluecodium_read_required_properties(${_target} OUTPUT_DIR _output_dir GENERATORS _generators)

  if(swift IN_LIST _generators)
    get_target_property(_type ${_target} TYPE)

    _gluecodium_is_framework_expression(_is_framework_expression ${_target})

    if(_generated_swift)
      set_property(TARGET ${_target} APPEND PROPERTY GLUECODIUM_SWIFT ${_generated_swift})
    endif()

    set(_swift_property "$<TARGET_PROPERTY:${_target},GLUECODIUM_SWIFT>")
    if(_type STREQUAL "EXECUTABLE")
      target_sources(${_target} PRIVATE "${_swift_property}")
    else()
      target_sources(${_target} PRIVATE "$<${_is_framework_expression}:${_swift_property}>")
    endif()

    if(_generated_bridging_headers)
      set_property(TARGET ${_target} APPEND PROPERTY GLUECODIUM_BRIDGING_HEADERS
                                                     ${_generated_bridging_headers})
    endif()

    if((_type STREQUAL "SHARED_LIBRARY") OR (_type STREQUAL "STATIC_LIBRARY") OR (_type STREQUAL
                                                                                  "EXECUTABLE"))
      gluecodium_target_add_module_modulemap(
        ${_target}
        OUTPUT_DIR "${_output_dir}"
        RESULT_DIR_VARIABLE _underlying_dir
        REMOVE_AFTER_BUILD)
      target_include_directories(${_target} PRIVATE ${_underlying_dir})
    endif()

    # TODO: Check CMake < 3.20.0
    foreach(generated_file ${_generated_swift})
      _gluecodium_create_generated_file_if_missing("${generated_file}")
    endforeach()

  endif()
endfunction()

function(_gluecodium_create_generated_file_if_missing generated_file)
  if(NOT EXISTS "${generated_file}")
    get_filename_component(_directory "${generated_file}" DIRECTORY)
    file(MAKE_DIRECTORY "${_directory}")
    file(
      WRITE "${generated_file}"
      "#error Dummy file to be replaced by Gluecodium during build, see also https://gitlab.kitware.com/cmake/cmake/issues/18399"
    )

    execute_process(COMMAND touch -t 0001010101 "${generated_file}" RESULT_VARIABLE _touch_result)
    if(_touch_result)
      message(WARNING "Failed to run 'touch' utility. Gluecodium may work wrong")
    endif()
  endif()
endfunction()
