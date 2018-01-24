# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenJavaCompile)
  return()
endif()
set(includeguard_ApigenJavaCompile ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenJavaCompile
# -------------------
#
# This module compiles Java code into *.class files for a target for which
# apigen_transpile($target ... android) was run.
#
# .. command:: apigen_java_compile
#
# The general form of the command is::
#
#     apigen_java_compile(target)
#

find_package(Java COMPONENTS Development REQUIRED)

function(apigen_java_compile target class_path)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

    if(NOT ${GENERATOR} MATCHES "android")
        message(FATAL_ERROR "apigen_java_compile() depends on apigen_transpiler() configured with generator 'android'")
    endif()

    # Transpiler invocations for different generators need different output directories
    # as the transpiler currently wipes the directory upon start.
    set(APIGEN_JAVA_COMPILE_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-java-compile)
    set(APIGEN_TRANSPILER_JAVA_SOURCE_DIR ${OUTPUT_DIR}/android)

    # Attach properties to target for re-use in other modules
    set_target_properties(${target} PROPERTIES
        APIGEN_JAVA_COMPILE_OUTPUT_DIR ${APIGEN_JAVA_COMPILE_OUTPUT_DIR})

    set(CMAKE_JAVA_COMPILE_FLAGS "-source" "1.7" "-target" "1.7" "-cp" "${class_path}")
    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
        COMMAND find ${APIGEN_TRANSPILER_JAVA_SOURCE_DIR} -name *.java | xargs "${Java_JAVAC_EXECUTABLE}" ${CMAKE_JAVA_COMPILE_FLAGS} -d ${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
        COMMENT "Compiling generated Java sources into class files...")

endfunction(apigen_java_compile)
