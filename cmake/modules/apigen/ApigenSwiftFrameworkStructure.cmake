# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftFrameworkStructure)
    return()
endif()
set(includeguard_ApigenSwiftFrameworkStructure ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_framework_structure
# -------------------
#
# This module builds basic framework structure. Binary will be added later
#
# .. command:: apigen_swift_framework_structure
#
# The general form of the command is::
#
#     apigen_swift_framework_structure(target)
#
# TODO APIGEN-849 Rather build first and assemble the framework separately

function(apigen_swift_framework_structure target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_framework_structure() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory
        ${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Headers
        ${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Resources
        ${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Modules/${target}.swiftmodule
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E create_symlink
        ${SWIFT_FRAMEWORK_VERSION} Current
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}/${target}.framework/Versions)

    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Headers Headers
        COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Modules Modules
        COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Resources Resources
        COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/${target} ${target}
        # Purposely create a broken symlink
        COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Info.plist Info.plist
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}/${target}.framework
        COMMENT "[Swift] Creating Swift framework structure...")


endfunction(apigen_swift_framework_structure)