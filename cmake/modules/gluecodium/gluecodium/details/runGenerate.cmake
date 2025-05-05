#!/usr/bin/env cmake -P
# Copyright (C) 2020 HERE Europe B.V.
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

if(NOT GLUECODIUM_CONFIGURATION_FILE)
  message(FATAL_ERROR "GLUECODIUM_CONFIGURATION_FILE must be specified")
endif()

include(${GLUECODIUM_CONFIGURATION_FILE})

set(_required_vars
    GLUECODIUM_GENERATORS GLUECODIUM_OUTPUT_DIR GLUECODIUM_DETAILS_DIR GLUECODIUM_TARGET_SOURCE_DIR
    GLUECODIUM_TARGET_BINARY_DIR GLUECODIUM_OPTIONS_FILE GLUECODIUM_PLACEHOLDERS_FILE)

foreach(_var ${_required_vars})
  if(NOT ${_var})
    message(FATAL_ERROR "${_var} must be specified in config file ${GLUECODIUM_CONFIGURATION_FILE}")
  endif()
endforeach()

foreach(_var GLUECODIUM_TARGET_SOURCE_DIR GLUECODIUM_TARGET_BINARY_DIR)
  if(NOT IS_ABSOLUTE "${${_var}}")
    message(FATAL_ERROR "${_var} is expected to be absolute, but it's not")
  endif()
endforeach()

if(NOT GLUECODIUM_LIME_SOURCES)
  message(
    FATAL_ERROR
      "LIME_SOURCES must be specified with gluecodium_generate or "
      "gluecodium_add_generate_command for target ${GLUECODIUM_TARGET_NAME}. "
      "Also GLUECODIUM_LIME_SOURCES property might be specified instead.")
endif()

if(NOT GLUECODIUM_VERSION)
  set(GLUECODIUM_VERSION +)
endif()

include(${GLUECODIUM_DETAILS_DIR}/Gradle.cmake)
include(${GLUECODIUM_DETAILS_DIR}/GradleSync.cmake)
include(${GLUECODIUM_DETAILS_DIR}/StringJoin.cmake)
include(${GLUECODIUM_DETAILS_DIR}/InitVariablesWithUnitedFilePaths.cmake)
include(${GLUECODIUM_DETAILS_DIR}/GetOutputDirs.cmake)

gluecodium_get_output_dirs(
  "${GLUECODIUM_OUTPUT_DIR}" "${GLUECODIUM_TARGET_BINARY_DIR}" GLUECODIUM_OUTPUT_MAIN
  GLUECODIUM_OUTPUT_COMMON GLUECODIUM_OUTPUT_UNITY GLUECODIUM_OUTPUT_BUILD)

function(_print_status)
  if(GLUECODIUM_VERBOSE)
    message(${ARGN})
  endif()
endfunction()

function(_get_absolute_path_to_sources result input_path)
  if(IS_ABSOLUTE "${input_path}")
    set(${result} "${input_path}" PARENT_SCOPE)
  else()
    set(${result} "${GLUECODIUM_TARGET_SOURCE_DIR}/${input_path}" PARENT_SCOPE)
  endif()
endfunction()

function(_generate_file_with_placeholders result_path)
  unset (_new_content)
  foreach(_file_path IN LISTS GLUECODIUM_DOCS_PLACEHOLDERS_FILES)
    _get_absolute_path_to_sources(_absolute_file_pat "${_file_path}")
    file(READ "${_absolute_file_pat}" _file_content)
    string(APPEND _new_content "# Content of ${_absolute_file_pat}\n${_file_content}\n")
  endforeach()

  if (GLUECODIUM_DOCS_PLACEHOLDERS)
    string(APPEND _new_content "# Separatelly specified placeholders\n")
  endif ()

  foreach(_placeholder IN LISTS GLUECODIUM_DOCS_PLACEHOLDERS)
    string(APPEND _new_content "${_placeholder}\n")
  endforeach()

  if(NOT EXISTS "${result_path}")
    file(WRITE "${result_path}" "${_new_content}\n")
  else()
    file(READ "${result_path}" _old_content)
    if(NOT _old_content STREQUAL _new_content)
      file(WRITE "${result_path}" "${_new_content}\n")
    endif()
  endif()
endfunction()

