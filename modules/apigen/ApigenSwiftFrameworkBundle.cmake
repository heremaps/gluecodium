# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftFrameworkBundle)
    return()
endif()
set(includeguard_ApigenSwiftFrameworkBundle ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_framework_bundle
# -------------------
#
# This module builds a framework bundle to the target.
# The second attribute is an array of paths were the resources must be copy
# in the bundle.
#
# There is no need to create a bundle plist file, because it will be integrated
# in the framework.
#
# .. command:: apigen_swift_framework_bundle
#
# The general form of the command is::
#
#     apigen_swift_framework_bundle(target assets)
#

function(apigen_swift_framework_bundle target assets)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
    get_target_property(SWIFT_RESOURCES_DIR ${target} APIGEN_SWIFT_RESOURCES_DIR)

    if(NOT ${GENERATOR} MATCHES swift)
        return()
    endif()

    message(STATUS "Assets ${SWIFT_BUNDLE_SRC}")

    message(STATUS "[Swift] Creating Framework bundle...")
    add_custom_command(TARGET ${target} POST_BUILD 
        COMMAND mkdir -p "${SWIFT_OUTPUT_DIR}/${target}.framework/Bundle.bundle/"
    )
    
    # Copy the folders that need to be in the bundle.
    foreach(FOLDER ${assets})
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND cp -fR ${FOLDER} 
                "${SWIFT_OUTPUT_DIR}/${target}.framework/Bundle.bundle/")
    endforeach()

endfunction(apigen_swift_framework_bundle)