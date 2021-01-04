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

if(DEFINED includeguard_gluecodium_swift_FatLibrary)
  return()
endif()
set(includeguard_gluecodium_swift_FatLibrary ON)

cmake_minimum_required(VERSION 3.5)

#[===========================================================================================[.rst:
apigen_swift_fat_library
------------------------

This module crates fat libraries for different architecture

.. command:: apigen_swift_fat_library

The general form of the command is::

    apigen_swift_fat_library(target)

#]===========================================================================================]
function(apigen_swift_fat_library _target)

  if(NOT APPLE)
    return()
  endif()

  get_target_property(GENERATOR ${_target} APIGEN_GENERATOR)
  get_target_property(OUTPUT_DIR ${_target} APIGEN_OUTPUT_DIR)
  get_target_property(SWIFT_OUTPUT_DIR ${_target} APIGEN_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_ARCH ${_target} APIGEN_SWIFT_BUILD_ARCH)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(
      FATAL_ERROR
        "apigen_swift_fat_library() depends on apigen_generate() configured with generator 'swift'")
  endif()

  set(framework_lib "${_target}.framework/${_target}")
  set(libs)
  foreach(TARGET_ARCH IN LISTS SWIFT_ARCH)
    list(APPEND libs lib${_target}.${TARGET_ARCH})
  endforeach()

  add_custom_command(
    TARGET ${_target}
    POST_BUILD
    COMMAND lipo ${libs} -create -output "${framework_lib}"
    COMMAND install_name_tool -id "@rpath/${framework_lib}" "${framework_lib}"
    WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}
    COMMENT "[Swift] Creating Swift fat library ${libs}...")

  message(STATUS "[Swift] Fat lib: ${framework_lib}. Output path: ${SWIFT_OUTPUT_DIR}")

endfunction()
