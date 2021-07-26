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

if(DEFINED includeguard_gluecodium_Generate2)
  return()
endif()
set(includeguard_gluecodium_Generate2 ON)

cmake_minimum_required(VERSION 3.7)

include(${CMAKE_CURRENT_LIST_DIR}/AddGenerateCommand.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetGeneratedSources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetIncludeDirectories.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetCompileDefinitions.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/details/CreateDefaultGenerateTarget.cmake)

#[===================================================================================================[.rst:
Calls sequence of commands to add step to generate sources and configure target's
compilation definitions, includes and sources.
---------------------------------------------------------------------------------

.. command:: gluecodium_generate

Next functions are called:

- `gluecodium_add_generate_command` to add command to generate soources with Gluecodium.
- `gluecodium_target_generated_sources` to add generated sources to a target.
- `gluecodium_target_include_directories` to add includes to folders with generated sources.
- `gluecodium_target_compile_definitions` to add necessary compilation definitions if a
                                          target is `SHARED`.

Please refer to those functions for more documentation.

Also target with name `<target>.gluecodium.generate` is created which triggers
generation of sources if any needs it without compilation.

The general form of the command is::

  gluecodium_generate(<target> [GENERATORS <generator> ...] [MAIN_ONLY] [OUTPUT_DIR <path>])

All arguments are passed to function `gluecodium_add_generate_command`, please refer to this
function for more documentation.

This function works well in scenarios where sources are generated for `SHARED` final targets.
In some scenarios additional calls might be necessary or even function `gluecodium_generate`
should not be used and instead mentioned functions should be used directly.

Example 1. Two shared libraries:

# In simpliest scenario only one `SHARED` library with generated sources is built.
add_library(shared_foo SHARED)
gluecodium_generate(shared_foo GENERATORS cpp swift)

# Add lime sources to generate sources from.
# Refer to the function `gluecodium_target_lime_sources` for more info.
gluecodium_target_lime_sources(shared_foo PUBLIC "lime/foo_class.lime")


# Also simple case when `SHARED` library depends on the another.
add_library(shared_bar SHARED)

# Dependent target should utilise only `MAIN` source set. Please refer
# to function `gluecodium_add_generate_command` for more information.
gluecodium_generate(shared_bar GENERATORS cpp swift MAIN_ONLY)

# Linking to library with generated sources also makes it possible
# to reuse this generated code.
target_link_libraries(shared_bar PRIVATE shared_foo)

# Entities in `bar_class.lime` may reuse entities in `foo_class.lime`
gluecodium_target_lime_sources(shared_foo PUBLIC "lime/bar_class.lime")

# -----------------------------------------------------------------------------

Example 2. Two shared libraries where each contains sources in `OBJECT` and
`INTERFACE` targets:

# For more complex scenario it's recommended to generate and keep generated sources
# in `OBJECT` or `INTERFACE` libraries. It's necessary because Gluecodium generates
# binding functions for some languages (for example Java and Dart) which should be
# exported from final `SHARED` library.
# If it's still necessary to use `STATIC` library then compiler-specific options
# can be used to avoid stripping symbols, see --whole-archive for gcc/clang or
# /WHOLEARCHIVE for MSVC.

add_library(object_with_common_foo OBJECT)
gluecodium_generate(object_with_common_foo GENERATORS cpp swift)
gluecodium_target_lime_sources(object_with_common_foo PUBLIC "lime/foo_class1.lime")

add_library(object_with_main_foo OBJECT)
# As in example 1, only one target should have `COMMON` source set, even if
# those targets are linked to one final `SHARED` library.
gluecodium_generate(object_with_main_foo GENERATORS cpp swift MAIN_ONLY)
gluecodium_target_lime_sources(object_with_main_foo PUBLIC "lime/foo_class2.lime")
target_link_libraries(object_with_main_foo PUBLIC object_with_common_foo)

# Remember that build systems don't like empty targets with linked libraries,
# so some sources should be added here.
add_library(shared_foo SHARED)
target_link_libraries(shared_foo PUBLIC object_with_common_foo object_with_main_foo)

# Since `gluecodium_target_compile_definitions` adds definitions for exporting symbols
# only to `SHARED` target it's necessary to add such definitions manually as shown below,
# using function `gluecodium_get_target_compile_definitions` (refer to this function for
# more info).
gluecodium_get_target_compile_definitions(object_with_common_foo
  RESULT_PUBLIC _public_common RESULT_PRIVATE _private_common)
target_compile_definitions(object_with_common_foo
  PUBLIC ${_public_common} PRIVATE ${_private_common})
gluecodium_get_target_compile_definitions(object_with_main_foo
  RESULT_PUBLIC _public_main RESULT_PRIVATE _private_main)
target_compile_definitions(object_with_main_foo
  PUBLIC ${_public_main} PRIVATE ${_private_main})
# This step is necessary if there are some manually written sources which utilise
# generated by Gluecodium export macros.
target_compile_definitions(shared_foo
  PUBLIC ${_public_common} ${_public_main} PRIVATE ${_private_common} ${_private_main})


add_library(interface_bar INTERFACE)
# Since shared_bar is going to be linked to shared_foo which contains `COMMON` source
# set it should also contain only `MAIN` source set.
gluecodium_generate(interface_bar GENERATORS cpp swift MAIN_ONLY)
# It's better to link to `SHARED` target which exposes necessary public lime files.
target_link_libraries(interface_bar INTERFACE shared_foo)

add_library(shared_bar SHARED)
target_link_libraries(shared_bar PRIVATE interface_bar)

#]===================================================================================================]

function(gluecodium_generate _target)
  gluecodium_add_generate_command(${_target} ${ARGN})

  gluecodium_target_generated_sources(${_target})
  gluecodium_target_include_directories(${_target})
  gluecodium_target_compile_definitions(${_target})

  _gluecodium_create_default_generated_target(${_target})
endfunction()
