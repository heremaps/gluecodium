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

if(DEFINED includeguard_ApigenSwiftFrameworkBundle)
  return()
endif()
set(includeguard_ApigenSwiftFrameworkBundle ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# apigen_swift_framework_bundle
# -------------------
#
# This module builds a framework bundle to the target.
# The second attribute is an array of paths were the resources must be copy
# in the bundle.
#
# There is no need to create a bundle plist file, because it will be integrated
# in the framework.
#
# .. command:: apigen_swift_framework_bundle
#
# The general form of the command is::
#
#   apigen_swift_framework_bundle(TARGET target ASSETS asset1 asset2 ... assetN)
#

function(apigen_swift_framework_bundle)
  set(oneValueArgs TARGET)
  set(multiValueArgs ASSETS)
  cmake_parse_arguments(apigen_swift_framework_bundle
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${apigen_swift_framework_bundle_TARGET} APIGEN_GENIUM_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_FRAMEWORK_VERSION)
  get_target_property(SWIFT_RESOURCES_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_RESOURCES_DIR)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_framework_bundle() depends on apigen_generate() configured with generator 'swift'")
  endif()

  message(STATUS "Assets ${apigen_swift_framework_bundle_ASSETS}")

  add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "$<TARGET_FILE_DIR:${apigen_swift_framework_bundle_TARGET}>/Resources/")
  # Copy the folders that need to be in the bundle.
  set(SWIFT_ASSETS_DIRECTORY
    "$<TARGET_FILE_DIR:${apigen_swift_framework_bundle_TARGET}>/Resources/")
  foreach(FOLDER ${apigen_swift_framework_bundle_ASSETS})
    # NOTE: Resources are symlinked, but some links will be invalid because the targets that
    # build the assets haven't been built. Use tar to transfer the links that are valid to
    # the build directory and preserve the directory hierarchy.
    get_filename_component(FOLDER_PARENT ${FOLDER} DIRECTORY)
    get_filename_component(FOLDER_NAME ${FOLDER} NAME)
    add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
      COMMAND sh -c
        "(cd ${FOLDER_PARENT} && find ${FOLDER_NAME} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${SWIFT_ASSETS_DIRECTORY}; tar xvf -))"
      VERBATIM)
  endforeach()
  # Remove any dead links from the above copy. This can happen for generated files that weren't
  # built as part of the dependencies for project.
  add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
    COMMAND find ${SWIFT_ASSETS_DIRECTORY} -type l -delete)

endfunction()
