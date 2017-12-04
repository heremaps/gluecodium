# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftFatLibrary)
    return()
endif()
set(includeguard_ApigenSwiftFatLibrary ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_fat_library
# -------------------
#
# This module crates fat libraries for different architecture
#
# .. command:: apigen_swift_fat_library
#
# The general form of the command is::
#
#     apigen_swift_fat_library(target)
#

function(apigen_swift_fat_library target)

    if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        return()
    endif()

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
    get_target_property(SWIFT_ARCH ${target} APIGEN_SWIFT_BUILD_ARCH)


    # On Mac create a proper fat binary, on linux do nothing
    if(NOT ${GENERATOR} MATCHES swift)
        return()
    endif()

    set(framework_lib_dir "${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}")
    set(framework_lib "${framework_lib_dir}/${target}")
    set(libs lib${target}.${SWIFT_ARCH})

    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND lipo ${libs} -create -output "${framework_lib}"
        COMMAND install_name_tool -id "@rpath/${framework_lib}" "${framework_lib}"
        WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}
        COMMENT "[Swift] Creating Swift fat library ${libs}...")

    message(INFO "[Swift] Fat lib: ${framework_lib}. Output path: ${SWIFT_OUTPUT_DIR}")

endfunction(apigen_swift_fat_library)