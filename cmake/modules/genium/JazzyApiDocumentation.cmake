# Copyright (c) 2018 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.5)

#.rst:
# JazzyApiDocumentation
# ---------------
#
# This module provides functions to generate documentation
# for the iOS public API of the Mobile SDK.
# Documents generation is done by jazzy tool as a post-build command.
#
# .. command:: jazzy_api_documentation
#
# The general form of the command is::
#
#   jazzy_api_documentation(XCODE_PROJECT_PATH path
#       TARGET target
#       OUTPUT_DIR outputDir
#
# XCODE_PROJECT_PATH specifies the directory with .xcodeproj file that will be used by generator
# TARGET specifies the target that documents generation will be attached to
# OUTPUT_DIR specifies the output directory of the documents generation tool
#
function(jazzy_api_documentation)
  set(options OPTIONAL)
  set(one_value_args XCODE_PROJECT_PATH TARGET OUTPUT_DIR)
  set(multi_value_args "")

  cmake_parse_arguments(
    swift_docs
    "${options}"
    "${one_value_args}"
    "${multi_value_args}"
    "${ARGN}")

  # find jazzy
  find_program(JAZZY_EXECUTABLE NAMES jazzy)

  if(NOT JAZZY_EXECUTABLE)
    message(STATUS "Jazzy tool not found. iOS documentation will not be generated.")
    return()
  endif()

  add_custom_command(
    TARGET ${swift_docs_TARGET}
    POST_BUILD
    COMMAND ${JAZZY_EXECUTABLE}
          --xcodebuild-arguments -target,${swift_docs_TARGET}
          --output ${swift_docs_OUTPUT_DIR}
    COMMENT "Generating iOS documentation"
  )
endfunction()
