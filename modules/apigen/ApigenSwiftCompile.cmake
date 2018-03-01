# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftCompile)
    return()
endif()
set(includeguard_ApigenSwiftCompile ON)

cmake_minimum_required(VERSION 3.5)

set(MINIMAL_CLANG_VERSION 5.0)
if (NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang") OR CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.0)
    message(FATAL_ERROR "Clang compiler version > ${MINIMAL_CLANG_VERSION} is required,"
    "your compiler is ${CMAKE_CXX_COMPILER_ID} version ${CMAKE_CXX_COMPILER_VERSION}\n"
    "On Ubuntu 16.04 you can run\n"
    "apt-get install clang-${MINIMAL_CLANG_VERSION}\n"
    "update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang 100\n"
    "update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang++ 100\n
    and then do a clean rebuild")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/GetLinkLibraries.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftTest.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftFrameworkStructure.cmake)


#.rst:
# apigen_swift_compile
# -------------------
#
# This module create the framework structur and
# compiles and generate the framework binary.
#
# .. command:: apigen_swift_compile
#
# The general form of the command is::
#
#     apigen_swift_compile(target)
#

function(apigen_swift_compile target architecture)

    apigen_swift_framework_structure(${target})

    # TODO APIGEN-849 remove the framework references from this function
    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_compile() depends on apigen_transpiler() configured with generator 'swift'")
    endif()

    set(TARGET_ARCHITECTURE ${architecture})

    if(IOS_DEPLOYMENT_TARGET)
        # If the toolchain does not specify the platform, it uses 'iphone' by default.
        if (NOT XCODE_PLATFORM_SUFFIX)
            set(XCODE_PLATFORM_SUFFIX "ios")
        endif()
        set(full_target ${TARGET_ARCHITECTURE}-apple-${XCODE_PLATFORM_SUFFIX}${IOS_DEPLOYMENT_TARGET})
        message(STATUS "[Swift] Cross compiling for target ${full_target} for ${CMAKE_OSX_SYSROOT}")
        set(swift_target_flag -target ${full_target} -sdk ${CMAKE_OSX_SYSROOT})
    else()
        message(STATUS "[Swift] Compiling for target ${TARGET_ARCHITECTURE})")
        set(swift_target_flag -target-cpu ${TARGET_ARCHITECTURE})
    endif()

    # Determine libraries to pass to swiftc
    get_link_libraries(${target} swift_libraries)
    set(APIGEN_SWIFT_LINK_LIBRARIES ${swift_libraries})
    message(STATUS "Swift enabled ${target} has the following link dependencies: ${swift_libraries}")

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

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if (uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
        set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif ()

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
    elseif(APPLE)
        set(build_swift_native_frameworks -lz -framework AppKit -framework OpenGL)
    endif()

    file(GLOB_RECURSE SOURCES ${OUTPUT_DIR}/swift/*.swift)
    add_custom_command(TARGET ${target} POST_BUILD
    COMMENT "Compiling generated Swift sources -> ${BUILD_ARGUMENTS} ${build_swift_native_frameworks}"
    COMMAND swiftc ${BUILD_ARGUMENTS} ${build_swift_native_frameworks} ${SOURCES}
    WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    apigen_swift_test(${target} ${swift_target_flag})

    if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        install(DIRECTORY ${SWIFT_OUTPUT_DIR}/${target}.framework
                DESTINATION .)
    else()
        install(
            FILES
                "${SWIFT_OUTPUT_DIR}/lib${target}.so"
                "${SWIFT_OUTPUT_DIR}/${target}.swiftmodule"
                "${SWIFT_OUTPUT_DIR}/${target}.swiftdoc"
                "${SWIFT_OUTPUT_DIR}/module.modulemap"
            DESTINATION .)
    endif()


endfunction(apigen_swift_compile)
