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
#  * stub
#  * swift
#
# .. command:: apigen_transpile
#
# The general form of the command is::
#
#     apigen_transpile(target inputDir outputDir generator)
#
# This function invokes the API transpiler based on a set of of input *.fidl
# files with a specific target language generator.

find_package(Java REQUIRED)
set(APIGEN_TRANSPILER_DIR ${CMAKE_CURRENT_LIST_DIR}/transpiler)
if (WIN32)
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew.bat)
else()
    set(APIGEN_TRANSPILER_GRADLE_WRAPPER ./gradlew)
endif()

function(apigen_transpile target inputDir outputDir generator)

    message(STATUS "Transpile '${target}' with '${generator}' generator
    Input: '${inputDir}'
    Output: '${outputDir}'")

    if(NOT generator MATCHES stub)
        # This can be optimized. If a previous invocation of this function already
        # transpiled 'stub', it should be re-used. At the moment this is not possible
        # because the transpiler cleans it's output directory in the beginning
        set(generator "stub,${generator}")
    endif()

    set(APIGEN_TRANSPILER_ARGS "-input ${inputDir} -output ${outputDir} -generators ${generator} -nostdout")

    execute_process(
        COMMAND mkdir -p ${outputDir} # otherwise java.io.File won't have permissions to create files at configure time
        COMMAND ${APIGEN_TRANSPILER_GRADLE_WRAPPER} run -Dexec.args=${APIGEN_TRANSPILER_ARGS}
        WORKING_DIRECTORY ${APIGEN_TRANSPILER_DIR})

    # Attach properties to target for re-use in other modules
    set_target_properties(${target} PROPERTIES
        APIGEN_TRANSPILER_GENERATOR ${generator}
        APIGEN_TRANSPILER_GENERATOR_INPUT_DIR ${inputDir}
        APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR ${outputDir})

endfunction(apigen_transpile)
