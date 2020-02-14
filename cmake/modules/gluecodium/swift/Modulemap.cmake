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

if(DEFINED includeguard_gluecodium_swift_Modulemap)
  return()
endif()
set(includeguard_gluecodium_swift_Modulemap ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_modulemap
# ----------------------
#
# This module builds Swift modulemap needed for the framework creation.
# The modulemap is used to get the Swift compiler into loading the header files and linking
# against the CBridge library without exposing the C bindings in the framework.
# The modulemap itself is not part of the framework.
#
# .. command:: apigen_swift_modulemap
#
# The general form of the command is::
#
#     apigen_swift_modulemap(target
#       HEADERS file_list)
#
# HEADERS specifies additional file list to put into generated modulemap file
#

function(apigen_swift_modulemap target)

  set(multiArgs HEADERS)

  cmake_parse_arguments(APIGEN_SWIFT_MODULEMAP "" "${singleArgs}" "${multiArgs}" ${ARGN})

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(COMMON_OUTPUT_DIR ${target} APIGEN_COMMON_OUTPUT_DIR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_MODULE_NAME ${target} APIGEN_SWIFT_MODULE_NAME)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_modulemap() depends on apigen_generate() configured with generator 'swift'")
  endif()

  set(MODULEMAP_FRAMEWORK_PATH "${SWIFT_OUTPUT_DIR}/${SWIFT_MODULE_NAME}.framework/Modules/module.modulemap")

  # Module map generation
  apigen_set_generated_files(${target})
  set(_cbridge_modulemap "module ${SWIFT_MODULE_NAME} {\n")
  get_target_property(bridging_headers ${target} BRIDGING_HEADERS)
  if(NOT bridging_headers)
    unset(bridging_headers)
  endif()
  foreach(header IN LISTS APIGEN_SWIFT_MODULEMAP_HEADERS bridging_headers)
    string(APPEND _cbridge_modulemap "  header \"${header}\"\n")
  endforeach()

  string(APPEND _cbridge_modulemap "  header \"${SWIFT_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_main}\"\n")
  if(COMMON_OUTPUT_DIR)
    string(APPEND _cbridge_modulemap "  header \"${SWIFT_OUTPUT_DIR}/${APIGEN_GENERATED_cbridge_header_common}\"\n")
  endif()
  string(APPEND _cbridge_modulemap "\}\n")
  file(WRITE "${SWIFT_OUTPUT_DIR}/module.modulemap.generated" "${_cbridge_modulemap}")

  # Clean up the modulemap after building to avoid double definition conflicts with the generated
  # framework - this is caused by using internally the same name as the final Xcode project
  # and Xcode will follow those caches
  add_custom_command(TARGET "${target}" PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${SWIFT_OUTPUT_DIR}/module.modulemap.generated" "${SWIFT_OUTPUT_DIR}/module.modulemap")
  if(APPLE)
    add_custom_command(TARGET "${target}" POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E remove "${SWIFT_OUTPUT_DIR}/module.modulemap")
  endif()
endfunction()
