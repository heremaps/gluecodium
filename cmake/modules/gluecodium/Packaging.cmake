# Copyright (C) 2019 HERE Global B.V.
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

if(DEFINED includeguardapigen_packaging_Packaging)
  return()
endif()
set(includeguardapigen_packaging_Packaging ON)

include(${CMAKE_CURRENT_LIST_DIR}/obsolete/gluecodium/PackagingUtils.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/gluecodium/details/CheckArguments.cmake)
# NOTE: We need to include the platform-specific files inside the function, otherwise certain checks
# (e.g. using clang of a new enough version for Swift) will fail when otherwise unused. Need to
# cache the value of CMAKE_CURRENT_LIST_DIR, otherwise it will use the value of the file calling the
# function.
set(APIGEN_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR})

#[===========================================================================================[.rst:

apigen_create_package
_____________________

Creates a distributable package for Android or Swift with a Gluecodium-generated library.

.. command: apigen_create_package

::

  apigen_create_package(TARGET <target>
                        NAME <name>
                        [EXTRA_SOURCE_DIR <directory>]
                        [ASSET <file> <destintion> [...]]
                        [ASSETS <file-or-folder> [...]]
                        [EXCLUDE_TARGETS <target> [...]]
                        [DEPENDS <target> [...]]
                        [ANDROID_JARS <jar> [...]]
                        [ANDROID_LOCAL_DEPENDENCIES <dependency> [...]]
                        [ANDROID_LOCAL_DEPENDENCIES_DIRS <directory> [...]]
                        [ANDROID_REMOTE_DEPENDENCIES <dependency> [...]]
                        [ANDROID_LIBRARY_LIST <filename>]
                        [SWIFT_FRAMEWORK_IDENTIFIER <name>])


Creates a re-distributable package for Android (.aar) or Swift (.framework) for Gluecodium-generated
libraries. This helps reduce the boiler-plate code for generating these packages once the initial
Gluecodium creation has been done.

The ``NAME`` argument will be used for the name of the generated package. ``EXTRA_SOURCE_DIR`` can
be used to add a directory with custom code for the target platform (Java or Kotlin for Android, or
Swift for Apple) to be compiled into the package.

Assets may be added to the package with the ``ASSET`` or ``ASSETS`` arguments. ``ASSET`` allows you
to copy a file to a specific destination, while ``ASSETS`` lets you specify a list of files to be
copied to the assets directory. Note that ``ASSETS`` will flatten any hierarchy, so using ``ASSET``
with each file/destination pair would be required if you need to preserve a directory structure.

When the package is created, the library for ``TARGET`` and all built shared library dependencies
will be copied. ``EXCLUDE_TARGETS`` may be used to exclude targets and their dependencies from the
package. For example, this may be used to create a package for a plugin to re-use the libraries used
by a core package.

``DEPENDS`` may be used to depend on other Gluecodium-generated libraries. While the Gluecodium-generated
code may not depend on other Gluecodium-generated code, C++ code and hand-written Java/Swift code may
in order to have multiple libraries work with each-other. (e.g. a plugin to a core SDK)

``ANDROID_JARS`` may be used to package additional jars with the Android package. When building
Android code, ``ANDROID_LOCAL_DEPENDENCIES`` can be used to specify which Java dependencies to use,
and ``ANDROID_LOCAL_DEPENDENCIES_DIRS`` can specify the search paths. The "android" library and
Android SDK directory is automatically added to these lists. Dependencies may be downloaded from
the internet with ``ANDROID_REMOTE_DEPENDENCIES``.

When multiple shared libraries are used, it's necessary to load all of them on Android.
``ANDROID_LIBRARY_LIST`` may be used to provide a file name for a text file that has Android library
names, one per line, to load. This may be loaded with custom Java code (provided via
``EXTRA_SOURCE_DIR``) to load the list to determine what libraries to load. This will be embedded as
an asset at the root assets directory.

When building for swift, ``SWIFT_FRAMEWORK_IDENTIFIER`` may be used to customize the identifier of
the framework, typically in the ``com.<company>.<product>`` naming convention.

.. note::

When loading the library list, it's best to load it from the APK directly rather than expanding the
assets and loading it afterward. This prevents an attacker from modifying the locally expanded list
to control what libraries we load.

When building for Swift, EXCLUDE_TARGETS must only contain a single dependency that's also created
as a framework by calling apigen_create_package() on that target. This is due to limitations when
fixing up library search paths so the framework libraries may be loaded properly. Lifting this
limitation would require a much more complicated scheme to detect which libraries belong to which
frameworks.

