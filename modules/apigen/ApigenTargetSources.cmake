# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenTargetSources)
  return()
endif()
set(includeguard_ApigenTargetSources ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenTargetSources
# -------------------
#
# This module attaches additional source files to the provided target.
# These might differ depending on the previously used generator (cpp, android,
# swift, etc.). This module depends on apigen_transpile() to have been run on
# the target first.
#
# .. command:: apigen_target_sources
#
# The general form of the command is::
#
#     apigen_target_sources(target)
#

function(apigen_target_sources target)

    get_target_property(GENERATOR ${target} APIGEN_TRANSPILER_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)
    file(GLOB_RECURSE GENERATED_CPP_SOURCES ${OUTPUT_DIR}/cpp/*.cpp)

    if(${GENERATOR} STREQUAL cpp)

        target_sources(${target} PRIVATE ${GENERATED_CPP_SOURCES})

    elseif(${GENERATOR} MATCHES android)

        file(GLOB JNI_SOURCES ${OUTPUT_DIR}/android/jni/*.cpp)
        target_sources(${target} PRIVATE ${JNI_SOURCES} ${GENERATED_CPP_SOURCES})

    elseif(${GENERATOR} MATCHES swift)

        file(GLOB_RECURSE CBRIDGE_SOURCES ${OUTPUT_DIR}/cbridge/*.cpp)
        target_sources(${target} PRIVATE ${CBRIDGE_SOURCES} ${GENERATED_CPP_SOURCES})
        target_include_directories(${target} PRIVATE ${OUTPUT_DIR}/cbridge)

    endif()

endfunction(apigen_target_sources)
