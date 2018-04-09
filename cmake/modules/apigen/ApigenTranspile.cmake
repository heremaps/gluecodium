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
# This module provides functions to generate API interfaces specified
# in the Franca language into target source code as provided by the
# specified generator(s). Valid generators are:
#
#  * android
#  * cbridge
#  * cpp
#  * swift
#
# .. command:: apigen_generate
#
# The general form of the command is::
#
#     apigen_generate(target inputDir generator)
#
# This function invokes the Genium tool based on a set of of input *.fidl
# files with a specific target language generator.

find_package(Java COMPONENTS Runtime REQUIRED)
set(APIGEN_TRANSPILER_DIR ${CMAKE_CURRENT_LIST_DIR}/transpiler)
if (WIN32)
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew.bat)
else()
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew)
endif()

function(apigen_generate)
    set(options VALIDATE_ONLY)
    set(oneValueArgs TARGET GENERATOR VERSION
            ANDROID_MERGE_MANIFEST
            JAVA_PACKAGE
            COPYRIGHT_HEADER
            CPP_INTERNAL_NAMESPACE)
    set(multiValueArgs FRANCA_SOURCES)
    cmake_parse_arguments(apigen_generate "${options}" "${oneValueArgs}"
                                          "${multiValueArgs}" ${ARGN})

    set(operationVerb "Generate")
    set(validateParam "")
    if(${apigen_generate_VALIDATE_ONLY})
        set(operationVerb "Validate")
        set(validateParam "-validateOnly")
    endif()

    # If version is not specified explicitly, use latest-greatest
    if(NOT apigen_generate_VERSION)
        set(apigen_generate_VERSION +)
    endif()

    message(STATUS "${operationVerb} '${apigen_generate_TARGET}' with '${apigen_generate_GENERATOR}' generator using Genium version '${apigen_generate_VERSION}'
    Input: '${apigen_generate_FRANCA_SOURCES}'")

    # Genium invocations for different generators need different output directories
    # as Genium currently wipes the directory upon start.
    set(TRANSPILER_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${apigen_generate_GENERATOR}-transpile)

    # Attach properties to target for re-use in other modules
    set_target_properties(${apigen_generate_TARGET} PROPERTIES
        APIGEN_TRANSPILER_GENERATOR ${apigen_generate_GENERATOR}
        APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR ${TRANSPILER_OUTPUT_DIR})

    if(NOT apigen_generate_GENERATOR MATCHES cpp)
        # This can be optimized. If a previous invocation of this function already
        # generated 'cpp', it should be re-used. At the moment this is not possible
        # because Genium cleans it's output directory in the beginning
        set(apigen_generate_GENERATOR "cpp,${apigen_generate_GENERATOR}")
    endif()

    # Trigger a re-configure if there are any changes to the franca sources. This will run the Genium. Only works if files were specified individually.
    set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${apigen_generate_FRANCA_SOURCES})

    # Build Genium tool command-line
    set(APIGEN_TRANSPILER_ARGS "\
 -output \"${TRANSPILER_OUTPUT_DIR}\"\
 -generators ${apigen_generate_GENERATOR}\
 ${validateParam}\
 ${mergeManifest}\
 -nostdout -enableCaching -timeLogging")
    foreach(input ${apigen_generate_FRANCA_SOURCES})
        # Attach sources to target for IDEs to display them properly in their projects
        file(GLOB_RECURSE inputFrancaSources ${input}/*.fidl ${input}/*.fdepl)
        if(inputFrancaSources)
            target_sources(${apigen_generate_TARGET} PRIVATE ${inputFrancaSources})
        endif()

        if (NOT IS_ABSOLUTE ${input})
            set(input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
        endif()
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -input \"${input}\"")
    endforeach()
    if(apigen_generate_ANDROID_MERGE_MANIFEST)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -androidMergeManifest ${apigen_generate_ANDROID_MERGE_MANIFEST}")
    endif()
    if(apigen_generate_JAVA_PACKAGE)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -javapackage ${apigen_generate_JAVA_PACKAGE}")
    endif()
    if(apigen_generate_COPYRIGHT_HEADER)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -copyrightHeader ${apigen_generate_COPYRIGHT_HEADER}")
    endif()
    if(apigen_generate_CPP_INTERNAL_NAMESPACE)
        string(CONCAT APIGEN_TRANSPILER_ARGS ${APIGEN_TRANSPILER_ARGS} " -cppInternalNamespace ${apigen_generate_CPP_INTERNAL_NAMESPACE}")
    endif()

    execute_process(
        COMMAND ${CMAKE_COMMAND} -E make_directory ${TRANSPILER_OUTPUT_DIR} # otherwise java.io.File won't have permissions to create files at configure time
        COMMAND ${APIGEN_TRANSPILER_GRADLE_WRAPPER} -Pversion=${apigen_generate_VERSION} run -Dexec.args=${APIGEN_TRANSPILER_ARGS}
        WORKING_DIRECTORY ${APIGEN_TRANSPILER_DIR}
        RESULT_VARIABLE TRANSPILE_RESULT)
    if(NOT "${TRANSPILE_RESULT}" STREQUAL "0")
        message(FATAL_ERROR "Failed to generate from given FIDL files.")
    endif()

endfunction(apigen_generate)
