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

#.rst:
# Generated target_sources module
# -------------------------------
#
# This module attaches additional source files to the provided target.
# These might differ depending on the previously used generator (cpp, android,
# swift, etc.). This module depends on apigen_generate() to have been run on
# the target first.
#
# .. command:: apigen_target_sources
#
# The general form of the command is::
#
#     apigen_target_sources(target)
#

function(apigen_target_sources target)

  get_target_property(GENERATOR ${target} APIGEN_GLUECODIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_GLUECODIUM_GENERATOR_OUTPUT_DIR)
  get_target_property(ADDITIONAL_SOURCES ${target} APIGEN_GLUECODIUM_GENERATOR_ADDITIONAL_SOURCES)
  if(NOT ADDITIONAL_SOURCES)
    set(ADDITIONAL_SOURCES "")
  endif()
  file(GLOB_RECURSE GENERATED_CPP_SOURCES ${OUTPUT_DIR}/cpp/*.cpp)
  file(GLOB_RECURSE GENERATED_CPP_HEADERS ${OUTPUT_DIR}/cpp/*.h)
  source_group("Generated BaseApi\\Header Files" FILES ${GENERATED_CPP_HEADERS})
  source_group("Generated BaseApi\\Source Files" FILES ${GENERATED_CPP_SOURCES})

  if(${GENERATOR} STREQUAL cpp)

    target_sources(${target} PRIVATE
      ${GENERATED_CPP_SOURCES}
      ${GENERATED_CPP_HEADERS})


  elseif(${GENERATOR} MATCHES android)

    file(GLOB_RECURSE JNI_SOURCES ${OUTPUT_DIR}/android/jni/*.cpp)
    target_sources(${target} PRIVATE
      ${GENERATED_CPP_SOURCES}
      ${GENERATED_CPP_HEADERS}
      ${JNI_SOURCES})

  elseif(${GENERATOR} MATCHES swift)

    file(GLOB_RECURSE CBRIDGE_SOURCES ${OUTPUT_DIR}/cbridge/*.cpp)
    file(GLOB_RECURSE CBRIDGE_HEADERS ${OUTPUT_DIR}/cbridge/*.h)
    file(GLOB_RECURSE SWIFT_SOURCES ${OUTPUT_DIR}/swift/*.swift)

    # If headers are added, CMake will
    # generate a PBXHeaderBuildPhase for these. If a header in that list matches the
    # name of the framework (case insensitive) then XCode will assume it is an
    # umbrella header and create the modulemap accordingly. This breaks the resulting
    # framework.
    get_target_property(SWIFT_FRAMEWORK_NAME ${target} APIGEN_SWIFT_FRAMEWORK_NAME)
    if(NOT SWIFT_FRAMEWORK_NAME)
      set(SWIFT_FRAMEWORK_NAME "${target}")
    endif()
    string(TOUPPER "${SWIFT_FRAMEWORK_NAME}" UPPER_FRAMEWORK_NAME)
    foreach(GENERATED_HEADER ${CBRIDGE_HEADERS} ${GENERATED_CPP_HEADERS})
      get_filename_component(BASENAME "${GENERATED_HEADER}" NAME_WE)
      string(TOUPPER "${BASENAME}" UPPER_BASENAME)
      if("${UPPER_BASENAME}" STREQUAL "${UPPER_FRAMEWORK_NAME}")
        message(FATAL_ERROR "Generated header "
                "'${GENERATED_HEADER}' "
                "must not have the same name as the framework since XCode Generator would "
                "add it as framework header.")
      endif()
    endforeach()

    target_sources(${target} PRIVATE
      ${CBRIDGE_SOURCES}
      ${CBRIDGE_HEADERS}
      ${GENERATED_CPP_SOURCES}
      ${GENERATED_CPP_HEADERS}
      ${SWIFT_SOURCES}
      ${ADDITIONAL_SOURCES})
    source_group("Generated cBridge\\Header Files" FILES ${CBRIDGE_HEADERS})
    source_group("Generated cBridge\\Source Files" FILES ${CBRIDGE_SOURCES})
    source_group("Generated Swift Source Files" FILES ${SWIFT_SOURCES})
    source_group("Swift Source Files" FILES ${ADDITIONAL_SOURCES})
    target_include_directories(${target} PRIVATE ${OUTPUT_DIR}/cbridge)
  else()
    message(FATAL_ERROR "apigen_target_sources() cannot match the generator '${GENERATOR}'")
  endif()

endfunction()
