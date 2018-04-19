# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftTest)
  return()
endif()
set(includeguard_ApigenSwiftTest ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_test
# -------------------
#
# This module builds test target information
#
# .. command:: apigen_swift_test
#
# The general form of the command is::
#
#   apigen_swift_test(target)
#

function(apigen_swift_test target swift_target_flag module_name)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_TEST ${target} APIGEN_SWIFT_TESTS)

  if(NOT SWIFT_TEST)
    return()
  endif()

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_test() depends on apigen_generate() configured with generator 'swift'")
  endif()

  file(GLOB_RECURSE SOURCES ${SWIFT_TEST}/*.swift)

  if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    find_package(XCTest REQUIRED)
    xctest_add_bundle(xctest${target} ${target}
    ${SOURCES})
    set_target_properties(xctest${target} PROPERTIES
      XCODE_ATTRIBUTE_SWIFT_VERSION "4.0"
      XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "@loader_path/Frameworks"
      XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=Debug] "YES"
      XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=RelWithDebInfo] "YES"
      XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "-Onone"
      )

    add_executable(test${target} ${SOURCES})
    target_link_libraries(test${target} ${target})
    set_target_properties(test${target} PROPERTIES
      XCODE_ATTRIBUTE_SWIFT_VERSION "4.0"
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
      -Xlinker -rpath -Xlinker "'$$ORIGIN'"
      )

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if(uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
      set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif()

    add_custom_target(test${target} ALL DEPENDS ${target}
      COMMAND swiftc ${BUILD_ARGUMENTS} ${SOURCES}
      WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    install(PROGRAMS "${SWIFT_OUTPUT_DIR}/test${target}" DESTINATION .)
  endif()
endfunction()
