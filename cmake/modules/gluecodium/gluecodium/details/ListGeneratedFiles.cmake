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

include(${CMAKE_CURRENT_LIST_DIR}/CheckArguments.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/InitVariablesWithUnitedFilePaths.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ReadRequiredProperties.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ResolvePossibleAlias.cmake)

function(gluecodium_list_generated_files _target)
  set(_options MAIN COMMON)
  set(_single_value OUTPUT_ALL OUTPUT_CPP OUTPUT_SWIFT OUTPUT_BRIDGING_HEADERS)
  cmake_parse_arguments(_args "${_options}" "${_single_value}" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_list_generated_files)

  unset(_source_sets)
  if(_args_MAIN)
    list(APPEND _source_sets MAIN)
  endif()

  if(_args_COMMON)
    list(APPEND _source_sets COMMON)
  endif()

  gluecodium_read_required_properties(
    ${_target}
    SOURCE_SETS _source_sets_from_properties
    GENERATORS _generators
    OUTPUT_UNITY_DIR _unity_dir)

  if(NOT _source_sets)
    set(_source_sets ${_source_sets_from_properties})
  endif()

  gluecodium_resolve_possible_alias(_aliased_target ${_target})
  gluecodium_init_variables_with_united_file_paths(${_aliased_target})

  foreach(_source_set ${_source_sets})
    string(TOLOWER ${_source_set} _group)

    if(cpp IN_LIST _generators)
      list(APPEND _cpp_generated_files "${_unity_dir}/${GLUECODIUM_GENERATED_cpp_${_group}}")
    endif()

    if(android IN_LIST _generators)
      list(APPEND _android_generated_files "${_unity_dir}/${GLUECODIUM_GENERATED_jni_${_group}}")
    endif()

    get_property(_force_jni_from_java_generator TARGET ${_target} PROPERTY GLUECODIUM_FORCE_USAGE_OF_JNI_FROM_JAVA_GENERATOR)
    if(NOT _force_jni_from_java_generator AND (android-kotlin IN_LIST _generators))
      list(APPEND _android_kotlin_generated_files "${_unity_dir}/${GLUECODIUM_GENERATED_jni_kotlin_${_group}}")
    endif()

    if(swift IN_LIST _generators)
      list(APPEND _cbridge_generated_files
                  "${_unity_dir}/${GLUECODIUM_GENERATED_cbridge_${_group}}")
      list(APPEND _cbridge_headers_generated_files
                  "${_unity_dir}/${GLUECODIUM_GENERATED_cbridge_header_${_group}}")
      list(APPEND _swift_generated_files "${_unity_dir}/${GLUECODIUM_GENERATED_swift_${_group}}")
    endif()

    if(dart IN_LIST _generators)
      list(APPEND _dart_generated_files "${_unity_dir}/${GLUECODIUM_GENERATED_dart_${_group}}")
    endif()
  endforeach()

  if(_args_OUTPUT_ALL)
    set(${_args_OUTPUT_ALL}
        ${_cpp_generated_files} ${_android_generated_files} ${_cbridge_generated_files}
        ${_cbridge_headers_generated_files} ${_swift_generated_files} ${_dart_generated_files}
        ${_android_kotlin_generated_files}
        PARENT_SCOPE)
  endif()

  if(_args_OUTPUT_CPP)
    set(${_args_OUTPUT_CPP} ${_cpp_generated_files} ${_android_generated_files} ${_android_kotlin_generated_files}
                            ${_cbridge_generated_files} ${_dart_generated_files} PARENT_SCOPE)
  endif()

  if(_args_OUTPUT_SWIFT)
    set(${_args_OUTPUT_SWIFT} ${_swift_generated_files} PARENT_SCOPE)
  endif()

  if(_args_OUTPUT_BRIDGING_HEADERS)
    set(${_args_OUTPUT_BRIDGING_HEADERS} ${_cbridge_headers_generated_files} PARENT_SCOPE)
  endif()
endfunction()
