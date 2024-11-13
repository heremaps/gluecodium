# Copyright (C) 2021 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_symbols_after_build.cmake)

get_supported_gluecodium_generators(_gluecodium_generators)

if(swift IN_LIST _gluecodium_generators)
  enable_language(Swift)
elseif(NOT dart IN_LIST _gluecodium_generators)
  return()
endif()

set(GLUECODIUM_DART_LIBRARY_NAME_DEFAULT "DartLibrary")

function(_check_symbol_for_platform _target _expected_dart_symbol _expected_swift_symbol)
  if(dart IN_LIST _gluecodium_generators)
    check_symbols_after_build(${_target} EXPECT_EXIST "${_expected_dart_symbol}")
  endif()

  if(swift IN_LIST _gluecodium_generators)
    check_symbols_after_build(${_target} EXPECT_EXIST "${_expected_swift_symbol}")
  endif()
endfunction()

function(_setup_framework_if_swift _target)
  if(swift IN_LIST _gluecodium_generators)
    set(MACOSX_FRAMEWORK_NAME ${_target})
    set_target_properties(${_target} PROPERTIES FRAMEWORK TRUE XCODE_ATTRIBUTE_DEFINES_MODULE YES)
  endif()
endfunction()

function(_create_and_configure_target _target _expected_dart_symbol _expected_swift_symbol)
  add_library(${_target} SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
  target_link_libraries(${_target} PRIVATE Threads::Threads)
  gluecodium_generate(${_target} GENERATORS ${_gluecodium_generators})
  gluecodium_target_lime_sources(${_target} PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

  _check_symbol_for_platform(${_target} ${_expected_dart_symbol} ${_expected_swift_symbol})
  _setup_framework_if_swift(${_target})
endfunction()

# Target's name is used as internal prefix in case if nothing is specified
_create_and_configure_target(SingleModule1 "DartLibrary_SingleModule1MapOf_String_to_String*"
                             "SingleModule1MapOf__String_To__String*")

# When OUTPUT_NAME is changed then it's used as internal prefix in case if no
# GLUECODIUM_INTERNAL_PREFIX is specified
_create_and_configure_target(SingleModule2 "DartLibrary_RenamedOutputName1MapOf_String_to_String*"
                             "RenamedOutputName1MapOf__String_To__String*")
set_target_properties(SingleModule2 PROPERTIES OUTPUT_NAME "RenamedOutputName1")

# When GLUECODIUM_INTERNAL_PREFIX is overwritten then it's used as internal prefix
_create_and_configure_target(
  SingleModule3 "DartLibrary_RenamedInternalPrefixMapOf_String_to_String*"
  "RenamedInternalPrefixMapOf__String_To__String*")
set_target_properties(SingleModule3 PROPERTIES GLUECODIUM_INTERNAL_PREFIX "RenamedInternalPrefix")

# When GLUECODIUM_INTERNAL_PREFIX is set before gluecodium_generate then it's not spoiled and used
# as internal prefix
add_library(SingleModule4 SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
set_target_properties(SingleModule4 PROPERTIES GLUECODIUM_INTERNAL_PREFIX "RenamedInternalPrefix")
target_link_libraries(SingleModule4 PRIVATE Threads::Threads)
gluecodium_generate(SingleModule4 GENERATORS ${_gluecodium_generators})
gluecodium_target_lime_sources(SingleModule4 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")
_setup_framework_if_swift(SingleModule4)
_check_symbol_for_platform(SingleModule4 "DartLibrary_RenamedInternalPrefixMapOf_String_to_String*"
                           "RenamedInternalPrefixMapOf__String_To__String*")

# When global default prefix is specified then it's used as internal prefix
set(GLUECODIUM_INTERNAL_PREFIX_DEFAULT "DefaultInternalPrefix")
_create_and_configure_target(
  SingleModule5 "DartLibrary_DefaultInternalPrefixMapOf_String_to_String*"
  "DefaultInternalPrefixMapOf__String_To__String*")
unset(GLUECODIUM_INTERNAL_PREFIX_DEFAULT)

# Tests for obsolete CMakes

set(GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL ON)

# Target's name is used as internal prefix in case if nothing is specified
_create_and_configure_target(SingleModule6 "DartLibrary_SingleModule6MapOf_String_to_String*"
                             "SingleModule6MapOf__String_To__String*")

# If OUTPUT_NAME is set before gluecodium_generate then it's used as internal prefix
add_library(SingleModule7 SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
set_target_properties(SingleModule7 PROPERTIES OUTPUT_NAME "RenamedOutputName2")
target_link_libraries(SingleModule7 PRIVATE Threads::Threads)
gluecodium_generate(SingleModule7 GENERATORS ${_gluecodium_generators})
gluecodium_target_lime_sources(SingleModule7 PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")
_setup_framework_if_swift(SingleModule7)
_check_symbol_for_platform(SingleModule7 "DartLibrary_RenamedOutputName2MapOf_String_to_String*"
                           "RenamedOutputName2MapOf__String_To__String*")
