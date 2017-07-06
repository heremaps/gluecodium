# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftBuild)
  return()
endif()
set(includeguard_ApigenSwiftBuild ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenSwiftBuild
# -------------------
#
# This module assembles TODO
#
# .. command:: apigen_swift_build
#
# The general form of the command is::
#
#     apigen_swift_build(target)
#

#TODO: find_package(Swift REQUIRED)

set(APIGEN_SWIFT_DIR ${CMAKE_CURRENT_LIST_DIR}/swift)

function(prefix_arguments output prefix)
    list(REMOVE_AT ARGV 0 1)
    set(prefixed)
    foreach(arg IN LISTS ARGV)
        list(APPEND prefixed ${prefix} ${arg})
    endforeach()
    set(${output} ${prefixed} PARENT_SCOPE)
endfunction()

function(apigen_swift_build target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

    if(${GENERATOR} MATCHES swift)

        # Transpiler invocations for different generators need different output directories
        # as the transpiler currently wipes the directory upon start.
        set(APIGEN_SWIFT_BUILD_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-swift-build)
        set(APIGEN_SWIFT_CBRIDGE_TARGET c_bridge)
        set(APIGEN_TRANSPILER_C_BRIDGE_SOURCE_DIR ${OUTPUT_DIR}/cbridge/${target})
        set(APIGEN_SWIFT_FRAMEWORK_ZIP ${CMAKE_CURRENT_BINARY_DIR}/${target}.framework.zip)

        # Attach properties to target for re-use in other modules
        set_target_properties(${target} PROPERTIES
            APIGEN_SWIFT_BUILD_OUTPUT_DIR ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

        # Prepare and copy module-specific files
        configure_file(${APIGEN_SWIFT_DIR}/Package.swift.in
            ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Package.swift)
        configure_file(${APIGEN_SWIFT_DIR}/module.modulemap.in
            ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Modules/module.modulemap)

        # TODO: Hard-coded, a follow-up function has to parameterize this:
        file(COPY ${CMAKE_SOURCE_DIR}/platforms/ios/Tests 
            DESTINATION ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

        # Arrange transpiler-generated files acordingly..
        file(COPY ${OUTPUT_DIR}/swift/${target}
            DESTINATION ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Source/${target})
        file(COPY ${OUTPUT_DIR}/cbridge/${target}
            DESTINATION ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Source/${APIGEN_SWIFT_CBRIDGE_TARGET}/include
            FILES_MATCHING PATTERN *.h)

        set(SWIFT_ARGUMENTS
            -IModules
            -import-underlying-module
            -L\$<TARGET_FILE_DIR:${target}>
            -l${target})
        # OSX needs additional -lc++
        if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            list(APPEND SWIFT_ARGUMENTS -lc++)
        endif()

        prefix_arguments(BUILD_ARGUMENTS "-Xswiftc" ${SWIFT_ARGUMENTS})
        prefix_arguments(EMIT_ARGUMENTS "-Xswiftc" -emit-module -emit-library -emit-objc-header)

        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND swift test ${BUILD_ARGUMENTS}
            COMMAND swift build ${BUILD_ARGUMENTS} ${EMIT_ARGUMENTS}
            COMMAND ${APIGEN_SWIFT_DIR}/assemble-framework ${target}
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

        install(DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework
            DESTINATION lib)

    endif()

endfunction(apigen_swift_build)