function(_prepare_gluecodium_config_file file_path placeholder_file)
  unset(_gluecodium_options)

  macro(_append_option option_name variable_name)
    if(${variable_name})
      string(APPEND _gluecodium_options "${option_name}=${${variable_name}}\n")
    endif()
  endmacro()

  macro(_append_path_option option_name variable_name)
    if(${variable_name})
      _get_absolute_path_to_sources(_absolute_path "${${variable_name}}")
      string(APPEND _gluecodium_options "${option_name}=${_absolute_path}\n")
    endif()
  endmacro()

  macro(_append_list_option option_name variable_name)
    if(${variable_name})
      string_join("," _option_list ${${variable_name}})
      string(APPEND _gluecodium_options "${option_name}=${_option_list}\n")
    endif()
  endmacro()

  macro(_append_list_paths_option option_name variable_name)
    if(${variable_name})
      unset(_absolute_paths)
      foreach(_path ${${variable_name}})
        _get_absolute_path_to_sources(_absolute_path "${_path}")
        list(APPEND _absolute_paths "${_absolute_path}")
      endforeach()
      string_join("," _option_list ${_absolute_paths})
      string(APPEND _gluecodium_options "${option_name}=${_option_list}\n")
    endif()
  endmacro()

  # Note: While previos check if CMake variable exists this macro processes value itself
  macro(_append_boolean_value option_name option_value)
    if(${option_value})
      set(_boolean_value "true")
    else()
      set(_boolean_value "false")
    endif()
    string(APPEND _gluecodium_options "${option_name}=${_boolean_value}\n")
  endmacro()

  # TODO: Isn't it obsolete parameter?
  _append_boolean_value(cache ON)
  _append_boolean_value(validate "${GLUECODIUM_VALIDATE_ONLY}")
  _append_boolean_value(swiftexpose "${GLUECODIUM_SWIFT_EXPOSE_INTERNALS}")
  _append_boolean_value(strict "${GLUECODIUM_STRICT_VALIDATION}")
  _append_boolean_value(dartdisablefinalizablemarker "${GLUECODIUM_DART_DISABLE_FINALIZABLE_MARKER}")
  _append_boolean_value(enableandroidattributesmismatchwarning "${GLUECODIUM_ENABLE_ANDROID_ATTRIBUTES_MISMATCH_WARNING}")

  _append_list_option(generators GLUECODIUM_GENERATORS)
  _append_list_option(werror GLUECODIUM_WERROR)
  _append_list_option(tag GLUECODIUM_TAGS)

  if(GLUECODIUM_LIME_SOURCES_REQUIRE_FILTER)
    list(FILTER GLUECODIUM_LIME_SOURCES INCLUDE REGEX ".*\\.lime$")
    list(FILTER GLUECODIUM_LIME_SOURCES_AUX INCLUDE REGEX ".*\\.lime$")
    list(REMOVE_DUPLICATES GLUECODIUM_LIME_SOURCES)
    list(REMOVE_DUPLICATES GLUECODIUM_LIME_SOURCES_AUX)
  endif()

  _append_list_paths_option(input GLUECODIUM_LIME_SOURCES)
  _append_list_paths_option(auxinput GLUECODIUM_LIME_SOURCES_AUX)

  _append_option(kotlinpackage GLUECODIUM_KOTLIN_PACKAGE)
  _append_option(kotlinintpackage GLUECODIUM_KOTLIN_INTERNAL_PACKAGE)
  _append_option(javapackage GLUECODIUM_JAVA_PACKAGE)
  _append_option(intpackage GLUECODIUM_JAVA_INTERNAL_PACKAGE)
  _append_option(javanonnullannotation GLUECODIUM_JAVA_NONNULL_ANNOTATION)
  _append_option(javanullableannotation GLUECODIUM_JAVA_NULLABLE_ANNOTATION)
  _append_option(libraryname GLUECODIUM_DART_LIBRARY_NAME)
  _append_option(dartlookuperrormessage GLUECODIUM_DART_FUNCTION_LOOKUP_ERROR_MESSAGE)
  _append_option(internalprefix GLUECODIUM_INTERNAL_PREFIX)
  _append_option(cppexport GLUECODIUM_CPP_EXPORT_MACRO_NAME)
  _append_option(cppexportcommon GLUECODIUM_CPP_EXPORT_COMMON_MACRO_NAME)

  _append_path_option(copyright GLUECODIUM_COPYRIGHT_HEADER)
  _append_path_option(cppnamerules GLUECODIUM_CPP_NAMERULES)
  _append_path_option(javanamerules GLUECODIUM_JAVA_NAMERULES)
  _append_path_option(kotlinnamerules GLUECODIUM_KOTLIN_NAMERULES)
  _append_path_option(swiftnamerules GLUECODIUM_SWIFT_NAMERULES)
  _append_path_option(dartnamerules GLUECODIUM_DART_NAMERULES)
  _append_path_option(docsplaceholderslist placeholder_file)
  _append_path_option(docsvalidationrules GLUECODIUM_DOCS_VALIDATION_RULES)

  _append_option(output GLUECODIUM_OUTPUT_MAIN)
  _append_option(commonoutput GLUECODIUM_OUTPUT_COMMON)

  if(GLUECODIUM_CPP_NAMESPACE)
    string(REPLACE "::" "." _cpp_namespace "${GLUECODIUM_CPP_NAMESPACE}")
    _append_option(cppnamespace _cpp_namespace)
  endif()
  if(GLUECODIUM_CPP_INTERNAL_NAMESPACE)
    string(REPLACE "::" "." _internal_cpp_namespace "${GLUECODIUM_CPP_INTERNAL_NAMESPACE}")
  else()
    set(_internal_cpp_namespace "gluecodium")
  endif()
  _append_option(intnamespace _internal_cpp_namespace)

  file(WRITE "${file_path}" "${_gluecodium_options}")
