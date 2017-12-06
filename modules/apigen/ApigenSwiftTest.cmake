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
#     apigen_swift_test(target)
#

function(apigen_swift_test target swift_target_flag)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
    get_target_property(SWIFT_RESOURCES_DIR ${target} APIGEN_SWIFT_RESOURCES_DIR)
    get_target_property(SWIFT_TEST ${target} APIGEN_SWIFT_TESTS)

    if(NOT SWIFT_TEST)
        return()
    endif()

    if(NOT ${GENERATOR} MATCHES swift)
        return()
    endif()

    set(BUILD_ARGUMENTS
        ${swift_target_flag}
        -emit-executable
        -o "test${target}"
        -embed-bitcode)

    if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        execute_process(COMMAND xcrun --show-sdk-platform-path
            OUTPUT_VARIABLE XCODE_PLATFORM_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)
        list(APPEND BUILD_ARGUMENTS
            -F${SWIFT_OUTPUT_DIR}
            -Fsystem "${XCODE_PLATFORM_PATH}/Developer/Library/Frameworks/"
            -Xlinker -rpath -Xlinker "${XCODE_PLATFORM_PATH}/Developer/Library/Frameworks/"
            -Xlinker -rpath -Xlinker "@executable_path")
    else()
        list(APPEND BUILD_ARGUMENTS
            -L${SWIFT_OUTPUT_DIR}
            -I${SWIFT_OUTPUT_DIR}
            -l${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>
            -Xlinker -rpath -Xlinker "'$$ORIGIN'")
    endif()

    file(GLOB_RECURSE SOURCES ${SWIFT_TEST}/*.swift)

    add_custom_target(test${target} ALL DEPENDS ${target}
        COMMAND swiftc ${BUILD_ARGUMENTS} ${SOURCES}
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}
        COMMENT "Running Swift test for target '${target}'...")

    add_test(NAME SwiftFunctional COMMAND "${SWIFT_OUTPUT_DIR}/test${target}"
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    install(PROGRAMS "${SWIFT_OUTPUT_DIR}/test${target}" DESTINATION .)

    message(STATUS "[Swift] Creating Test executable...")

endfunction(apigen_swift_test)