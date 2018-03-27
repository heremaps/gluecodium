# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenTranspile)
    return()
endif()
set(includeguard_ApigenTranspile ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenTranspile
# ---------------
#
# This module provides functions to transpile API interfaces specified
# in the Franca language into target source code as provided by the
# specified generator(s). Valid generators are:
#
#  * android
#  * cbridge
#  * cpp
#  * swift
#
# .. command:: apigen_transpile
#
# The general form of the command is::
#
#     apigen_transpile(target inputDir generator)
#
# This function invokes the API transpiler based on a set of of input *.fidl
# files with a specific target language generator.

find_package(Java COMPONENTS Runtime REQUIRED)
set(APIGEN_TRANSPILER_DIR ${CMAKE_CURRENT_LIST_DIR}/transpiler)
if (WIN32)
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew.bat)
else()
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew)
endif()

function(apigen_transpile)
    set(options VALIDATE_ONLY)
    set(oneValueArgs TARGET GENERATOR VERSION
            ANDROID_MERGE_MANIFEST
            JAVA_PACKAGE
            COPYRIGHT_HEADER
            CPP_INTERNAL_NAMESPACE)
    set(multiValueArgs FRANCA_SOURCES)
    cmake_parse_arguments(apigen_transpile "${options}" "${oneValueArgs}"
                                           "${multiValueArgs}" ${ARGN})

    set(operationVerb "Transpile")
    set(validateParam "")
    if(${apigen_transpile_VALIDATE_ONLY})
        set(operationVerb "Validate")
        set(validateParam "-validateOnly")
    endif()

    # If version is not specified explicitly, use latest-greatest
    if(NOT apigen_transpile_VERSION)
        set(apigen_transpile_VERSION +)
    endif()

    message(STATUS "${operationVerb} '${apigen_transpile_TARGET}' with '${apigen_transpile_GENERATOR}' generator using transpiler version '${apigen_transpile_VERSION}'
    Input: '${apigen_transpile_FRANCA_SOURCES}'")

    # Transpiler invocations for different generators need different output directories
    # as the transpiler currently wipes the directory upon start.
    set(TRANSPILER_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${apigen_transpile_GENERATOR}-transpile)

    # Attach properties to target for re-use in other modules
    set_target_properties(${apigen_transpile_TARGET} PROPERTIES
        APIGEN_TRANSPILER_GENERATOR ${apigen_transpile_GENERATOR}
        APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR ${TRANSPILER_OUTPUT_DIR})

    if(NOT apigen_transpile_GENERATOR MATCHES cpp)
        # This can be optimized. If a previous invocation of this function already
        # transpiled 'cpp', it should be re-used. At the moment this is not possible
        # because the transpiler cleans it's output directory in the beginning
        set(apigen_transpile_GENERATOR "cpp,${apigen_transpile_GENERATOR}")
    endif()

    # Trigger a re-configure if there are any changes to the franca sources. This will run the Transpiler. Only works if files were specified individually.
    set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${apigen_transpile_FRANCA_SOURCES})

    # Build transpiler command-line
    set(APIGEN_TRANSPILER_ARGS "\
 -output \"${TRANSPILER_OUTPUT_DIR}\"\
 -generators ${apigen_transpile_GENERATOR}\
 ${validateParam}\
 ${mergeManifest}\
 -nostdout -enableCaching -timeLogging")
    foreach(input ${apigen_transpile_FRANCA_SOURCES})
        # Attach sources to target for IDEs to display them properly in their projects
        file(GLOB_RECURSE inputFrancaSources ${input}/*.fidl ${input}/*.fdepl)
        if(inputFrancaSources)
            target_sources(${apigen_transpile_TARGET} PRIVATE ${inputFrancaSources})
        endif()

        if (NOT IS_ABSOLUTE ${input})
            set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
        endif()
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -input \"${input}\"")
    endforeach()
    if(apigen_transpile_ANDROID_MERGE_MANIFEST)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -androidMergeManifest ${apigen_transpile_ANDROID_MERGE_MANIFEST}")
    endif()
    if(apigen_transpile_JAVA_PACKAGE)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -javapackage ${apigen_transpile_JAVA_PACKAGE}")
    endif()
    if(apigen_transpile_COPYRIGHT_HEADER)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -copyrightHeader ${apigen_transpile_COPYRIGHT_HEADER}")
    endif()
    if(apigen_transpile_CPP_INTERNAL_NAMESPACE)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -cppInternalNamespace ${apigen_transpile_CPP_INTERNAL_NAMESPACE}")
    endif()

    execute_process(
        COMMAND ${CMAKE_COMMAND} -E make_directory ${TRANSPILER_OUTPUT_DIR} # otherwise java.io.File won't have permissions to create files at configure time
        COMMAND ${APIGEN_TRANSPILER_GRADLE_WRAPPER} -Pversion=${apigen_transpile_VERSION} run -Dexec.args=${APIGEN_TRANSPILER_ARGS}
        WORKING_DIRECTORY ${APIGEN_TRANSPILER_DIR}
        RESULT_VARIABLE TRANSPILE_RESULT)
    if(NOT "${TRANSPILE_RESULT}" STREQUAL "0")
        message(FATAL_ERROR "Failed to transpile given FIDL files.")
    endif()

endfunction(apigen_transpile)