endfunction()

function(_generate)
  if(DEFINED ENV{GLUECODIUM_PATH})
    _print_status("Using local Gluecodium from $ENV{GLUECODIUM_PATH}")
    set(_build_local_gluecodium --include-build $ENV{GLUECODIUM_PATH})
  else()
    unset(_build_local_gluecodium)
  endif()

  if(DEFINED ENV{GLUECODIUM_TIME_LOGGING})
    set(_gluecodium_time time -o "${APIGEN_BUILD_OUTPUT_DIR}/gluecodium-time.log")
  else()
    unset(_gluecodium_time)
  endif()

  _print_status("Gluecodium version: ${GLUECODIUM_VERSION}\n")

  file(READ "${GLUECODIUM_OPTIONS_FILE}" _options_content)
  _print_status(
    "Gluecodium options (stored in file ${GLUECODIUM_OPTIONS_FILE}):\n${_options_content}\n")

  # All options are listed in file, gluecodium needs only path to this file
  set(_gluecodium_options "-options \"${GLUECODIUM_OPTIONS_FILE}\"")

  if(WIN32)
    set(_no_daemon --no-daemon)
  endif()

  set(_gluecodium_command
      ${_gluecodium_time}
      ${GLUECODIUM_GRADLE_WRAPPER}
      ${_build_local_gluecodium}
      ${_no_daemon}
      -Pversion=${GLUECODIUM_VERSION}
      run
      --args=${_gluecodium_options})

  if(NOT GLUECODIUM_VERBOSE)
    set(_redirect_output OUTPUT_VARIABLE _generate_output ERROR_VARIABLE _generate_output)
  endif()

  file(REMOVE_RECURSE ${GLUECODIUM_OUTPUT_MAIN})
  file(REMOVE_RECURSE ${GLUECODIUM_OUTPUT_COMMON})

  if(JAVA_HOME)
    set(ENV{JAVA_HOME} "${JAVA_HOME}")
  endif()

  # Create output directories first, otherwise java.io.File won't have permissions to create files
  # at configure time. Those directories are not created with file(MAKE_DIRECTORY ...) because
  # gradle hangs by some reason at exit when it is ran from Xcode. TODO: Find the reason of hanging.
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E make_directory ${GLUECODIUM_OUTPUT_MAIN}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${GLUECODIUM_OUTPUT_COMMON}
    COMMAND ${_gluecodium_command}
    WORKING_DIRECTORY ${GLUECODIUM_DETAILS_DIR}
    RESULT_VARIABLE _generate_result ${_redirect_output})

  if(_generate_result)
    message(FATAL_ERROR "${_generate_output}\nFailed to generate from given LimeIDL files")
  endif()

  # Remove directory with common generated code if it's not in source sets to avoid confusing
  if(NOT "COMMON" IN_LIST GLUECODIUM_SOURCE_SETS)
    file(REMOVE_RECURSE ${GLUECODIUM_OUTPUT_COMMON})
  endif()
endfunction()

