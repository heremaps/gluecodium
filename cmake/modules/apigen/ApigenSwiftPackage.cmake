# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftPackage)
return()
endif()
set(includeguard_ApigenSwiftPackage ON)

cmake_minimum_required(VERSION 3.5)

include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftFatLibrary.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftFrameworkInfoPlist.cmake)

#.rst:
# apigen_swift_package
# -------------------
#
# This module execute post operations when the build process has finished.
#
# .. command:: apigen_swift_package
#
# The general form of the command is:
#
#     apigen_swift_swift_package(target)
#

function(apigen_swift_package target)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_package() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    apigen_swift_fat_library(${target})
    apigen_swift_framework_info_plist(${target})

endfunction(apigen_swift_package)