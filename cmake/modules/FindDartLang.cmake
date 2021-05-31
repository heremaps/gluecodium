# Copyright (C) 2016-2021 HERE Europe B.V.
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

#[===========================================================================================[.rst:
FindDartLang
------------

Looks for installed Dart SDK.

Path to Dart can be specified with variable `DART_LANG_ROOT`.
Alternativelly path to Flutter might be set with `FLUTTER_ROOT` variable.

Module Variables
^^^^^^^^^^^^^^^^

The following variables are set by including this module:

.. variable:: DARTLANG_FOUND

  True if the dart SDK was found.

.. variable:: DART_LANG_INCLUDE_DIRS

  The directory containing dart sdk headers.

`IMPORTED` targets
^^^^^^^^^^^^^^^^^^

This module defines the following targets:

``DartLang::dart``
  The target which provides include directories to a dart SDK, if found.

For example:

.. code-block:: cmake

  list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")
  # set (DART_LANG_ROOT /optional/path/to/custom/dart)
  find_package(DartLang)
  add_executable(foo)
  target_link_libraries(foo PRIVATE DartLang::dart)

#]===========================================================================================]

if(DEFINED DARTLANG_FOUND)
  return()
endif()

set(_path_suffixes "bin/cache/dart-sdk/include" "bin/cache/dart-sdk/include/third_party/dart"
                   "cache/dart-sdk/include" "cache/dart-sdk/include/third_party/dart" "include")
set(_find_hints ${DART_LANG_ROOT} ${FLUTTER_ROOT})

find_program(_dart_exe dart)
if(_dart_exe)
  get_filename_component(_dart_exe ${_dart_exe} REALPATH)

  get_filename_component(_dart_bin ${_dart_exe} DIRECTORY)
  get_filename_component(_dart_root ${_dart_bin} DIRECTORY)

  list(APPEND _find_hints ${_dart_root})
endif()

find_path(
  DART_LANG_INCLUDE_DIRS
  NAMES "dart_api_dl.h"
  PATH_SUFFIXES ${_path_suffixes}
  HINTS ${_find_hints})

if(DART_LANG_INCLUDE_DIRS)
  set(_dart_include_fixup_dir "${CMAKE_CURRENT_BINARY_DIR}/dart_include_fixup")
  if(NOT EXISTS "${_dart_include_fixup_dir}")
    function(_create_dart_fixup_header include_header_name)
      file(WRITE "${_dart_include_fixup_dir}/include/${include_header_name}"
           "#include <${include_header_name}>")
    endfunction()
    _create_dart_fixup_header("dart_api.h")
    _create_dart_fixup_header("dart_native_api.h")
  endif()

  if(NOT TARGET DartLang::dart)
    add_library(DartLang::dart INTERFACE IMPORTED)
    target_include_directories(
      DartLang::dart INTERFACE $<BUILD_INTERFACE:${DART_LANG_INCLUDE_DIRS}>
                               $<BUILD_INTERFACE:${_dart_include_fixup_dir}>)
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DartLang FOUND_VAR DARTLANG_FOUND REQUIRED_VARS
                                  DART_LANG_INCLUDE_DIRS)
mark_as_advanced(DART_LANG_INCLUDE_DIRS)