function(_collect_all_files_in_single_compilation_units)
  if(cpp IN_LIST GLUECODIUM_GENERATORS)
    _include_all(cpp "cpp/*.cpp")
  endif()

  if(android IN_LIST GLUECODIUM_GENERATORS)
    # Include all conversion headers first, so all later generic conversions relying on
    # specialization have all these defined
    _include_all(jni "android/jni/*_Conversion.h" "android/jni/*.cpp")
  endif()

  if(android-kotlin IN_LIST GLUECODIUM_GENERATORS)
      # Include all conversion headers first, so all later generic conversions relying on
      # specialization have all these defined
      _include_all(jni_kotlin "android-kotlin/jni/*_Conversion.h" "android-kotlin/jni/*.cpp")
  endif()

  if(swift IN_LIST GLUECODIUM_GENERATORS)
    _include_all(cbridge "cbridge/*.cpp")
    # Collect all includes to be used in the modulemap
    _include_all(cbridge_header "cbridge/*.h")
    _concatenate_swift_files()
  endif()

  if(dart IN_LIST GLUECODIUM_GENERATORS)
    _include_all(dart "dart/ffi/*.cpp")
  endif()
endfunction()

function(_concatenate_swift_files)
  gluecodium_init_variables_with_united_file_paths(${GLUECODIUM_TARGET_NAME})

  list(REMOVE_DUPLICATES GLUECODIUM_IMPORT_FRAMEWORKS)
  foreach(_import_framework IN LISTS GLUECODIUM_IMPORT_FRAMEWORKS)
    string(TOUPPER "${_import_framework}" _framework_name_upper)

    string(APPEND _swift_source_header_main "#if !DONT_IMPORT_${_framework_name_upper}\n")
    string(APPEND _swift_source_header_main "import ${_import_framework}\n")
    string(APPEND _swift_source_header_main "#endif\n")
  endforeach()

  foreach(_source_set ${GLUECODIUM_SOURCE_SETS})
    string(TOLOWER "${_source_set}" _source_set_lower)

    file(WRITE "${GLUECODIUM_OUTPUT_UNITY}/${GLUECODIUM_GENERATED_swift_${_source_set_lower}}"
         "${_swift_source_header_${_source_set_lower}}")

    file(GLOB_RECURSE _swift_srcs RELATIVE "${GLUECODIUM_OUTPUT_${_source_set}}"
         "${GLUECODIUM_OUTPUT_${_source_set}}/swift/*.swift")
    foreach(_file ${_swift_srcs})
      file(READ "${GLUECODIUM_OUTPUT_${_source_set}}/${_file}" _content)
      file(APPEND "${GLUECODIUM_OUTPUT_UNITY}/${GLUECODIUM_GENERATED_swift_${_source_set_lower}}"
           "/////\n// ${_file}\n${_content}")
    endforeach()
  endforeach()
endfunction()

function(_include_all generated_type)
  gluecodium_init_variables_with_united_file_paths(${GLUECODIUM_TARGET_NAME})

  foreach(_source_set ${GLUECODIUM_SOURCE_SETS})
    unset(_files_to_include)

    foreach(_glob IN LISTS ARGN)
      file(GLOB_RECURSE _files "${GLUECODIUM_OUTPUT_${_source_set}}/${_glob}")
      list(APPEND _files_to_include ${_files})
    endforeach()

    string(TOLOWER "${_source_set}" _source_set_lower)
    list(REMOVE_DUPLICATES _files_to_include)
    unset(_includes_content)
    foreach(_file IN LISTS _files_to_include)
      string(APPEND _includes_content "#include \"${_file}\"\n")
    endforeach()
    file(WRITE
         "${GLUECODIUM_OUTPUT_UNITY}/${GLUECODIUM_GENERATED_${generated_type}_${_source_set_lower}}"
         "${_includes_content}")
  endforeach()
endfunction()

function(_main)
  unset (_placeholders_file_path)
  if (GLUECODIUM_DOCS_PLACEHOLDERS_FILES OR GLUECODIUM_DOCS_PLACEHOLDERS)
    _generate_file_with_placeholders("${GLUECODIUM_PLACEHOLDERS_FILE}")
    set (_placeholders_file_path "${GLUECODIUM_PLACEHOLDERS_FILE}")
  elseif(NOT EXISTS "${GLUECODIUM_PLACEHOLDERS_FILE}")
    file (TOUCH "${GLUECODIUM_PLACEHOLDERS_FILE}")
  endif()

  if("${GLUECODIUM_CONFIGURATION_FILE}" IS_NEWER_THAN "${GLUECODIUM_OPTIONS_FILE}")
    _prepare_gluecodium_config_file("${GLUECODIUM_OPTIONS_FILE}" "${_placeholders_file_path}")
  endif()

  _generate()
  _collect_all_files_in_single_compilation_units()
endfunction()

_main()
