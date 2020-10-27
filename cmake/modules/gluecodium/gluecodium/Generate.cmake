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

if(DEFINED includeguard_gluecodium_Generate)
  return()
endif()
set(includeguard_gluecodium_Generate ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Code generation module
# ----------------------
#
# This module provides functions to generate API interfaces specified
# in the LimeIDL language into target source code as provided by the
# specified generator(s). Valid generators are:
#
#  * android
#  * cbridge
#  * cpp
#  * swift
#
# .. command:: apigen_generate
#
# The general form of the command is::
#
#   apigen_generate(target inputDir generator)
#
# This function invokes the Gluecodium tool based on a set of of input *.lime
# files with a specific target language generator.
# Additional target ${TARGET}.gluecodium.generate is created to make it possible to
# generate sources without building whole solution.
#
# Following properties will be set for given `target` based on the corresponding option without
# APIGEN_ prefix:
#  * APIGEN_GENERATOR The generator passed.
#  * APIGEN_OUTPUT_DIR Output dir for the main source set, generators will create subdirectories.
#        The main code set generated here is the generated code which depends on input IDL files.
#  * APIGEN_COMMON_OUTPUT_DIR Output dir for the common source set, generators will create
#        subdirectories. The common source set is independent of input IDL files, only depends on
#        options like JAVA_PACKAGE, CPP_INTERNAL_NAMESPACE etc. and can be shared between multiple
#        targets which use the same settings.
#        The output directories can be nested inside another.
#  * APIGEN_BUILD_OUTPUT_DIR Build artifacts created by custom build steps
#        will end up in this directory. This should not be placed in the source output dir since
#        since the generated file cache will delete these build results otherwise.
#

if(COMMAND find_host_package)
  find_host_package(JAVA COMPONENTS Runtime REQUIRED)
else()
  find_package(Java COMPONENTS Runtime REQUIRED)
endif()

set(APIGEN_GLUECODIUM_DIR ${CMAKE_CURRENT_LIST_DIR})

include(${APIGEN_GLUECODIUM_DIR}/GeneratedSources.cmake)

function(apigen_generate)
  set(options VALIDATE_ONLY VERBOSE STUBS)
  set(oneValueArgs TARGET GENERATOR VERSION
      ANDROID_MERGE_MANIFEST
      JAVA_PACKAGE
      JAVA_INTERNAL_PACKAGE
      JAVA_NAMERULES
      JAVA_NONNULL_ANNOTATION
      JAVA_NULLABLE_ANNOTATION
      COPYRIGHT_HEADER
      CPP_INTERNAL_NAMESPACE
      CPP_EXPORT
      CPP_NAMERULES
      SWIFT_NAMERULES
      INTERNAL_PREFIX
      OUTPUT_DIR
      COMMON_OUTPUT_DIR
      BUILD_OUTPUT_DIR
      DART_LIBRARY_NAME
      DART_FUNCTION_LOOKUP_ERROR_MESSAGE
      DART_NAMERULES)
  set(multiValueArgs LIME_SOURCES FRANCA_SOURCES WERROR)
  cmake_parse_arguments(apigen_generate "${options}" "${oneValueArgs}"
                      "${multiValueArgs}" ${ARGN})
  list(APPEND apigen_generate_LIME_SOURCES ${apigen_generate_FRANCA_SOURCES})
  _check_option_is_set(LIME_SOURCES)

  _apigen_set_option(GENERATOR)
  _apigen_set_option(TARGET)
  _apigen_set_option_or_default(BUILD_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${APIGEN_TARGET}/build")
  _apigen_set_option_or_default(OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${APIGEN_TARGET}/${APIGEN_GENERATOR}")
  _apigen_set_option_or_default(COMMON_OUTPUT_DIR "")
  _apigen_set_option_or_default(VERSION +)

  set(operationVerb "Generate")
  set(validateProperty "false")
  if(${apigen_generate_VALIDATE_ONLY})
    set(operationVerb "Validate")
    set(validateProperty "true")
  endif()

  message(STATUS "${operationVerb} '${APIGEN_TARGET}' with '${APIGEN_GENERATOR}' generator using Gluecodium version '${APIGEN_VERSION}'
  Input: '${apigen_generate_LIME_SOURCES}'")

  # Attach properties to target for re-use in other modules
  set_target_properties(${APIGEN_TARGET} PROPERTIES
    APIGEN_GENERATOR "${APIGEN_GENERATOR}"
    APIGEN_OUTPUT_DIR "${APIGEN_OUTPUT_DIR}"
    APIGEN_COMMON_OUTPUT_DIR "${APIGEN_COMMON_OUTPUT_DIR}"
    APIGEN_BUILD_OUTPUT_DIR "${APIGEN_BUILD_OUTPUT_DIR}")

  if(NOT apigen_generate_GENERATOR MATCHES cpp)
    if(NOT apigen_generate_STUBS)
      set(apigen_generate_GENERATOR "cpp,${apigen_generate_GENERATOR}")
    endif()
  endif()

  set(APIGEN_GLUECODIUM_PROPERTIES "\
output=${APIGEN_OUTPUT_DIR}\n\
generators=${apigen_generate_GENERATOR}\n\
validate=${validateProperty}\n\
stubs=${apigen_generate_STUBS}\n\
cache=true\n")

  unset (_apigen_input_list)
  foreach(input ${apigen_generate_LIME_SOURCES})
    # Attach sources to target for IDEs to display them properly in their projects
    file(GLOB_RECURSE inputLimeSources ${input}/*.lime)
    if(inputLimeSources)
      target_sources(${APIGEN_TARGET} PRIVATE ${inputLimeSources})
    endif()

    if(NOT IS_ABSOLUTE ${input})
      set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
    endif()
    list (APPEND _apigen_input_list ${input})
  endforeach()
  string(APPEND APIGEN_GLUECODIUM_PROPERTIES "input=$<JOIN:${_apigen_input_list},$<COMMA>>\n")

  if (apigen_generate_WERROR)
    string(APPEND APIGEN_GLUECODIUM_PROPERTIES "werror=$<JOIN:${apigen_generate_WERROR},$<COMMA>>\n")
  endif()
  _apigen_parse_option(mergemanifest ANDROID_MERGE_MANIFEST)
  _apigen_parse_option(javapackage JAVA_PACKAGE)
  _apigen_parse_option(intpackage JAVA_INTERNAL_PACKAGE)
  _apigen_parse_option(javanonnullannotation JAVA_NONNULL_ANNOTATION)
  _apigen_parse_option(javanullableannotation JAVA_NULLABLE_ANNOTATION)
  _apigen_parse_path_option(copyright COPYRIGHT_HEADER)
  _apigen_parse_required_option(intnamespace CPP_INTERNAL_NAMESPACE)
  _apigen_parse_path_option(cppnamerules CPP_NAMERULES)
  _apigen_parse_path_option(javanamerules JAVA_NAMERULES)
  _apigen_parse_path_option(swiftnamerules SWIFT_NAMERULES)
  _apigen_parse_path_option(dartnamerules DART_NAMERULES)
  _apigen_parse_path_option(commonoutput COMMON_OUTPUT_DIR)
  _apigen_parse_option(libraryname DART_LIBRARY_NAME)
  _apigen_parse_option(dartlookuperrormessage DART_FUNCTION_LOOKUP_ERROR_MESSAGE)
  _apigen_parse_option(internalprefix INTERNAL_PREFIX)
  _apigen_parse_option(cppexport CPP_EXPORT)

  if(NOT apigen_generate_CPP_EXPORT)
    set(apigen_generate_CPP_EXPORT _GLUECODIUM_CPP)
  endif()
  get_target_property(apigen_target_type ${APIGEN_TARGET} TYPE)
  if(apigen_target_type STREQUAL SHARED_LIBRARY)
    target_compile_definitions(${APIGEN_TARGET}
      PUBLIC ${apigen_generate_CPP_EXPORT}_SHARED
      PRIVATE ${apigen_generate_CPP_EXPORT}_INTERNAL)
  endif()

  message("Configured `Gluecodium")

  set(_source_sets MAIN)
  if(APIGEN_COMMON_OUTPUT_DIR)
    list(APPEND _source_sets COMMON)
  endif()
  apigen_list_generated_sources(_generated_files
    ${_source_sets}
    TARGET ${APIGEN_TARGET}
    GENERATOR ${APIGEN_GENERATOR}
    BUILD_OUTPUT_DIR "${APIGEN_BUILD_OUTPUT_DIR}")

  set (_target_interface_sources "$<TARGET_PROPERTY:${APIGEN_TARGET},INTERFACE_SOURCES>")

  if (CMAKE_VERSION VERSION_GREATER_EQUAL 3.15)
    set (_lime_target_sources "$<FILTER:${_target_interface_sources},INCLUDE,.*\\.lime$>")
    string(REPLACE ";" "$<SEMICOLON>" _escaped_lime_sources "${apigen_generate_LIME_SOURCES}")
    set (_lime_dependencies "$<REMOVE_DUPLICATES:${_lime_target_sources}$<SEMICOLON>${_escaped_lime_sources}>")
    set (_lime_target_sources "$<REMOVE_DUPLICATES:${_lime_target_sources}>")
    string(APPEND APIGEN_GLUECODIUM_PROPERTIES "auxinput=$<JOIN:${_lime_target_sources},$<COMMA>>\n")
  else()
    # There is no $<FILTER: ... > in old CMake, so it's not possible to filter out other sources, so:
    # 1. custom command depends on all _lime_target_sources (which includes lime files)
    # 2. _lime_target_sources must be written to separate file and then filtered and merged into options file during compilation
    # 3. Also filtered lime files are written to another file.
    # 4. Now when any of sources or lime files are changed runGenerate.cmake checks if any of filtered lime file
    #    is newer than any of known generated and regenerates sources if it's true.
    set (_lime_target_sources "${_target_interface_sources}")
    set (_gluecodium_auxinput_file "${CMAKE_CURRENT_BINARY_DIR}/gluecodium-auxinput-${APIGEN_TARGET}.txt")
    set (_lime_dependencies "${apigen_generate_LIME_SOURCES};${_lime_target_sources}")
    set (_escaped_generated_files "${apigen_generate_LIME_SOURCES};${_lime_target_sources}")
    string(REPLACE ";" "," _escaped_generated_files "${_generated_files}")
    file (GENERATE OUTPUT "${_gluecodium_auxinput_file}" CONTENT "${_lime_target_sources}")
  endif()

  set (_gluecodium_options_file "${CMAKE_CURRENT_BINARY_DIR}/gluecodium-options-${APIGEN_TARGET}.txt")
  file (GENERATE OUTPUT "${_gluecodium_options_file}" CONTENT "${APIGEN_GLUECODIUM_PROPERTIES}")

  add_custom_command(OUTPUT ${_generated_files}
    COMMAND ${CMAKE_COMMAND}
        -DAPIGEN_TARGET=${APIGEN_TARGET}
        -DBUILD_LOCAL_GLUECODIUM=${BUILD_LOCAL_GLUECODIUM}
        -DAPIGEN_GLUECODIUM_OPTIONS_FILE=${_gluecodium_options_file}
        -DAPIGEN_GLUECODIUM_AUXINPUT_FILE=${_gluecodium_auxinput_file} # CMake < 3.15
        -DAPIGEN_GLUECODIUM_VERSION=${APIGEN_VERSION}
        -DAPIGEN_GLUECODIUM_DIR=${APIGEN_GLUECODIUM_DIR}
        -DAPIGEN_GENERATOR=${APIGEN_GENERATOR}
        -DAPIGEN_OUTPUT_DIR=${APIGEN_OUTPUT_DIR}
        -DAPIGEN_COMMON_OUTPUT_DIR=${APIGEN_COMMON_OUTPUT_DIR}
        -DAPIGEN_BUILD_OUTPUT_DIR=${APIGEN_BUILD_OUTPUT_DIR}
        -DAPIGEN_GENERATED_FILES=${_escaped_generated_files}
        -DAPIGEN_GRADLE_SYNCHRONISATION_DIR=${CMAKE_BINARY_DIR}
        -DAPIGEN_VERBOSE=${apigen_generate_VERBOSE}
        -P ${APIGEN_GLUECODIUM_DIR}/runGenerate.cmake
        VERBATIM
    DEPENDS
      "${APIGEN_GLUECODIUM_DIR}/runGenerate.cmake"
      ${_lime_dependencies} # Should contain both input and aux files
      )

  add_custom_target(${APIGEN_TARGET}.gluecodium.generate DEPENDS ${_generated_files})
endfunction()

macro(_apigen_parse_path_option GLUECODIUM_PROPERTY CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    if(NOT IS_ABSOLUTE ${apigen_generate_${CMAKE_OPTION}})
      set(apigen_generate_${CMAKE_OPTION} "${CMAKE_CURRENT_SOURCE_DIR}/${apigen_generate_${CMAKE_OPTION}}")
    endif()
    string(APPEND APIGEN_GLUECODIUM_PROPERTIES "${GLUECODIUM_PROPERTY}=${apigen_generate_${CMAKE_OPTION}}\n")
  endif()
endmacro()

macro(_apigen_parse_option GLUECODIUM_PROPERTY CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    string(APPEND APIGEN_GLUECODIUM_PROPERTIES "${GLUECODIUM_PROPERTY}=${apigen_generate_${CMAKE_OPTION}}\n")
  endif()
endmacro()

macro(_apigen_parse_required_option GLUECODIUM_PROPERTY CMAKE_OPTION)
  _check_option_is_set(${CMAKE_OPTION})
  _apigen_parse_option(${GLUECODIUM_PROPERTY} ${CMAKE_OPTION})
endmacro()

macro(_apigen_set_option_or_default _option _default)
  if(apigen_generate_${_option})
    set(APIGEN_${_option} "${apigen_generate_${_option}}")
  else()
    set(APIGEN_${_option} "${_default}")
  endif()
  list(APPEND APIGEN_COMMAND_OPTIONS -DAPIGEN_${_option}=${APIGEN_${option}})
endmacro()

macro(_apigen_set_option _option)
  _check_option_is_set(${_option})
  set(APIGEN_${_option} "${apigen_generate_${_option}}")
endmacro()

macro(_pass_option _option)
  string(REPLACE ";" "$<SEMICOLON>" _escaped_option "${${_option}}")
  list(APPEND APIGEN_COMMAND_OPTIONS -DAPIGEN_${_option}=${_escaped_option}})
endmacro()

macro(_check_option_is_set _option)
  if(NOT apigen_generate_${_option})
    message(FATAL_ERROR "Mandatory option ${_option} was not set")
  endif()
endmacro()
