# Copyright (C) 2016-2019 HERE Europe B.V.
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

if(DEFINED includeguard_gluecodium_swift_FrameworkBundle)
  return()
endif()
set(includeguard_gluecodium_swift_FrameworkBundle ON)

cmake_minimum_required(VERSION 3.5)

include(${CMAKE_CURRENT_LIST_DIR}/FrameworkInfoPlist.cmake)


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
#     apigen_swift_framework_bundle(TARGET target
#       [ASSET <asset-source-1> <asset-destination-1>]
#       [ASSET <asset-source-2> <asset-destination-2>]
#       [ASSETS asset1 asset2 ... assetN])
#
# The ``ASSETS`` option recursively includes a folder structure using the last source path component
# as the parent of the final asset hierarcy. For example, if you pass ``ASSETS my/folder/fonts``, files
# will end up under ``assets/fonts`` in the resulting Android Archive. Use the ``ASSET`` option if more
# specific control is needed. For example, if you pass ``ASSET my/folder/fonts magicfonts``, files
# will resuide under ``assets/magicfonts`` in the resulting Android Archive.

function(apigen_swift_framework_bundle)
  set(oneValueArgs TARGET)
  set(multiValueArgs ASSET ASSETS)
  cmake_parse_arguments(apigen_swift_framework_bundle
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${apigen_swift_framework_bundle_TARGET} APIGEN_GLUECODIUM_GENERATOR)
  get_target_property(SWIFT_OUTPUT_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_RESOURCES_DIR ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_RESOURCES_DIR)
  get_target_property(SWIFT_FRAMEWORK_NAME ${apigen_swift_framework_bundle_TARGET} APIGEN_SWIFT_FRAMEWORK_NAME)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_framework_bundle() depends on apigen_generate() configured with generator 'swift'")
  endif()

  set(SWIFT_ASSETS_DIRECTORY "$<TARGET_FILE_DIR:${apigen_swift_framework_bundle_TARGET}>/../${SWIFT_FRAMEWORK_NAME}.framework/assets.bundle/Resources/")
  add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${SWIFT_ASSETS_DIRECTORY})

  # Copy the folders that need to be in the bundle.
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

  if(apigen_swift_framework_bundle_ASSET)
    # Iterate over "ASSET source target" pairs and copy sources into asset target folder
    list(LENGTH apigen_swift_framework_bundle_ASSET asset_opt_length)
    math(EXPR asset_opt_length ${asset_opt_length}-1)
    foreach(asset_key_index RANGE 0 ${asset_opt_length} 2)
      list(GET apigen_swift_framework_bundle_ASSET ${asset_key_index} asset_key)
      math(EXPR asset_value_index ${asset_key_index}+1)
      list(GET apigen_swift_framework_bundle_ASSET ${asset_value_index} asset_value)
      set(asset_target ${SWIFT_ASSETS_DIRECTORY}${asset_value})
      get_filename_component(asset_parent ${asset_key} DIRECTORY)
      get_filename_component(asset_name ${asset_key} NAME)
      add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
        COMMAND sh -c
          "mkdir -p ${asset_target} ; (cd ${asset_parent} && find ${asset_name} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${asset_target}; tar xvf -))"
        VERBATIM
        COMMENT "Copying asset '${asset_key}' to '${asset_target}'")
    endforeach()
  endif()

  # Remove any dead links from the above copy. This can happen for generated files that weren't
  # built as part of the dependencies for project.
  add_custom_command(TARGET ${apigen_swift_framework_bundle_TARGET} POST_BUILD
    COMMAND find ${SWIFT_ASSETS_DIRECTORY} -type l -delete)

  apigen_swift_framework_info_plist(${apigen_swift_framework_bundle_TARGET})

endfunction()
