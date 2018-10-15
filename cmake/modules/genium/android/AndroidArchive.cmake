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

if(DEFINED includeguard_genium_android_AndroidArchive)
  return()
endif()
set(includeguard_genium_android_AndroidArchive ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Android Archive module
# ----------------------
#
# This module assembles an Android Archive (*.aar) file for a target.
# It requires that apigen_android_archive(), apigen_java_compile() and
# apigen_java_jar() have been invoked on it first.
#
# .. command:: apigen_android_archive
#
# The general form of the command is::
#
#     apigen_android_archive(TARGET target
#       [NAME <archive-file-name>}
#       [ASSET <asset-source-1> <asset-destination-1>]
#       [ASSET <asset-source-2> <asset-destination-2>]
#       [ASSETS <source-file or folder>]
#       [ADD_JAR <jar-file>]
#       [RESOURCES <resource-folder>])
#
# The ``ASSETS`` option recursively includes a folder structure using the last source path component
# as the parent of the final asset hierarcy. For example, if you pass ``ASSETS my/folder/fonts``, files
# will end up under ``assets/fonts`` in the resulting Android Archive. Use the ``ASSET`` option if more
# specific control is needed. For example, if you pass ``ASSET my/folder/fonts magicfonts``, files
# will resuide under ``assets/magicfonts`` in the resulting Android Archive. If the ``NAME`` option is
# set it will be used to name the resulting *.aar file. Otherwise the ``TARGET`` is used as the base name.


find_package(Java COMPONENTS Development REQUIRED)

function(apigen_android_archive)

  set(options)
  set(oneValueArgs NAME TARGET)
  set(multiValueArgs ASSET ASSETS ADD_JAR RESOURCES)
  cmake_parse_arguments(apigen_android_archive
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${apigen_android_archive_TARGET} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${apigen_android_archive_TARGET} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)

  if(NOT ${GENERATOR} MATCHES "android")
    message(FATAL_ERROR "apigen_android_archive() depends on apigen_android_archiver() configured with generator 'android'")
  endif()

  set(APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-android-archive)
  set(APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/jni/${CMAKE_ANDROID_ARCH_ABI})
  set(APIGEN_ANDROID_ARCHIVE_CLASSES_JAR ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/classes.jar)
  set(APIGEN_ANDROID_ARCHIVE_MANIFEST_XML ${OUTPUT_DIR}/android/AndroidManifest.xml)

  if(apigen_android_archive_NAME)
    set(APIGEN_ANDROID_ARCHIVE ${CMAKE_CURRENT_BINARY_DIR}/${apigen_android_archive_NAME}.aar)
  else()
    set(APIGEN_ANDROID_ARCHIVE ${CMAKE_CURRENT_BINARY_DIR}/${apigen_android_archive_TARGET}.aar)
  endif()

  add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR}
    COMMAND ${CMAKE_COMMAND} ARGS -E copy $<TARGET_FILE:${apigen_android_archive_TARGET}> ${APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR}
    COMMAND ${CMAKE_COMMAND} ARGS -E copy ${APIGEN_ANDROID_ARCHIVE_MANIFEST_XML} ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets/
    COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/res/
    COMMENT "Assembling Android Archive contents...")

  foreach(asset ${apigen_android_archive_ASSETS})
    # NOTE: Resources are symlinked, but some links will be invalid because the targets that
    # build the assets haven't been built. Use tar to transfer the links that are valid to
    # the build directory and preserve the directory hierarchy.
    get_filename_component(asset_parent ${asset} DIRECTORY)
    get_filename_component(asset_name ${asset} NAME)
    add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
      COMMAND sh -c
        "(cd ${asset_parent} && find ${asset_name} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets; tar xvf -))"
      VERBATIM)
  endforeach()

  if(apigen_android_archive_ASSET)
    # Iterate over "ASSET source target" pairs and copy sources into asset target folder
    list(LENGTH apigen_android_archive_ASSET asset_opt_length)
    math(EXPR asset_opt_length ${asset_opt_length}-1)
    foreach(asset_key_index RANGE 0 ${asset_opt_length} 2)
      list(GET apigen_android_archive_ASSET ${asset_key_index} asset_key)
      math(EXPR asset_value_index ${asset_key_index}+1)
      list(GET apigen_android_archive_ASSET ${asset_value_index} asset_value)
      set(asset_target ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets/${asset_value})
      file(MAKE_DIRECTORY ${asset_target})
      get_filename_component(asset_parent ${asset_key} DIRECTORY)
      get_filename_component(asset_name ${asset_key} NAME)
      add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
        COMMAND sh -c
          "(cd ${asset_parent} && find ${asset_name} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${asset_target}; tar xvf -))"
        VERBATIM
        COMMENT "Copying asset '${asset_key}' to '${asset_target}'")
    endforeach()
  endif()

  foreach(resource ${apigen_android_archive_RESOURCES})
    get_filename_component(resource_parent ${resource} DIRECTORY)
    get_filename_component(resource_name ${resource} NAME)
    add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
      COMMAND sh -c
        "(cd ${resource_parent} && find ${resource_name} -exec test -e {} \; -print0 | xargs -0 tar cvfh - | (cd ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/res; tar xvf -))"
      VERBATIM)
  endforeach()

  set_target_properties(${apigen_android_archive_TARGET} PROPERTIES
    APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR ${APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR})

  # Remove any dead links from the above copy. This can happen for generated files that weren't
  # built as part of the dependencies for project.
  add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
    COMMAND find ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}/assets/ -type l -delete)

  get_target_property(APIGEN_JAVA_JAR ${apigen_android_archive_TARGET} APIGEN_JAVA_JAR)
  if(apigen_android_archive_ADD_JAR)
    # Copy all jar content into one folder and create a new jar from there
    set(JAR_MERGE_DIR ${CMAKE_CURRENT_BINARY_DIR}/apigen/${GENERATOR}-jar-merge)
    add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
      COMMAND ${CMAKE_COMMAND} ARGS -E make_directory ${JAR_MERGE_DIR})

    foreach(jar ${APIGEN_JAVA_JAR} ${apigen_android_archive_ADD_JAR})
      add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
        COMMAND ${Java_JAR_EXECUTABLE} -xvf ${jar}
        WORKING_DIRECTORY ${JAR_MERGE_DIR}
        COMMENT "Extracting '${jar}' into '${JAR_MERGE_DIR}'...")
    endforeach()

    add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
      COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_ANDROID_ARCHIVE_CLASSES_JAR} -C ${JAR_MERGE_DIR} .)
  else()
    # Just copy the Genium-generated jar file as there are no others
    add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
      COMMAND ${CMAKE_COMMAND} ARGS -E copy ${APIGEN_JAVA_JAR} ${APIGEN_ANDROID_ARCHIVE_CLASSES_JAR})
  endif()

  add_custom_command(TARGET ${apigen_android_archive_TARGET} POST_BUILD
    COMMAND ${Java_JAR_EXECUTABLE} -cfM ${APIGEN_ANDROID_ARCHIVE} .
    WORKING_DIRECTORY ${APIGEN_ANDROID_ARCHIVE_OUTPUT_DIR}
    COMMENT "Generating Android Archive...")
  install(FILES ${APIGEN_ANDROID_ARCHIVE}
    DESTINATION lib)

endfunction()
