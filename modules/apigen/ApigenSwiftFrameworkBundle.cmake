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

    # copy to bundle target
    foreach(FOLDER ${assets})
        file(GLOB_RECURSE SWIFT_BUNDLE_SRC FOLLOW_SYMLINKS "${FOLDER}/*")    
    endforeach(FOLDER)    
    
    set_source_files_properties(${SWIFT_BUNDLE_SRC} PROPERTIES
        MACOSX_PACKAGE_LOCATION Resources
    )


    add_library(Bundle MODULE ${assets})

    set(BUNDLE_FRAMEWORK_NAME ${target})
    set(BUNDLE_FRAMEWORK_ICON_FILE)
    set(BUNDLE_FRAMEWORK_IDENTIFIER com.here.ivi.bundle.${target})
    set(BUNDLE_FRAMEWORK_BUNDLE_VERSION ${SWIFT_FRAMEWORK_VERSION})
    set(BUNDLE_FRAMEWORK_SHORT_VERSION_STRING ${SWIFT_FRAMEWORK_VERSION})

    configure_file(${SWIFT_RESOURCES_DIR}/BundleFrameworkInfo.plist.in
        ${SWIFT_RESOURCES_DIR}/Info.plist)

    set_target_properties(Bundle PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST ${SWIFT_RESOURCES_DIR}/Info.plist
        XCODE_ATTRIBUTE_PRODUCT_NAME Bundle
        XCODE_ATTRIBUTE_WRAPPER_EXTENSION bundle
        XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
        XCODE_ATTRIBUTE_ENABLE_BITCODE NO
        BUNDLE YES
        LINKER_LANGUAGE C
        LIBRARY_OUTPUT_DIRECTORY ${SWIFT_OUTPUT_DIR}
    )
    # clean up the binary file (no needed)
    add_custom_command(TARGET Bundle POST_BUILD
        COMMAND rm -f ${SWIFT_OUTPUT_DIR}/Bundle.bundle/MacOS
    )
    add_dependencies(${target} Bundle)
    message(STATUS "[Swift] Creating Framework bundle Bundle...")

endfunction(apigen_swift_framework_bundle)