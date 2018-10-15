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

if(DEFINED includeguard_genium_swift_Test)
  return()
endif()
set(includeguard_genium_swift_Test ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_test
# -----------------
#
# This module builds test target information
#
# .. command:: apigen_swift_test
#
# The general form of the command is::
#
#     apigen_swift_test(target)
#

function(apigen_swift_test target swift_target_flag module_name)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_TEST_SHARED ${target} APIGEN_SWIFT_TESTS_SHARED)
  get_target_property(SWIFT_TEST_IOS ${target} APIGEN_SWIFT_TESTS_IOS)

  if(NOT SWIFT_TEST_SHARED)
    return()
  endif()

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_test() depends on apigen_generate() configured with generator 'swift'")
  endif()

  file(GLOB_RECURSE SOURCES_SHARED ${SWIFT_TEST_SHARED}/*.swift)

  if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    find_package(XCTest REQUIRED)
    if(SWIFT_TEST_IOS)
      file(GLOB_RECURSE SOURCES_IOS ${SWIFT_TEST_IOS}/*.swift)
      create_xctest_bundle(${target} "xctest_ios_" "${SOURCES_IOS}")
    endif()

    create_xctest_bundle(${target} "xctest_" "${SOURCES_SHARED}")

    add_executable(test${target} ${SOURCES_SHARED})
    target_link_libraries(test${target} ${target})
    set_target_properties(test${target} PROPERTIES
      # Add the path for XCTest
      XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "$(PLATFORM_DIR)/Developer/Library/Frameworks/"
      XCODE_ATTRIBUTE_OTHER_LDFLAGS "-rpath $(PLATFORM_DIR)/Developer/Library/Frameworks/"
      XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "-Onone"
      )

    install(TARGETS test${target} DESTINATION .)
  else()
    set(BUILD_ARGUMENTS
      ${swift_target_flag}
      -emit-executable
      -o "test${target}"
      -L${SWIFT_OUTPUT_DIR}
      -I${SWIFT_OUTPUT_DIR}
      -l${module_name}
      -enable-testing
      -Xlinker -rpath -Xlinker "'$$ORIGIN'")

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if(uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
      set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif()

    add_custom_target(test${target} ALL DEPENDS ${target}
      COMMAND swiftc ${BUILD_ARGUMENTS} ${SOURCES_SHARED}
      WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    install(PROGRAMS "${SWIFT_OUTPUT_DIR}/test${target}" DESTINATION .)
  endif()
endfunction()

function(create_xctest_bundle target tests_name sources)
  set(TEST_TARGET "${tests_name}${target}")
  message(STATUS "Test target : ${TEST_TARGET}")
  xctest_add_bundle(${TEST_TARGET} ${target} ${sources})
  set_target_properties(${TEST_TARGET} PROPERTIES
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "@loader_path/Frameworks"
    XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=Debug] "YES"
    XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=RelWithDebInfo] "YES"
    XCODE_ATTRIBUTE_ENABLE_TESTABILITY[variant=Debug] "YES"
    XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "-Onone")
endfunction()
