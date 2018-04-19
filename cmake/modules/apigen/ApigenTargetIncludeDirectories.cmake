# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenTargetIncludeDirectories)
  return()
endif()
set(includeguard_ApigenTargetIncludeDirectories ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenTargetIncludeDirectories
# ------------------------------
#
# This module attaches additional include directories to the provided target.
# These might differ depending on the previously used generator (cpp, android,
# swift, etc.). This module depends on apigen_generate() to have been run on
# the target first.
#
# .. command:: apigen_target_include_directories
#
# The general form of the command is::
#
#   apigen_target_include_directories(target)
#

function(apigen_target_include_directories target)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)

  if(${GENERATOR} STREQUAL cpp)

    # If generator exactly matches 'cpp' the user intended C++ only
    target_include_directories(${target}
      PUBLIC $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>
      PRIVATE $<BUILD_INTERFACE:${OUTPUT_DIR}>)

  elseif(${GENERATOR} MATCHES android)

    # Android library targets need the cpp and JNI headers to compile
    # but should not expose those to the public.
    target_include_directories(${target}
      PRIVATE $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>
      PRIVATE $<BUILD_INTERFACE:${OUTPUT_DIR}>) # JNI headers and sources

    # Check if we are doing a host build (no cross compilation)
    if(NOT(${CMAKE_SYSTEM_NAME} STREQUAL "Android"))
      find_package(JNI REQUIRED)
      target_include_directories(${target}
        PRIVATE $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
    endif()

  elseif(${GENERATOR} MATCHES swift)

    # Swift targets need the cpp and c_bridge headers to compile
    # but should not expose those to the public.
    target_include_directories(${target}
      PRIVATE $<BUILD_INTERFACE:${OUTPUT_DIR}/cpp/include>
      # There are file name conflicts between cbridge and cbridge_internal so the top folder
      # needs to be added to have cbridge/cbridge_internal as part of the include path
      PRIVATE $<BUILD_INTERFACE:${OUTPUT_DIR}>)
  else()
    message(FATAL_ERROR "apigen_target_include_directories() cannot match the generator '${GENERATOR}'")
  endif()

endfunction()
