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

if(DEFINED includeguard_gluecodium_generatedSources)
  return()
endif()
set(includeguard_gluecodium_generatedSources ON)

set(GLUECODIUM_SUPPORTED_GENERATORS cpp android swift dart)

include(${CMAKE_CURRENT_LIST_DIR}/../../gluecodium/details/InitVariablesWithUnitedFilePaths.cmake)

function(apigen_list_generated_sources _sources_list_output)
  set(options MAIN COMMON)
  set(oneValueArgs TARGET GENERATOR BUILD_OUTPUT_DIR)
  set(multiValueArgs)
  cmake_parse_arguments(apigen_list_generated_sources "${options}" "${oneValueArgs}"
                        "${multiValueArgs}" ${ARGN})

  gluecodium_init_variables_with_united_file_paths(${apigen_list_generated_sources_TARGET})

  string(REPLACE "," ";" _generators ${apigen_list_generated_sources_GENERATOR})
  foreach(_generator ${_generators})
    if(NOT _generator IN_LIST GLUECODIUM_SUPPORTED_GENERATORS)
      message(
        FATAL_ERROR
          "Generator ${_generator} is not in list of supported generators: ${GLUECODIUM_SUPPORTED_GENERATORS}"
      )
    endif()
  endforeach()

  if(NOT apigen_list_generated_sources_MAIN AND NOT apigen_list_generated_sources_COMMON)
    message(FATAL_ERROR "No source set was specified")
  endif()

  unset(_source_groups)
  if(apigen_list_generated_sources_MAIN)
    list(APPEND _source_groups main)
  endif()
  if(apigen_list_generated_sources_COMMON)
    list(APPEND _source_groups common)
  endif()

  unset(_generated_files)
  foreach(_group ${_source_groups})
    list(
      APPEND
        _generated_files
        "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_cpp_${_group}}")
    if(apigen_list_generated_sources_GENERATOR MATCHES android)
      list(
        APPEND
          _generated_files
          "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_jni_${_group}}")
    elseif(apigen_list_generated_sources_GENERATOR MATCHES swift)
      list(
        APPEND
          _generated_files
          "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_cbridge_${_group}}"
      )
      list(
        APPEND
          _generated_files
          "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_cbridge_header_${_group}}"
      )
      list(
        APPEND
          _generated_files
          "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_swift_${_group}}"
      )
    endif()
    # Support Android+Dart and Swift+Dart fused builds
    if(apigen_list_generated_sources_GENERATOR MATCHES dart)
      list(
        APPEND
          _generated_files
          "${apigen_list_generated_sources_BUILD_OUTPUT_DIR}/${GLUECODIUM_GENERATED_dart_${_group}}"
      )
    endif()
  endforeach()

  set(${_sources_list_output} ${_generated_files} PARENT_SCOPE)
endfunction()
