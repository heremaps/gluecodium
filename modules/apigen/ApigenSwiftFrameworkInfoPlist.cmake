# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftFrameworkInfoPlist)
    return()
endif()
set(includeguard_ApigenSwiftFrameworkInfoPlist ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_framework_info_plist
# -------------------
#
# This module builds macos target information
#
# .. command:: apigen_swift_framework_info_plist
#
# The general form of the command is::
#
#     apigen_swift_framework_info_plist(target)
#

function(apigen_swift_framework_info_plist target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
    get_target_property(SWIFT_RESOURCES_DIR ${target} APIGEN_SWIFT_RESOURCES_DIR)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_framework_info_plist() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    set(MACOSX_FRAMEWORK_NAME ${target})
    set(MACOSX_FRAMEWORK_ICON_FILE)
    #TODO APIGEN-347 make this configurable
    set(MACOSX_FRAMEWORK_IDENTIFIER com.here.ivi.${target})
    set(MACOSX_FRAMEWORK_BUNDLE_VERSION ${SWIFT_FRAMEWORK_VERSION})
    set(MACOSX_FRAMEWORK_SHORT_VERSION_STRING ${SWIFT_FRAMEWORK_VERSION})
    configure_file(${SWIFT_RESOURCES_DIR}/MacOSXFrameworkInfo.plist.in
        ${SWIFT_OUTPUT_DIR}/${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Resources/Info.plist)
    message(STATUS "[Swift] Creating Mac OS configuration...")

endfunction(apigen_swift_framework_info_plist)