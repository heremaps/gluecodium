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

#[===========================================================================================[.rst:
apigen_check_only_listed_ios_architectures_are_enabled
---------------------------------

Checks if only listed architectures are enabled with CMAKE_OSX_ARCHITECTURES
  variable

.. command:: apigen_check_only_listed_ios_architectures_are_enabled

The general form of the command is::

    apigen_check_only_listed_ios_architectures_are_enabled(result arch1 arch2 ...)

#]===========================================================================================]
function (apigen_check_only_listed_ios_architectures_are_enabled _result)
  foreach (_architecture ${CMAKE_OSX_ARCHITECTURES})
    if (NOT ${_architecture} IN_LIST ARGN)
      set (${_result} NO PARENT_SCOPE)
      return ()
    endif ()
  endforeach ()
  set (${_result} YES PARENT_SCOPE)
endfunction ()

#[===========================================================================================[.rst:
apigen_swift_framework_info_plist
---------------------------------

This module builds macos target information

.. command:: apigen_swift_framework_info_plist

The general form of the command is::

    apigen_swift_framework_info_plist(target)

#]===========================================================================================]
# Used to find the .plist.in file when the function is called
set(APIGEN_CMAKE_MODULE_SWIFT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(apigen_swift_framework_info_plist _target)

  get_target_property(GENERATOR ${_target} APIGEN_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${_target} APIGEN_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${_target} APIGEN_SWIFT_FRAMEWORK_VERSION)
  get_target_property(SWIFT_FRAMEWORK_VERSION_SHORT ${_target} APIGEN_SWIFT_FRAMEWORK_VERSION_SHORT)
  get_target_property(SWIFT_FRAMEWORK_MINIMUM_OS_VERSION ${_target}
                      APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION)
  get_target_property(SWIFT_RESOURCES_DIR ${_target} APIGEN_SWIFT_RESOURCES_DIR)
  get_target_property(SWIFT_FRAMEWORK_NAME ${_target} APIGEN_SWIFT_FRAMEWORK_NAME)
  get_target_property(MACOSX_FRAMEWORK_IDENTIFIER ${_target} APIGEN_SWIFT_FRAMEWORK_IDENTIFIER)
  if(IOS)
    if(CMAKE_OSX_ARCHITECTURES) # Support CMake's default toolchain
      apigen_check_only_listed_ios_architectures_are_enabled(_is_iphone_os "armv7" "armv7s" "arm64"
                                                             "arm64e")
      if(_is_iphone_os)
        set(APPLE_PLATFORM_NAME iPhoneOS)
      else()
        set(APPLE_PLATFORM_NAME iPhoneSimulator)
      endif()
    else()
      set(APPLE_PLATFORM_NAME iPhoneOS)
    endif()
  else()
    set(APPLE_PLATFORM_NAME MacOSX)
  endif()

  if(NOT ${GENERATOR} MATCHES "swift")
    message(
      FATAL_ERROR
        "apigen_swift_framework_info_plist() depends on apigen_generate() configured with generator 'swift'"
    )
  endif()

  if(NOT MACOSX_FRAMEWORK_IDENTIFIER)
    # TODO APIGEN-347 don't use HERE-specific deafult
    set(MACOSX_FRAMEWORK_IDENTIFIER com.here.ivi.${SWIFT_FRAMEWORK_NAME})
  endif()

  set(MACOSX_FRAMEWORK_NAME ${SWIFT_FRAMEWORK_NAME})
  set(MACOSX_FRAMEWORK_ICON_FILE)
  set(MACOSX_FRAMEWORK_BUNDLE_VERSION ${SWIFT_FRAMEWORK_VERSION})
  set(MACOSX_FRAMEWORK_BUNDLE_VERSION_SHORT ${SWIFT_FRAMEWORK_VERSION_SHORT})
  set(MACOSX_FRAMEWORK_MINIMUM_OS_VERSION ${SWIFT_FRAMEWORK_MINIMUM_OS_VERSION})

  # TODO: APIGEN-1760 Check if we still need our own Info.plist file and cannot use CMake's
  # generated one using CMakes builtin Info.plist generation does not work properly, work around
  # this by removing and replacing the generated one
  configure_file(${APIGEN_CMAKE_MODULE_SWIFT_DIR}/MacOSXFrameworkInfo.plist.in
                 ${SWIFT_OUTPUT_DIR}/Info.plist.${_target})
  add_custom_command(
    TARGET ${_target}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E remove
            "$<TARGET_FILE_DIR:${_target}>/../${SWIFT_FRAMEWORK_NAME}.framework/Info.plist"
    COMMAND ${CMAKE_COMMAND} -E copy ${SWIFT_OUTPUT_DIR}/Info.plist.${_target}
            "$<TARGET_FILE_DIR:${_target}>/../${SWIFT_FRAMEWORK_NAME}.framework/Info.plist")
  message(STATUS "[Swift] Creating Mac OS configuration...")

endfunction()
