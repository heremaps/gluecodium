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

#[========================================[.rst:

==========
transpiler
==========

.. command:: transpiler

The general form of the command is:

::

   transpile(target inputDir outputDir)

This function invokes the API transpiler based on a set of of input *.fidl
files and puts the generated API sources into outputDir.


#]========================================]

function(transpile target input output)

    message(STATUS "Transpile target '${target}'
    Input: '${input}'
    Output: '${output}'")

    add_custom_target(transpile_${target}
        WORKING_DIRECTORY ${TRANSPILER_DIR}
        COMMAND ${TRANSPILER_GRADLE_WRAPPER} run -Dexec.args=\"-input ${input} -output ${output} -nostdout\")

    add_dependencies(${target} transpile_${target})

endfunction(transpile)
