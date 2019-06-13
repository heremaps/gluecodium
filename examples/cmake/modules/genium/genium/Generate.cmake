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

if(DEFINED includeguard_genium_Generate)
  return()
endif()
set(includeguard_genium_Generate ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Code generation module
# ----------------------
#
# This module provides functions to generate API interfaces specified
# in the Franca language into target source code as provided by the
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
# This function invokes the Genium tool based on a set of of input *.fidl
# files with a specific target language generator.

if(COMMAND find_host_package)
  find_host_package(JAVA COMPONENTS Runtime REQUIRED)
else()
  find_package(Java COMPONENTS Runtime REQUIRED)
endif()

set(APIGEN_GENIUM_DIR ${CMAKE_CURRENT_LIST_DIR})
if(WIN32)
  set(APIGEN_GENIUM_GRADLE_WRAPPER ./gradlew.bat)
else()
  set(APIGEN_GENIUM_GRADLE_WRAPPER ./gradlew)
endif()

function(apigen_generate)
  set(options VALIDATE_ONLY)
  set(oneValueArgs TARGET GENERATOR VERSION
      ANDROID_MERGE_MANIFEST
      JAVA_PACKAGE
      JAVA_INTERNAL_PACKAGE
      JAVA_NAMERULES
      COPYRIGHT_HEADER
      CPP_INTERNAL_NAMESPACE
      CPP_EXPORT
      CPP_NAMERULES
      SWIFT_NAMERULES
      OUTPUT_DIR)
  set(multiValueArgs FRANCA_SOURCES)
  cmake_parse_arguments(apigen_generate "${options}" "${oneValueArgs}"
                      "${multiValueArgs}" ${ARGN})

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

  message(STATUS "${operationVerb} '${apigen_generate_TARGET}' with '${apigen_generate_GENERATOR}' generator using Genium version '${apigen_generate_VERSION}'
  Input: '${apigen_generate_FRANCA_SOURCES}'")

  # Genium invocations for different generators need different output directories
  # as Genium currently wipes the directory upon start.
  if(NOT apigen_generate_OUTPUT_DIR)
    set(apigen_generate_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${apigen_generate_GENERATOR}-generated)
  endif()
  set(GENIUM_OUTPUT_DIR ${apigen_generate_OUTPUT_DIR})

  # Attach properties to target for re-use in other modules
  set_target_properties(${apigen_generate_TARGET} PROPERTIES
    APIGEN_GENIUM_GENERATOR ${apigen_generate_GENERATOR}
    APIGEN_GENIUM_GENERATOR_OUTPUT_DIR ${GENIUM_OUTPUT_DIR})

  if(NOT apigen_generate_GENERATOR MATCHES cpp)
    # This can be optimized. If a previous invocation of this function already
    # generated 'cpp', it should be re-used. At the moment this is not possible
    # because Genium cleans it's output directory in the beginning
    set(apigen_generate_GENERATOR "cpp,${apigen_generate_GENERATOR}")
  endif()


  # Build Genium tool command-line
  set(APIGEN_GENIUM_ARGS "\
    -output \"${GENIUM_OUTPUT_DIR}\"\
    -generators ${apigen_generate_GENERATOR}\
    ${validateParam}\
    ${mergeManifest}\
    --enable-caching --time-logging")
  foreach(input ${apigen_generate_FRANCA_SOURCES})
    # Attach sources to target for IDEs to display them properly in their projects
    file(GLOB_RECURSE inputFrancaSources ${input}/*.fidl ${input}/*.fdepl)
    if(inputFrancaSources)
      target_sources(${apigen_generate_TARGET} PRIVATE ${inputFrancaSources})
      # Trigger a re-configure if there are any changes to the franca sources.
      set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${inputFrancaSources})
    endif()

    if(NOT IS_ABSOLUTE ${input})
      set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
    endif()
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " -input \"${input}\"")
  endforeach()
  if(apigen_generate_ANDROID_MERGE_MANIFEST)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " --android-merge-manifest ${apigen_generate_ANDROID_MERGE_MANIFEST}")
  endif()
  if(apigen_generate_JAVA_PACKAGE)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " -javapackage ${apigen_generate_JAVA_PACKAGE}")
  endif()
  if(apigen_generate_JAVA_INTERNAL_PACKAGE)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " --java-internal-package ${apigen_generate_JAVA_INTERNAL_PACKAGE}")
  endif()
  if(apigen_generate_COPYRIGHT_HEADER)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " --copyright-header ${apigen_generate_COPYRIGHT_HEADER}")
  endif()
  if(apigen_generate_CPP_INTERNAL_NAMESPACE)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " --cpp-internal-namespace ${apigen_generate_CPP_INTERNAL_NAMESPACE}")
  endif()
  apigen_name_rule(-cppnamerules CPP_NAMERULES)
  apigen_name_rule(-javanamerules JAVA_NAMERULES)
  apigen_name_rule(-swiftnamerules SWIFT_NAMERULES)

  if(apigen_generate_CPP_EXPORT)
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " -cppexport ${apigen_generate_CPP_EXPORT}")
  else()
    set(apigen_generate_CPP_EXPORT _GENIUM_CPP)
  endif()
  get_target_property(apigen_target_type ${apigen_generate_TARGET} TYPE)
  if (apigen_target_type STREQUAL SHARED_LIBRARY)
    target_compile_definitions(${apigen_generate_TARGET}
      PUBLIC ${apigen_generate_CPP_EXPORT}_SHARED
      PRIVATE ${apigen_generate_CPP_EXPORT}_INTERNAL)
  endif()

  execute_process(
    COMMAND ${CMAKE_COMMAND} -E make_directory ${GENIUM_OUTPUT_DIR} # otherwise java.io.File won't have permissions to create files at configure time
    COMMAND ${APIGEN_GENIUM_GRADLE_WRAPPER} -Pversion=${apigen_generate_VERSION} run --args=${APIGEN_GENIUM_ARGS}
    WORKING_DIRECTORY ${APIGEN_GENIUM_DIR}
    RESULT_VARIABLE GENERATE_RESULT)
  if(NOT "${GENERATE_RESULT}" STREQUAL "0")
    message(FATAL_ERROR "Failed to generate from given FIDL files.")
  endif()

endfunction()

macro(apigen_name_rule NAME_RULE_OPTION NAME_RULE_PATH)
  if(apigen_generate_${NAME_RULE_PATH})
    if(NOT IS_ABSOLUTE ${apigen_generate_${NAME_RULE_PATH}})
      set(apigen_generate_${NAME_RULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/${apigen_generate_${NAME_RULE_PATH}}")
    endif()
    string(CONCAT APIGEN_GENIUM_ARGS ${APIGEN_GENIUM_ARGS} " ${NAME_RULE_OPTION} ${apigen_generate_${NAME_RULE_PATH}}")
  endif()
endmacro()