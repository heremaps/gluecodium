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

if(DEFINED includeguard_gluecodium_swift_FrameworkInfoPlist)
  return()
endif()
set(includeguard_gluecodium_swift_FrameworkInfoPlist ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_framework_info_plist
# ---------------------------------
#
# This module builds macos target information
#
# .. command:: apigen_swift_framework_info_plist
#
# The general form of the command is::
#
#     apigen_swift_framework_info_plist(target)
#

function(apigen_swift_framework_info_plist target)

  get_target_property(GENERATOR ${target} APIGEN_GLUECODIUM_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
  get_target_property(SWIFT_FRAMEWORK_VERSION_SHORT ${target} APIGEN_SWIFT_FRAMEWORK_VERSION_SHORT)
  get_target_property(SWIFT_FRAMEWORK_MINIMUM_OS_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION)
  get_target_property(SWIFT_RESOURCES_DIR ${target} APIGEN_SWIFT_RESOURCES_DIR)
  get_target_property(SWIFT_FRAMEWORK_NAME ${target} APIGEN_SWIFT_FRAMEWORK_NAME)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_framework_info_plist() depends on apigen_generate() configured with generator 'swift'")
  endif()

  set(MACOSX_FRAMEWORK_NAME ${SWIFT_FRAMEWORK_NAME})
  set(MACOSX_FRAMEWORK_ICON_FILE)
  #TODO APIGEN-347 make this configurable
  set(MACOSX_FRAMEWORK_IDENTIFIER com.here.ivi.${SWIFT_FRAMEWORK_NAME})
  set(MACOSX_FRAMEWORK_BUNDLE_VERSION ${SWIFT_FRAMEWORK_VERSION})
  set(MACOSX_FRAMEWORK_BUNDLE_VERSION_SHORT ${SWIFT_FRAMEWORK_VERSION_SHORT})
  set(MACOSX_FRAMEWORK_MINIMUM_OS_VERSION ${SWIFT_FRAMEWORK_MINIMUM_OS_VERSION})

  # using CMakes builtin Info.plist generation does not work properly, work around this by removing
  # and replacing the generated one
  configure_file(${SWIFT_RESOURCES_DIR}/MacOSXFrameworkInfo.plist.in ${SWIFT_OUTPUT_DIR}/Info.plist.${target})
  add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E remove "$<TARGET_FILE_DIR:${target}>/../${SWIFT_FRAMEWORK_NAME}.framework/Info.plist"
    COMMAND ${CMAKE_COMMAND} -E copy ${SWIFT_OUTPUT_DIR}/Info.plist.${target} "$<TARGET_FILE_DIR:${target}>/../${SWIFT_FRAMEWORK_NAME}.framework/Info.plist"
    )
  message(STATUS "[Swift] Creating Mac OS configuration...")

endfunction()
