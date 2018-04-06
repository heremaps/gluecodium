# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftConfiguration)
    return()
endif()
set(includeguard_ApigenSwiftConfiguration ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenSwiftConfiguration
# -------------------
#
# This module builds configures the Swift framework.
# Defines output and version library and it will added to the
# target to be use later on.
#
# .. command:: apigen_swift_configuration
#
# The general form of the command is::
#
#     apigen_swift_configuration(target)
#

#TODO: find_package(Swift REQUIRED)
set(SWIFT_RESOURCES_DIR ${CMAKE_CURRENT_LIST_DIR}/swift)


function(apigen_swift_configuration target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_configuration() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    # Genium invocations for different generators need different output directories
    # as Genium currently wipes the directory upon start.
    set(SWIFT_BUILD_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-swift-build)
    set(FRAMEWORK_VERSION A)

    # Attach properties to target for re-use in other modules
    set_target_properties(${target} PROPERTIES APIGEN_SWIFT_BUILD_OUTPUT_DIR ${SWIFT_BUILD_OUTPUT_DIR})
    set_target_properties(${target} PROPERTIES APIGEN_SWIFT_FRAMEWORK_VERSION ${FRAMEWORK_VERSION})
    set_target_properties(${target} PROPERTIES APIGEN_SWIFT_RESOURCES_DIR ${SWIFT_RESOURCES_DIR})

    message(STATUS "[Swift] Framework version ${FRAMEWORK_VERSION} will be generated in path ${SWIFT_BUILD_OUTPUT_DIR}")

endfunction(apigen_swift_configuration)