#]===========================================================================================]

function(apigen_create_package)
  set(single_args TARGET NAME SWIFT_FRAMEWORK_IDENTIFIER)
  set(multi_args
      EXTRA_SOURCE_DIR
      ASSET
      ASSETS
      EXCLUDE_TARGETS
      DEPENDS
      ANDROID_JARS
      ANDROID_LOCAL_DEPENDENCIES
      ANDROID_LOCAL_DEPENDENCIES_DIRS
      ANDROID_REMOTE_DEPENDENCIES
      ANDROID_LIBRARY_LIST)
  cmake_parse_arguments(ARG "" "${single_args}" "${multi_args}" ${ARGN})

  gluecodium_require_argument(ARG TARGET apigen_create_package)
  gluecodium_require_argument(ARG NAME apigen_create_package)
  gluecodium_check_no_unparsed_arguments(ARG apigen_create_package)

  get_target_property(generator ${ARG_TARGET} APIGEN_GENERATOR)
  apigen_packaging_find_shared_library_dependencies(
    all_dependencies dependencies TARGET ${ARG_TARGET} EXCLUDE_TARGETS ${ARG_EXCLUDE_TARGETS})

  if(generator STREQUAL android)
    include(${APIGEN_INCLUDE_DIR}/Android.cmake)

    if(ANDROID_HOME)
      set(android_home ${ANDROID_HOME})
    elseif(DEFINED ENV{ANDROID_HOME})
      set(android_home $ENV{ANDROID_HOME})
    else()
      message(FATAL_ERROR "Must set ANDROID_HOME CMake or environment variable.")
    endif()

    if(ARG_ANDROID_LIBRARY_LIST)
      set(library_names)
      foreach(dep ${dependencies})
        apigen_packaging_lib_name(name ${dep})
        set(library_names "${library_names}${name}\n")
      endforeach()

      apigen_packaging_lib_name(name ${ARG_TARGET})
      set(library_names "${library_names}${name}\n")

      set(library_list_file ${CMAKE_CURRENT_BINARY_DIR}/${ARG_ANDROID_LIBRARY_LIST})
      file(WRITE ${library_list_file} "${library_names}")
      list(APPEND ARG_ASSETS ${library_list_file})
    endif()

    set(local_jars)
    foreach(dep ${ARG_DEPENDS})
      get_target_property(output_dir ${dep} APIGEN_OUTPUT_DIR)
      list(APPEND local_jars ${output_dir}/../android-java-jar/${dep}.jar)
    endforeach()

    apigen_java_compile(
      TARGET ${ARG_TARGET}
      LOCAL_DEPENDENCIES android ${ARG_ANDROID_LOCAL_DEPENDENCIES}
      LOCAL_DEPENDENCIES_DIRS ${android_home}/platforms/${ANDROID_PLATFORM}
                              ${ARG_ANDROID_LOCAL_DEPENDENCIES_DIRS}
      LOCAL_JARS ${local_jars}
      REMOTE_DEPENDENCIES ${ARG_ANDROID_REMOTE_DEPENDENCIES})
    apigen_java_jar(${ARG_TARGET})

    apigen_android_archive(
      TARGET ${ARG_TARGET}
      NAME ${ARG_NAME}
      ADD_JAR ${ARG_ANDROID_JARS}
      ASSET ${ARG_ASSET}
      ASSETS ${ARG_ASSETS})

    # NOTE: These steps must be last.
    if(ARG_EXTRA_SOURCE_DIR)
      get_target_property(generated_output_dir ${ARG_TARGET} APIGEN_OUTPUT_DIR)
      add_custom_command(
        TARGET ${ARG_TARGET} PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${ARG_EXTRA_SOURCE_DIR}
                ${generated_output_dir}/android/)
    endif()

    get_target_property(archive_jni_dir ${ARG_TARGET} APIGEN_ANDROID_ARCHIVE_JNI_OUTPUT_DIR)
    add_custom_command(TARGET ${ARG_TARGET} PRE_BUILD COMMAND ${CMAKE_COMMAND} -E make_directory
                                                              ${archive_jni_dir})
    foreach(dep ${dependencies})
      add_custom_command(TARGET ${ARG_TARGET} PRE_BUILD
                         COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${dep}> ${archive_jni_dir}/)
    endforeach()
  elseif(generator STREQUAL swift AND APPLE)
    include(${APIGEN_INCLUDE_DIR}/Swift.cmake)

    set_target_properties(
      ${ARG_TARGET} PROPERTIES APIGEN_SWIFT_FRAMEWORK_NAME ${ARG_NAME} OUTPUT_NAME ${ARG_NAME})
    if(ARG_SWIFT_FRAMEWORK_IDENTIFIER)
      set_target_properties(${ARG_TARGET} PROPERTIES APIGEN_SWIFT_FRAMEWORK_IDENTIFIER
                                                     ${ARG_SWIFT_FRAMEWORK_IDENTIFIER})
    endif()

    set(local_frameworks)
    set(local_framework_dirs)
    foreach(dep ${ARG_DEPENDS})
      get_target_property(dep_name ${dep} OUTPUT_NAME)
      list(APPEND local_frameworks ${dep_name})
      list(APPEND local_framework_dirs $<TARGET_BUNDLE_DIR:${dep}>/..)
    endforeach()

    if(ARG_EXTRA_SOURCE_DIR)
      file(GLOB_RECURSE extra_sources ${ARG_EXTRA_SOURCE_DIR}/*.swift)
      target_sources(${ARG_TARGET} PRIVATE "${extra_sources}")
    endif()

    # Fixup dependency paths so the loader can find the proper libraries.
    if(all_dependencies)
      # NOTE: fixed-up install names cannot be done with more than one dependency
      set(other_framework_name)
      list(LENGTH ARG_EXCLUDE_TARGETS exclude_targets_len)
      if(exclude_targets_len GREATER 1)
        message(
          FATAL_ERROR "Swift packages currently only support a single EXCLUDE_TARGET argument.")
      elseif(exclude_targets_len EQUAL 1)
        get_target_property(other_framework_name ${ARG_EXCLUDE_TARGETS} APIGEN_SWIFT_FRAMEWORK_NAME)
        if(NOT other_framework_name)
          message(FATAL_ERROR "Swift packages currently require targets passed with \
EXCLUDE_TARGETS to have been created with apigen_create_package()")
        endif()
      endif()

      if(IOS)
        set(lib_dir $<TARGET_BUNDLE_DIR:${ARG_TARGET}>)
        set(search_dir ${ARG_NAME}.framework)
        set(other_search_dir ${other_framework_name}.framework)
      else()
        set(lib_dir $<TARGET_BUNDLE_DIR:${ARG_TARGET}>/Current)
        set(search_dir ${ARG_NAME}.framework/Current)
        set(other_search_dir ${other_framework_name}.framework/Current)
      endif()

      set(fixup_paths_args)
      foreach(dep ${all_dependencies})
        list(FIND dependencies ${dep} this_framework)
        if(this_framework LESS 0)
          list(APPEND fixup_paths_args -change "@rpath/$<TARGET_FILE_NAME:${dep}>"
                      "@rpath/${other_search_dir}/$<TARGET_FILE_NAME:${dep}>")
        else()
          list(APPEND fixup_paths_args -change "@rpath/$<TARGET_FILE_NAME:${dep}>"
                      "@rpath/${search_dir}/$<TARGET_FILE_NAME:${dep}>")
        endif()
      endforeach()

      set(SIGNING_IDENTITY "${CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY}")
      if(SIGNING_IDENTITY STREQUAL "")
        set(SIGNING_IDENTITY "-")
      endif()

      foreach(dep ${dependencies})
        # Resign copied binary, because identity was changed by install_name_tool
        add_custom_command(
          TARGET ${ARG_TARGET}
          POST_BUILD
          COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${dep}> ${lib_dir}
          COMMAND install_name_tool ${fixup_paths_args} ${lib_dir}/$<TARGET_FILE_NAME:${dep}>
          COMMAND codesign -s ${SIGNING_IDENTITY} -fv ${lib_dir}/$<TARGET_FILE_NAME:${dep}>)
      endforeach()
      add_custom_command(TARGET ${ARG_TARGET} POST_BUILD
                         COMMAND install_name_tool ${fixup_paths_args} $<TARGET_FILE:${ARG_TARGET}>)
    endif()

    apigen_swift_build(${ARG_TARGET} FRAMEWORKS ${local_frameworks}
                       FRAMEWORK_DIRS ${local_framework_dirs})
    apigen_swift_framework_bundle(TARGET ${ARG_TARGET} ASSET ${ARG_ASSET} ASSETS ${ARG_ASSETS})
  endif()
endfunction()
