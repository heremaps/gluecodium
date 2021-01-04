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

if(DEFINED includeguard_gluecodium_TargetSources)
  return()
endif()
set(includeguard_gluecodium_TargetSources ON)

cmake_minimum_required(VERSION 3.5)

include(${CMAKE_CURRENT_LIST_DIR}/CheckArguments.cmake)

#[===========================================================================================[.rst:
Generated target_sources module
-------------------------------

This module attaches additional source files to the provided target.
These might differ depending on the previously used generator (cpp, android,
swift, etc.). This module depends on apigen_generate() to have been run on
the target first.
For Swift generator the target properties SWIFT_SOURCES and BRIDGING_HEADERS
will be set.

.. command:: apigen_target_sources

The general form of the command is::

    apigen_target_sources(<target> (MAIN) (COMMON))
       <target>      Target for which source was generated via `apigen_generate`
       SKIP_SWIFT    Do not add Swift files to the target directly. Instead the
                     target properties SWIFT_SOURCES and BRIDGING_HEADERS can be
                     used for custom compilation logic.
       MAIN          Add the MAIN generated source set, i.e. code generated for
                     the input Lime IDL files.
       COMMON        Add the common generated source set which is independent of
                     input Lime IDL files and can be shared between different
                     targets
    If neither MAIN nor COMMON are specified, both are added. Specifying a
    source set requires a separate common output directory to be set for
    `apigen_generate`.

#]===========================================================================================]

function(apigen_target_sources _target)
  set(options MAIN COMMON SKIP_SWIFT)
  cmake_parse_arguments(apigen_target_sources "${options}" "" "" ${ARGN})

  apigen_check_no_unparsed_arguments(apigen_target_sources apigen_target_sources)

  get_target_property(GENERATOR ${_target} APIGEN_GENERATOR)
  get_target_property(COMMON_OUTPUT_DIR ${_target} APIGEN_COMMON_OUTPUT_DIR)
  get_target_property(BUILD_OUTPUT_DIR ${_target} APIGEN_BUILD_OUTPUT_DIR)

  unset(_source_sets)
  if(NOT apigen_target_sources_MAIN AND NOT apigen_target_sources_COMMON)
    set(_source_sets MAIN)
    if(COMMON_OUTPUT_DIR)
      list(APPEND _source_sets COMMON)
    endif()
  endif()
  if(apigen_target_sources_MAIN)
    list(APPEND _source_sets MAIN)
  endif()
  if(apigen_target_sources_COMMON)
    if(NOT COMMON_OUTPUT_DIR)
      message(FATAL_ERROR "COMMON source set is specified, but apigen_target was "
                          "called without COMMON_OUTPUT_DIR argument. "
                          "Please specify this argument.")
    endif()
    list(APPEND _source_sets COMMON)
  endif()

  apigen_list_generated_sources(_generated_files
    ${_source_sets}
    TARGET ${_target}
    GENERATOR "${GENERATOR}"
    BUILD_OUTPUT_DIR "${BUILD_OUTPUT_DIR}")
  source_group("Generated Source Files" FILES ${_generated_files})

  if(NOT GENERATOR MATCHES swift)
    target_sources(${_target} PRIVATE ${_generated_files})
  else()
    apigen_set_generated_files(${_target})

    foreach(_upper_case_source_set ${_source_sets})
      string(TOLOWER ${_upper_case_source_set} _source_set)

      set (_generated_cpp_files
        ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_${_source_set}}
        ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cpp_${_source_set}})
      if(GENERATOR MATCHES dart)
          list(APPEND _generated_cpp_files ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_dart_${_source_set}})
      endif()

      # Generated files are marked as such by CMake, but this source file property is on directory scope.
      # This means for targets in other directories, CMake is not aware that the file is supposed to be
      # absent during configuration, see issue https://gitlab.kitware.com/cmake/cmake/issues/18399.
      # Work around this by marking it explicitly as generated and also create dummy files.
      # When creating these dummy files it is important that not all are already present while building,
      # otherwise CMake may decide to skip Gluecodium step completely. But this workaround is only
      # necessary for public/interface sources, so as long as there some private ones without dummy
      # file, everything is fine.
      set_property(SOURCE
            ${_generated_cpp_files}
            ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_${_source_set}}
          PROPERTY GENERATED YES)

      foreach(generated_file
          ${_generated_cpp_files}
          ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_${_source_set}}
          ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_${_source_set}})
        _apigen_create_generated_file_if_missing("${generated_file}")
      endforeach()

      # Swift code which is supposed to end up in one module cannot easily be split into multiple
      # compilation units. So instead just attach the Swift code as a property here.
      # Bridging headers need to be collected for all included compilation units and end up in the final
      # CBridge modulemap used for building.
      set_property(TARGET ${_target} APPEND PROPERTY SWIFT_SOURCES ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_${_source_set}})
      set_property(TARGET ${_target} APPEND PROPERTY BRIDGING_HEADERS ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_${_source_set}})
      if(NOT apigen_target_sources_SKIP_SWIFT)
        target_sources(${_target} PRIVATE ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_${_source_set}})
      endif()

      target_sources(${_target}
        PUBLIC
          ${BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_${_source_set}}
        PRIVATE
          ${_generated_cpp_files}
      )
    endforeach()
  endif()
endfunction()

function (_apigen_create_generated_file_if_missing generated_file)
  if(NOT EXISTS "${generated_file}")
    get_filename_component(directory "${generated_file}" DIRECTORY)
    file(MAKE_DIRECTORY "${directory}")
    file(WRITE "${generated_file}" "#error Dummy file to be replaced by Gluecodium during build, see also https://gitlab.kitware.com/cmake/cmake/issues/18399")

    execute_process(COMMAND touch -t 0001010101 "${generated_file}"
      RESULT_VARIABLE _touch_result)
    if (_touch_result)
      message (WARNING "Failed to run 'touch' utility. Gluecodium may work wrong")
    endif()
  endif()
endfunction ()
