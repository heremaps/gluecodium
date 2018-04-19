# Copyright (C) 2016-2018 HERE Europe B.V.
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

if(DEFINED includeguard_ApigenTargetSources)
  return()
endif()
set(includeguard_ApigenTargetSources ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenTargetSources
# -------------------
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
#   apigen_target_sources(target)
#

function(apigen_target_sources target)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)
  get_target_property(ADDITIONAL_SOURCES ${target} APIGEN_GENIUM_GENERATOR_ADDITIONAL_SOURCES)
  if(NOT ADDITIONAL_SOURCES)
    set(ADDITIONAL_SOURCES "")
  endif()
  file(GLOB_RECURSE GENERATED_CPP_SOURCES ${OUTPUT_DIR}/cpp/*.cpp)
  file(GLOB_RECURSE GENERATED_CPP_HEADERS ${OUTPUT_DIR}/cpp/*.h)
  source_group("Generated BaseApi\\Header Files" FILES ${GENERATED_CPP_HEADERS})
  source_group("Generated BaseApi\\Source Files" FILES ${GENERATED_CPP_SOURCES})

  if(${GENERATOR} STREQUAL cpp)

    target_sources(${target}
      PRIVATE
        ${GENERATED_CPP_SOURCES}
        ${GENERATED_CPP_HEADERS})


  elseif(${GENERATOR} MATCHES android)

    file(GLOB_RECURSE JNI_SOURCES ${OUTPUT_DIR}/android/jni/*.cpp)
    target_sources(${target}
      PRIVATE
        ${GENERATED_CPP_SOURCES}
        ${GENERATED_CPP_HEADERS}
        ${JNI_SOURCES})

  elseif(${GENERATOR} MATCHES swift)

    file(GLOB_RECURSE CBRIDGE_SOURCES ${OUTPUT_DIR}/cbridge/*.cpp)
    file(GLOB_RECURSE CBRIDGE_HEADERS ${OUTPUT_DIR}/cbridge/*.h)
    file(GLOB_RECURSE SWIFT_SOURCES ${OUTPUT_DIR}/swift/*.swift)
    target_sources(${target}
      PRIVATE
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
