# Copyright (C) 2016-2018 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

cmake_minimum_required(VERSION 3.5)

#.rst:
# JazzyApiDocumentation
# ---------------
#
# This module provides functions to generate documentation
# for the iOS public API.
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
