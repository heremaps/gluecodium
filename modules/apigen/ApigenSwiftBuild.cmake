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

include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftFrameworkStructure.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftCompile.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftModulemap.cmake)

#.rst:
# apigen_swift_build
# -------------------
#
# This module build the framework binary
# a swift framework.
#
# .. command:: apigen_swift_build
#
# The general form of the command is::
#
#     apigen_swift_build(target)
#

function(apigen_swift_build target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)

    if(NOT ${GENERATOR} MATCHES swift)
        return()
    endif()

    apigen_swift_modulemap(${target})

    if (CMAKE_CROSSCOMPILING)
        if (IOS)
            set(ARCHITECTURES ${IOS_ARCH})
        else()
            set(ARCHITECTURES ${CMAKE_OSX_ARCHITECTURES})
        endif()

        foreach(TARGET_ARCH IN LISTS ARCHITECTURES)
            message(INFO "[Swift] COMPILING ${target} ${TARGET_ARCH}")
            apigen_swift_compile(${target} "${TARGET_ARCH}")
        endforeach()

        set_target_properties(${target} PROPERTIES APIGEN_SWIFT_BUILD_ARCH "${ARCHITECTURES}")
        message(INFO "[Swift] FAT ${target} ${ARCHITECTURES}")
    else()
        message(INFO "[Swift] COMPILING ${target} ${CMAKE_SYSTEM_PROCESSOR}")
        apigen_swift_compile(${target} ${CMAKE_SYSTEM_PROCESSOR})
        set_target_properties(${target} PROPERTIES APIGEN_SWIFT_BUILD_ARCH ${CMAKE_SYSTEM_PROCESSOR})
    endif()

endfunction(apigen_swift_build)
