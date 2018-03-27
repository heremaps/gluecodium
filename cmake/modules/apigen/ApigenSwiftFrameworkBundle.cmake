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
#     apigen_swift_framework_bundle(TARGET target ASSETS asset1 asset2 ... assetN)
#

function(apigen_swift_framework_bundle)
    set(oneValueArgs TARGET)
    set(multiValueArgs ASSETS)
    cmake_parse_arguments(apigen_swift_framework_bundle "${options}" "${oneValueArgs}"
                                           "${multiValueArgs}" ${ARGN})

    get_target_property(GENERATOR ${apigen_swift_framework_bundle_TARGET} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(SWIFT_OUTPUT_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_FRAMEWORK_VERSION)
    get_target_property(SWIFT_RESOURCES_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_RESOURCES_DIR)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_framework_bundle() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    message(STATUS "Assets ${apigen_swift_framework_bundle_ASSETS}")

    add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "$<TARGET_FILE_DIR:${apigen_swift_framework_bundle_TARGET}>/Resources/")
    # Copy the folders that need to be in the bundle.
    set(SWIFT_ASSETS_DIRECTORY
        "$<TARGET_FILE_DIR:${apigen_swift_framework_bundle_TARGET}>/Resources/")
    foreach(FOLDER ${apigen_swift_framework_bundle_ASSETS})
        # NOTE: Resources are symlinked, but some links will be invalid because the targets that
        # build the assets haven't been built. Use tar to transfer the links that are valid to
        # the build directory and preserve the directory hierarchy.
        get_filename_component(FOLDER_PARENT ${FOLDER} DIRECTORY)
        get_filename_component(FOLDER_NAME ${FOLDER} NAME)
        add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
            COMMAND sh -c
                "(cd ${FOLDER_PARENT} && find ${FOLDER_NAME} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${SWIFT_ASSETS_DIRECTORY}; tar xvf -))"
            VERBATIM)
    endforeach()
    # Remove any dead links from the above copy. This can happen for generated files that weren't
    # built as part of the dependencies for project, such as the  shaders.
    add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
        COMMAND find ${SWIFT_ASSETS_DIRECTORY} -type l -delete )

endfunction(apigen_swift_framework_bundle)
