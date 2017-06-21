# ============================================================================
#
# Copyright (c) 2017 HERE Global B.V. and its affiliate(s).
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.
#
# ============================================================================

if(DEFINED includeguard_Transpiler)
  return()
endif()
set(includeguard_Transpiler ON)

cmake_minimum_required(VERSION 3.2)
find_package(Java REQUIRED)

set(TRANSPILER_DIR ${CMAKE_CURRENT_LIST_DIR}/transpiler)
if (WIN32)
    set(TRANSPILER_GRADLE_WRAPPER ./gradlew.bat)
else()
    set(TRANSPILER_GRADLE_WRAPPER ./gradlew)
endif()

set(FIDL_INPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/libhello/fidl)
set(OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/libhello/api)
set(TRANSPILER_ARGS "-input ${FIDL_INPUT_DIRECTORY} -output ${OUTPUT_DIRECTORY} -nostdout")

#[========================================[.rst:

==========
transpiler
==========

.. command:: transpiler

The general form of the command is:

::

   transpile()

This function invokes the API transpiler based on a set of of input *.fidl
files from FIDL_INPUT_DIRECTORY and puts the generated API sources into OUTPUT_DIRECTORY.


#]========================================]
function(transpile)

    message(STATUS "Transpile
    Input:  '${FIDL_INPUT_DIRECTORY}'
    Output: '${OUTPUT_DIRECTORY}'")

    execute_process(
        COMMAND mkdir -p ${OUTPUT_DIRECTORY} # otherwise java.io.File won't have permissions to create files at configure time
        COMMAND ${TRANSPILER_GRADLE_WRAPPER} run -Dexec.args=${TRANSPILER_ARGS}
        WORKING_DIRECTORY ${TRANSPILER_DIR})

endfunction(transpile)
