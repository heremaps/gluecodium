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

if(DEFINED includeguard_gluecodium_swift_Test)
  return()
endif()
set(includeguard_gluecodium_swift_Test ON)

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

function(apigen_swift_test target)
  set(options)
  set(oneValueArgs TEST_EXECUTABLE_NAME)
  set(multiValueArgs SOURCES)
  cmake_parse_arguments(apigen_swift_test "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if(apigen_swift_test_TEST_EXECUTABLE_NAME)
    set(test_target ${apigen_swift_test_TEST_EXECUTABLE_NAME})
  else()
    set(test_target "test${target}")
  endif()

  set(sources)
  foreach(source ${apigen_swift_test_SOURCES})
    if(IS_ABSOLUTE "${source}")
      list(APPEND sources "${source}")
    else()
      list(APPEND sources "${CMAKE_CURRENT_SOURCE_DIR}/${source}")
    endif()
  endforeach()

  if(APPLE)
    find_package(XCTest REQUIRED)
    create_xctest_bundle(${target} "xctest_" "${sources}")

    add_executable(${test_target} ${sources})
    target_link_libraries(${test_target} ${target})
    target_link_directories(${test_target} PRIVATE "$<TARGET_BUNDLE_DIR:${target}>/")
    set_target_properties(test${target} PROPERTIES
      # Add the path for XCTest
      XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "$(PLATFORM_DIR)/Developer/Library/Frameworks/"
      XCODE_ATTRIBUTE_OTHER_LDFLAGS "-rpath $(PLATFORM_DIR)/Developer/Library/Frameworks/"
      XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "-Onone")

    install(TARGETS ${test_target} DESTINATION .)
  else()
    get_swiftc_arguments(${target} swift_link_libraries)

    set(BUILD_ARGUMENTS
      -emit-executable
      -o ${test_target}
      -L$<TARGET_FILE_DIR:${target}>
      -I$<TARGET_FILE_DIR:${target}>
      -l${target}
      -lstdc++
      "${swift_link_libraries}"
      -enable-testing
      -Xlinker -rpath -Xlinker "'$$ORIGIN'")

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if(uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
      set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif()

    add_custom_target(${test_target} ALL DEPENDS ${target}
      COMMAND swiftc "${BUILD_ARGUMENTS}" ${sources}
      WORKING_DIRECTORY $<TARGET_FILE_DIR:${target}>
      COMMAND_EXPAND_LISTS)

    install(PROGRAMS "$<TARGET_FILE_DIR:${target}>/${test_target}" DESTINATION .)
  endif()
endfunction()

function(create_xctest_bundle target tests_name sources)
  set(TEST_TARGET "${tests_name}${target}")
  message(STATUS "Test target : ${TEST_TARGET}")
  xctest_add_bundle(${TEST_TARGET} ${target} ${sources})
  set(XCODE_LD_RUNPATHS "$<TARGET_BUNDLE_DIR:${target}>/")
  if(CMAKE_CROSSCOMPILING)
    set(XCODE_LD_RUNPATHS "${XCODE_LD_RUNPATHS} \
      @loader_path/Frameworks/")
  else()
    set(XCODE_LD_RUNPATHS "${XCODE_LD_RUNPATHS} \
      @loader_path/../Frameworks/")
  endif()
  set_target_properties(${TEST_TARGET} PROPERTIES
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "${XCODE_LD_RUNPATHS}"
    XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=Debug] "YES"
    XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=RelWithDebInfo] "YES"
    XCODE_ATTRIBUTE_ENABLE_TESTABILITY[variant=Debug] "YES"
    XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "-Onone")
endfunction()
