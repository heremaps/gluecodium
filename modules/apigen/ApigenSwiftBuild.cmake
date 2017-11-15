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

include(${CMAKE_CURRENT_LIST_DIR}/GetLinkLibraries.cmake)

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
    set(FRAMEWORK_VERSION A)

    # Determine libraries to pass to swiftc
    get_link_libraries(${target} swift_libraries)
    set(APIGEN_SWIFT_LINK_LIBRARIES ${swift_libraries})
    message(INFO "Swift enabled ${target} has the following link dependencies: ${swift_libraries}")

    # Attach properties to target for re-use in other modules
    set_target_properties(${target} PROPERTIES
        APIGEN_SWIFT_BUILD_OUTPUT_DIR ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

    # Add top level headers to the modulemap
    set(CBRIDGE_MODULE_MAP "module ${target} {\n")
    file(GLOB cbridge_headers ${OUTPUT_DIR}/cbridge/*.h)
    foreach(header IN LISTS cbridge_headers)
        set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n    header \"${header}\"")
    endforeach()
    set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n}\n")

    # For each submodule there needs to be a modulemap created
    file(GLOB swift_modules LIST_DIRECTORIES true ${OUTPUT_DIR}/swift/*)
    foreach(module_path IN LISTS swift_modules)
        if(NOT IS_DIRECTORY ${module_path})
            continue()
        endif()
        get_filename_component(SUB_MODULE_NAME "${module_path}" NAME)
        set(MODULE_NAME "${target}.${SUB_MODULE_NAME}")
        set(MODULE_DIR ${OUTPUT_DIR}/cbridge/${SUB_MODULE_NAME})
        file(GLOB cbridge_headers ${MODULE_DIR}/*.h)

        set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\nmodule ${MODULE_NAME} {")
        foreach(header IN LISTS cbridge_headers)
            set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n    header \"${header}\"")
        endforeach()
        set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n}\n")
    endforeach()
    file(WRITE "${OUTPUT_DIR}/module.modulemap" "${CBRIDGE_MODULE_MAP}")

    file(WRITE
        ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework/Versions/${FRAMEWORK_VERSION}/Modules/module.modulemap
        "module ${target} {\n}\n")

    set(MACOSX_FRAMEWORK_NAME ${target})
    set(MACOSX_FRAMEWORK_ICON_FILE)
    #TODO APIGEN-347 make this configurable
    set(MACOSX_FRAMEWORK_IDENTIFIER com.here.ivi.${target})
    set(MACOSX_FRAMEWORK_BUNDLE_VERSION ${FRAMEWORK_VERSION})
    set(MACOSX_FRAMEWORK_SHORT_VERSION_STRING ${FRAMEWORK_VERSION})
    configure_file(${APIGEN_SWIFT_DIR}/MacOSXFrameworkInfo.plist.in
        ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework/Versions/${FRAMEWORK_VERSION}/Info.plist)

    # TODO APIGEN-849 Rather build first and assemble the framework separately
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


    # TODO APIGEN-849 remove the framework references from this function
    function(build_swift TARGET_ARCHITECTURE)
        if(IOS_DEPLOYMENT_TARGET)
            set(full_target ${TARGET_ARCHITECTURE}-apple-ios${IOS_DEPLOYMENT_TARGET})
            message(INFO "Cross compiling for target ${full_target}")
            set(swift_target_flag -target ${full_target} -sdk ${CMAKE_OSX_SYSROOT})
        else()
            message(INFO "Compiling for target ${TARGET_ARCHITECTURE})")
            set(swift_target_flag -target-cpu ${TARGET_ARCHITECTURE})
        endif()

        set(build_swift_LINK_DEPENDENCIES "")
        foreach(library IN LISTS APIGEN_SWIFT_LINK_LIBRARIES)
            set(_outputname $<TARGET_PROPERTY:${library},OUTPUT_NAME>)
            set(_fallbackname $<TARGET_PROPERTY:${library},NAME>)
            set(_has_outputname $<BOOL:${_outputname}>)
            set(_library_name "$<${_has_outputname}:${_outputname}>$<$<NOT:${_has_outputname}>:${_fallbackname}>")
            string(CONCAT build_swift_LINK_DEPENDENCIES ${build_swift_LINK_DEPENDENCIES}
                "-L$<TARGET_LINKER_FILE_DIR:${library}>\t-l${_library_name}$<TARGET_PROPERTY:${library},DEBUG_POSTFIX>\t")
        endforeach()

        set(BUILD_ARGUMENTS
            -I${OUTPUT_DIR}
            -import-underlying-module
            -L\$<TARGET_FILE_DIR:${target}>
            -l${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>
            ${swift_target_flag}
            -emit-module
            -emit-library
            -embed-bitcode
            -module-name ${target})
        # OSX needs additional -lc++ and additional paths to assemble the framework
        if(APPLE)
            set(module_file_path "${target}.framework/Modules/${target}.swiftmodule/${TARGET_ARCHITECTURE}.swiftmodule")
            list(APPEND BUILD_ARGUMENTS
                -lc++
                -o "lib${target}.${TARGET_ARCHITECTURE}"
                -emit-module-path "${module_file_path}"
                )
        endif()
        if(IOS)
            #Todo: This should be properly injected into the function and not hardcoded
            set(build_swift_native_frameworks -lz -framework GLKit -framework OpenGLES)
        endif()

        file(WRITE
            ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/module.modulemap
            "module ${target} {\n}")

        file(GLOB_RECURSE SOURCES ${OUTPUT_DIR}/swift/*.swift)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND swiftc ${BUILD_ARGUMENTS} ${build_swift_native_frameworks} ${build_swift_LINK_DEPENDENCIES} ${SOURCES}
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})

        # TODO APIGEN-849: make this independent from transpiling, like add_swift_executable or similar
        # Optionally build test if they where supplied as parameters
        if(NOT ${apigen_swift_build_TESTS} STREQUAL "")
            set(BUILD_ARGUMENTS
                ${swift_target_flag}
                -emit-executable
                -o "test${target}"
                -embed-bitcode)

            if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
                execute_process(COMMAND xcrun --show-sdk-platform-path
                    OUTPUT_VARIABLE XCODE_PLATFORM_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)
                list(APPEND BUILD_ARGUMENTS
                    -F${APIGEN_SWIFT_BUILD_OUTPUT_DIR}
                    -Fsystem "${XCODE_PLATFORM_PATH}/Developer/Library/Frameworks/"
                    -Xlinker -rpath -Xlinker "${XCODE_PLATFORM_PATH}/Developer/Library/Frameworks/"
                    -Xlinker -rpath -Xlinker "@executable_path"
                )
            else()
                list(APPEND BUILD_ARGUMENTS
                    -L${APIGEN_SWIFT_BUILD_OUTPUT_DIR}
                    -I${APIGEN_SWIFT_BUILD_OUTPUT_DIR}
                    -l${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>
                    -Xlinker -rpath -Xlinker "'$$ORIGIN'"
                )
            endif()

            file(GLOB_RECURSE SOURCES ${apigen_swift_build_TESTS}/*.swift)

            add_custom_target(test${target} ALL DEPENDS ${target}
                COMMAND swiftc ${BUILD_ARGUMENTS} ${SOURCES}
                WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}
                COMMENT "Running Swift test for target '${target}'...")
            add_test(NAME SwiftFunctional COMMAND "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/test${target}"
                WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
            install(PROGRAMS "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/test${target}" DESTINATION .)
        endif()

        if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            install(DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.framework
                    DESTINATION .)
        else()
            install(
                FILES
                    "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/lib${target}.so"
                    "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.swiftmodule"
                    "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/${target}.swiftdoc"
                    "${APIGEN_SWIFT_BUILD_OUTPUT_DIR}/module.modulemap"
                DESTINATION .)
        endif()
    endfunction(build_swift)

    # On Mac create a proper fat binary, on linux do nothing
    function(create_fat_lib)
        if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
            return()
        endif()
        set(framework_lib_dir "${target}.framework/Versions/${FRAMEWORK_VERSION}")
        set(framework_lib "${framework_lib_dir}/${target}")
        set(libs)
        foreach(arch IN LISTS ARGN)
            list(APPEND libs lib${target}.${arch})
        endforeach()

        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND lipo ${libs} -create -output "${framework_lib}"
            COMMAND install_name_tool -id "@rpath/${framework_lib}" "${framework_lib}"
            WORKING_DIRECTORY ${APIGEN_SWIFT_BUILD_OUTPUT_DIR})
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
