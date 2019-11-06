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

function(apigen_generate)
  set(options VALIDATE_ONLY)
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
      OUTPUT_DIR)
  set(multiValueArgs FRANCA_SOURCES LIME_SOURCES)
  cmake_parse_arguments(apigen_generate "${options}" "${oneValueArgs}"
                      "${multiValueArgs}" ${ARGN})

  set(IDL_SOURCES)
  list(APPEND IDL_SOURCES ${apigen_generate_LIME_SOURCES} ${apigen_generate_FRANCA_SOURCES})

  set(operationVerb "Generate")
  set(validateParam "")
  if(${apigen_generate_VALIDATE_ONLY})
    set(operationVerb "Validate")
    set(validateParam "-validateOnly")
  endif()

  # If version is not specified explicitly, use latest-greatest
  if(NOT apigen_generate_VERSION)
    set(apigen_generate_VERSION +)
  endif()

  message(STATUS "${operationVerb} '${apigen_generate_TARGET}' with '${apigen_generate_GENERATOR}' generator using Gluecodium version '${apigen_generate_VERSION}'
  Input: '${IDL_SOURCES}'")

  # Gluecodium invocations for different generators need different output directories
  # as Gluecodium currently wipes the directory upon start.
  if(NOT apigen_generate_OUTPUT_DIR)
    set(apigen_generate_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${apigen_generate_GENERATOR}-generated)
  endif()
  set(GLUECODIUM_OUTPUT_DIR ${apigen_generate_OUTPUT_DIR})

  # Attach properties to target for re-use in other modules
  set_target_properties(${apigen_generate_TARGET} PROPERTIES
    APIGEN_GLUECODIUM_GENERATOR ${apigen_generate_GENERATOR}
    APIGEN_GLUECODIUM_GENERATOR_OUTPUT_DIR ${GLUECODIUM_OUTPUT_DIR})

  if(NOT apigen_generate_GENERATOR MATCHES cpp)
    # This can be optimized. If a previous invocation of this function already
    # generated 'cpp', it should be re-used. At the moment this is not possible
    # because Gluecodium cleans it's output directory in the beginning
    set(apigen_generate_GENERATOR "cpp,${apigen_generate_GENERATOR}")
  endif()


  # Build Gluecodium tool command-line
  set(APIGEN_GLUECODIUM_ARGS "\
    -output \"${GLUECODIUM_OUTPUT_DIR}\"\
    -generators ${apigen_generate_GENERATOR}\
    ${validateParam}\
    ${mergeManifest}\
    --enable-caching --time-logging")
  foreach(input ${IDL_SOURCES})
    # Attach sources to target for IDEs to display them properly in their projects
    file(GLOB_RECURSE inputLimeSources ${input}/*.lime)
    if(inputLimeSources)
      target_sources(${apigen_generate_TARGET} PRIVATE ${inputLimeSources})
      # Trigger a re-configure if there are any changes to the LimeIDL sources.
      set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${inputLimeSources})
    endif()

    if(NOT IS_ABSOLUTE ${input})
      set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
    endif()
    string(CONCAT APIGEN_GLUECODIUM_ARGS ${APIGEN_GLUECODIUM_ARGS} " -input \"${input}\"")
  endforeach()
  apigen_parse_option(--android-merge-manifest ANDROID_MERGE_MANIFEST)
  apigen_parse_option(-javapackage JAVA_PACKAGE)
  apigen_parse_option(--java-internal-package JAVA_INTERNAL_PACKAGE)
  apigen_parse_option(-javanonnullannotation JAVA_NONNULL_ANNOTATION)
  apigen_parse_option(-javanullableannotation JAVA_NULLABLE_ANNOTATION)
  apigen_parse_path_option(--copyright-header COPYRIGHT_HEADER)
  apigen_parse_option(--cpp-internal-namespace CPP_INTERNAL_NAMESPACE)
  apigen_parse_path_option(-cppnamerules CPP_NAMERULES)
  apigen_parse_path_option(-javanamerules JAVA_NAMERULES)
  apigen_parse_path_option(-swiftnamerules SWIFT_NAMERULES)

  if(apigen_generate_CPP_EXPORT)
    string(CONCAT APIGEN_GLUECODIUM_ARGS ${APIGEN_GLUECODIUM_ARGS} " -cppexport ${apigen_generate_CPP_EXPORT}")
  else()
    set(apigen_generate_CPP_EXPORT _GLUECODIUM_CPP)
  endif()
  get_target_property(apigen_target_type ${apigen_generate_TARGET} TYPE)
  if(apigen_target_type STREQUAL SHARED_LIBRARY)
    target_compile_definitions(${apigen_generate_TARGET}
      PUBLIC ${apigen_generate_CPP_EXPORT}_SHARED
      PRIVATE ${apigen_generate_CPP_EXPORT}_INTERNAL)
  endif()

  message("Running `Gluecodium ${APIGEN_GLUECODIUM_ARGS}`")

  if(DEFINED ENV{GLUECODIUM_PATH})
    message("Using local Gluecodium from " $ENV{GLUECODIUM_PATH})
    set(BUILD_LOCAL_GLUECODIUM "--include-build" "$ENV{GLUECODIUM_PATH}")
  endif()

  execute_process(
    COMMAND ${CMAKE_COMMAND} -E make_directory ${GLUECODIUM_OUTPUT_DIR} # otherwise java.io.File won't have permissions to create files at configure time
    COMMAND ${APIGEN_GLUECODIUM_GRADLE_WRAPPER} ${BUILD_LOCAL_GLUECODIUM} -Pversion=${apigen_generate_VERSION} run --args=${APIGEN_GLUECODIUM_ARGS}
    WORKING_DIRECTORY ${APIGEN_GLUECODIUM_DIR}
    RESULT_VARIABLE GENERATE_RESULT
    OUTPUT_VARIABLE GENERATE_OUTPUT
    ERROR_VARIABLE GENERATE_OUTPUT)
  if(NOT "${GENERATE_RESULT}" STREQUAL "0")
    message(FATAL_ERROR "Failed to generate from given LimeIDL files:\n${GENERATE_OUTPUT}")
  endif()

endfunction()

macro(apigen_parse_path_option GLUECODIUM_OPTION CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    if(NOT IS_ABSOLUTE ${apigen_generate_${CMAKE_OPTION}})
      set(apigen_generate_${CMAKE_OPTION} "${CMAKE_CURRENT_SOURCE_DIR}/${apigen_generate_${CMAKE_OPTION}}")
    endif()
    string(CONCAT APIGEN_GLUECODIUM_ARGS ${APIGEN_GLUECODIUM_ARGS} " ${GLUECODIUM_OPTION} ${apigen_generate_${CMAKE_OPTION}}")
  endif()
endmacro()

macro(apigen_parse_option GLUECODIUM_OPTION CMAKE_OPTION)
  if(apigen_generate_${CMAKE_OPTION})
    string(CONCAT APIGEN_GLUECODIUM_ARGS ${APIGEN_GLUECODIUM_ARGS} " ${GLUECODIUM_OPTION} ${apigen_generate_${CMAKE_OPTION}}")
  endif()
endmacro()
