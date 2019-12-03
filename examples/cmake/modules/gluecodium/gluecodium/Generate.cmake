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
if(WIN32)
  set(APIGEN_GLUECODIUM_GRADLE_WRAPPER ${APIGEN_GLUECODIUM_DIR}/gradlew.bat)
else()
  set(APIGEN_GLUECODIUM_GRADLE_WRAPPER ${APIGEN_GLUECODIUM_DIR}/gradlew)
endif()

include(${APIGEN_GLUECODIUM_DIR}/GeneratedSources.cmake)

function(apigen_generate)
  set(options VALIDATE_ONLY VERBOSE)
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
      OUTPUT_DIR
      COMMON_OUTPUT_DIR
      BUILD_OUTPUT_DIR
      LIBRARY_NAME)
  set(multiValueArgs LIME_SOURCES FRANCA_SOURCES)
  cmake_parse_arguments(apigen_generate "${options}" "${oneValueArgs}"
                      "${multiValueArgs}" ${ARGN})
  list(APPEND apigen_generate_LIME_SOURCES ${apigen_generate_FRANCA_SOURCES})

  _apigen_set_option(GENERATOR)
  _apigen_set_option(TARGET)
  _apigen_set_option_or_default(VERBOSE OFF)
  _apigen_set_option_or_default(BUILD_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${APIGEN_TARGET}/build")
  _apigen_set_option_or_default(OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${APIGEN_TARGET}/${APIGEN_GENERATOR}")
  _apigen_set_option_or_default(COMMON_OUTPUT_DIR "")
  _apigen_set_option_or_default(VERSION +)

  set(operationVerb "Generate")
  set(validateParam "")
  if(${apigen_generate_VALIDATE_ONLY})
    set(operationVerb "Validate")
    set(validateParam "-validateOnly")
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
    set(apigen_generate_GENERATOR "cpp,${apigen_generate_GENERATOR}")
  endif()

  set(APIGEN_GLUECODIUM_ARGS "\
    -output \"${APIGEN_OUTPUT_DIR}\"\
    -generators ${apigen_generate_GENERATOR}\
    ${validateParam}\
    ${mergeManifest}\
    --enable-caching --time-logging")
  foreach(input ${apigen_generate_LIME_SOURCES})
    # Attach sources to target for IDEs to display them properly in their projects
    file(GLOB_RECURSE inputLimeSources ${input}/*.lime)
    if(inputLimeSources)
      target_sources(${APIGEN_TARGET} PRIVATE ${inputLimeSources})
    endif()

    if(NOT IS_ABSOLUTE ${input})
      set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
    endif()
    string(APPEND APIGEN_GLUECODIUM_ARGS " -input \"${input}\"")
  endforeach()
  _apigen_parse_option(--android-merge-manifest ANDROID_MERGE_MANIFEST)
  _apigen_parse_option(-javapackage JAVA_PACKAGE)
  _apigen_parse_option(--java-internal-package JAVA_INTERNAL_PACKAGE)
  _apigen_parse_option(-javanonnullannotation JAVA_NONNULL_ANNOTATION)
  _apigen_parse_option(-javanullableannotation JAVA_NULLABLE_ANNOTATION)
  _apigen_parse_path_option(--copyright-header COPYRIGHT_HEADER)
  _apigen_parse_option(--cpp-internal-namespace CPP_INTERNAL_NAMESPACE)
  _apigen_parse_path_option(-cppnamerules CPP_NAMERULES)
  _apigen_parse_path_option(-javanamerules JAVA_NAMERULES)
  _apigen_parse_path_option(-swiftnamerules SWIFT_NAMERULES)
  _apigen_parse_path_option(-commonoutput COMMON_OUTPUT_DIR)
  _apigen_parse_option(-libraryname LIBRARY_NAME)
  _apigen_parse_option(-cppexport CPP_EXPORT)

  if(NOT apigen_generate_CPP_EXPORT)
    set(apigen_generate_CPP_EXPORT _GLUECODIUM_CPP)
  endif()
  get_target_property(apigen_target_type ${APIGEN_TARGET} TYPE)
  if(apigen_target_type STREQUAL SHARED_LIBRARY)
    target_compile_definitions(${APIGEN_TARGET}
      PUBLIC ${apigen_generate_CPP_EXPORT}_SHARED
      PRIVATE ${apigen_generate_CPP_EXPORT}_INTERNAL)
  endif()

  message("Configured `Gluecodium" ${APIGEN_GLUECODIUM_ARGS})

  set(_source_sets MAIN)
  if(APIGEN_COMMON_OUTPUT_DIR)
    list(APPEND _source_sets COMMON)
  endif()
  apigen_list_generated_sources(_generated_files
    ${_source_sets}
    GENERATOR ${APIGEN_GENERATOR}
    BUILD_OUTPUT_DIR "${APIGEN_BUILD_OUTPUT_DIR}")

  add_custom_command(OUTPUT ${_generated_files}
    COMMAND ${GLUECODIUM_TIME} ${CMAKE_COMMAND}
        -DAPIGEN_GLUECODIUM_GRADLE_WRAPPER=${APIGEN_GLUECODIUM_GRADLE_WRAPPER}
        -DBUILD_LOCAL_GLUECODIUM=${BUILD_LOCAL_GLUECODIUM}
        -DAPIGEN_GLUECODIUM_ARGS=${APIGEN_GLUECODIUM_ARGS}
        -DAPIGEN_GLUECODIUM_VERSION=${apigen_generate_VERSION}
        -DAPIGEN_GLUECODIUM_DIR=${APIGEN_GLUECODIUM_DIR}
        -DAPIGEN_GENERATOR=${APIGEN_GENERATOR}
        -DAPIGEN_OUTPUT_DIR=${APIGEN_OUTPUT_DIR}
        -DAPIGEN_COMMON_OUTPUT_DIR=${APIGEN_COMMON_OUTPUT_DIR}
        -DAPIGEN_BUILD_OUTPUT_DIR=${APIGEN_BUILD_OUTPUT_DIR}
        -DAPIGEN_VERBOSE=${APIGEN_VERBOSE}
        -P ${APIGEN_GLUECODIUM_DIR}/runGenerate.cmake
        VERBATIM
    DEPENDS
      "${APIGEN_GLUECODIUM_DIR}/runGenerate.cmake"
      ${apigen_generate_LIME_SOURCES})
endfunction()

macro(_apigen_parse_path_option GLUECODIUM_OPTION CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    if(NOT IS_ABSOLUTE ${apigen_generate_${CMAKE_OPTION}})
      set(apigen_generate_${CMAKE_OPTION} "${CMAKE_CURRENT_SOURCE_DIR}/${apigen_generate_${CMAKE_OPTION}}")
    endif()
    string(APPEND APIGEN_GLUECODIUM_ARGS " ${GLUECODIUM_OPTION} \"${apigen_generate_${CMAKE_OPTION}}\"")
  endif()
endmacro()

macro(_apigen_parse_option GLUECODIUM_OPTION CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    string(APPEND APIGEN_GLUECODIUM_ARGS " ${GLUECODIUM_OPTION} ${apigen_generate_${CMAKE_OPTION}}")
  endif()
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
  if(apigen_generate_${_option})
    set(APIGEN_${_option} "${apigen_generate_${_option}}")
  else()
    message(FATAL_ERROR "Mandatory option ${_option} was not set")
  endif()
endmacro()

macro(_pass_option _option)
  string(REPLACE ";" "$<SEMICOLON>" _escaped_option "${${_option}}")
  list(APPEND APIGEN_COMMAND_OPTIONS -DAPIGEN_${_option}=${_escaped_option}})
endmacro()
