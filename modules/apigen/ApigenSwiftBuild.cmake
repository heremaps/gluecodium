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
# This module builds Swift code and runs optional tests. It also generates an
# iOS framework and installs it accordingly.
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
    set(options)
    set(oneValueArgs)
    set(multiValueArgs TESTS)
    cmake_parse_arguments(apigen_swift_build "${options}" "${oneValueArgs}"
        "${multiValueArgs}" ${ARGN})

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

    if(NOT ${GENERATOR} MATCHES swift)
            return()
    endif()

    # Transpiler invocations for different generators need different output directories
    # as the transpiler currently wipes the directory upon start.
    set(APIGEN_SWIFT_BUILD_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-swift-build)
    set(APIGEN_TRANSPILER_C_BRIDGE_SOURCE_DIR ${OUTPUT_DIR}/cbridge/${target})
    set(APIGEN_SWIFT_FRAMEWORK_ZIP ${CMAKE_CURRENT_BINARY_DIR}/${target}.framework.zip)
    set(FRAMEWORK_VERSION A)

    # Attach properties to target for re-use in other modules
    set_target_properties(${target} PROPERTIES
        APIGEN_SWIFT_BUILD_OUTPUT_DIR ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

    # Arrange transpiler-generated files acordingly..
    file(COPY ${OUTPUT_DIR}/swift/
        DESTINATION ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Source/)

    # For each submodule there needs to be a modulemap created
    file(GLOB swift_modules LIST_DIRECTORIES true ${OUTPUT_DIR}/swift/*)
    set(swift_module_includes)
    foreach(module_path IN LISTS swift_modules)
        get_filename_component(MODULE_NAME "${module_path}" NAME)
        set(MODULE_DIR ${OUTPUT_DIR}/cbridge/${MODULE_NAME})
        file(GLOB cbridge_headers ${MODULE_DIR}/*.h)

        set(MODULE_HEADERS)
        foreach(header IN LISTS cbridge_headers)
            set(MODULE_HEADERS "${MODULE_HEADERS}\n    header \"${header}\"")
        endforeach()
        configure_file(${APIGEN_SWIFT_DIR}/cbridge.modulemap.in
            ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Modules/${MODULE_NAME}/module.modulemap)
        list(APPEND swift_module_includes -IModules/${MODULE_NAME})
    endforeach()

    configure_file(${APIGEN_SWIFT_DIR}/framework.modulemap.in
        ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework/Versions/A/Modules/module.modulemap)

    set(MACOSX_FRAMEWORK_NAME ${target})
    set(MACOSX_FRAMEWORK_ICON_FILE)
    #TODO APIGEN-347 make this configurable
    set(MACOSX_FRAMEWORK_IDENTIFIER com.here.ivi.${target})
    set(MACOSX_FRAMEWORK_BUNDLE_VERSION ${FRAMEWORK_VERSION})
    set(MACOSX_FRAMEWORK_SHORT_VERSION_STRING ${FRAMEWORK_VERSION})
    configure_file(${APIGEN_SWIFT_DIR}/MacOSXFrameworkInfo.plist.in
        ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework/Versions/${FRAMEWORK_VERSION}/Info.plist)

    function(create_framework_structure)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
                ${target}.framework/Versions/${FRAMEWORK_VERSION}/Headers
                ${target}.framework/Versions/${FRAMEWORK_VERSION}/Modules/${target}.swiftmodule
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E create_symlink
                ${FRAMEWORK_VERSION} Current
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework/Versions)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Headers Headers
            COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Modules Modules
            COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/${target} ${target}
            COMMAND ${CMAKE_COMMAND} -E create_symlink Versions/Current/Info.plist Info.plist
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework)
    endfunction()


    function(build_swift TARGET_ARCHITECTURE)
        if(IOS_DEPLOYMENT_TARGET)
            set(full_target ${TARGET_ARCHITECTURE}-apple-ios${IOS_DEPLOYMENT_TARGET})
            message(INFO "Cross compiling for target ${full_target}")
            set(swift_target_flag -target ${full_target} -sdk ${CMAKE_OSX_SYSROOT})
        else()
            message(INFO "Compiling for target ${TARGET_ARCHITECTURE})")
            set(swift_target_flag -target-cpu ${TARGET_ARCHITECTURE})
        endif()

        set(BUILD_ARGUMENTS
            ${swift_module_includes}
            -I${OUTPUT_DIR}
            -import-underlying-module
            -L\$<TARGET_FILE_DIR:${target}>
            -l${target}
            ${swift_target_flag})
        # OSX needs additional -lc++
        if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            list(APPEND BUILD_ARGUMENTS -lc++)
        endif()

        set(module_file_path ${target}.framework/Modules/${target}.swiftmodule/${TARGET_ARCHITECTURE})
        set(EMIT_ARGUMENTS
            -emit-module
            -emit-module-path ${module_file_path}
            -emit-objc-header
            -emit-objc-header-path ${target}.framework/Headers/${target}.h
            -emit-library
            -o lib${target}.${TARGET_ARCHITECTURE}
            -embed-bitcode)

        file(GLOB_RECURSE SOURCES ${OUTPUT_DIR}/swift/${target}/*.swift)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND swiftc ${BUILD_ARGUMENTS} ${EMIT_ARGUMENTS} ${SOURCES}
            COMMAND ${CMAKE_COMMAND} -E rename ${module_file_path} ${module_file_path}.swiftmodule
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
        # Optionally build test if they where supplied as parameters
        if(NOT ${apigen_swift_build_TESTS} STREQUAL "")
            # Prepare and copy module-specific files
            configure_file(${APIGEN_SWIFT_DIR}/Package.swift.in
                ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/Package.swift)

            foreach(test_dir ${apigen_swift_build_TESTS})
                file(COPY ${test_dir} DESTINATION ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
            endforeach(test_dir)

            prefix_arguments(BUILD_ARGUMENTS "-Xswiftc" ${BUILD_ARGUMENTS})
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND swift test ${BUILD_ARGUMENTS}
                WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}
                COMMENT "Running Swift test for target '${target}'...")
        endif()

        install(DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework
                DESTINATION .)
    endfunction(build_swift)

    function(create_fat_lib)
        set(framework_lib_dir "${target}.framework/Versions/${FRAMEWORK_VERSION}")
        set(framework_lib "${framework_lib_dir}/${target}")
        set(libs)
        foreach(arch IN LISTS ARGN)
            list(APPEND libs lib${target}.${arch})
        endforeach()

        # On Mac create a proper fat binary
        if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND lipo ${libs} -create -output "${framework_lib}"
                COMMAND install_name_tool -id "@rpath/${framework_lib}" "${framework_lib}"
                WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
        # On linux just copy the library to the target
        else()
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different ${libs} "${framework_lib_dir}"
                WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
        endif()
    endfunction()

    create_framework_structure()
    if (CMAKE_CROSSCOMPILING)
        foreach(TARGET_ARCH IN LISTS CMAKE_OSX_ARCHITECTURES)
            build_swift("${TARGET_ARCH}")
        endforeach()
        create_fat_lib(${CMAKE_OSX_ARCHITECTURES})
    else()
        build_swift(${CMAKE_SYSTEM_PROCESSOR})
        create_fat_lib(${CMAKE_SYSTEM_PROCESSOR})
    endif()

endfunction(apigen_swift_build)
