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

if(DEFINED includeguard_gluecodium_TargetLimeSources)
  return()
endif()
set(includeguard_gluecodium_TargetLimeSources ON)

#[===================================================================================================[.rst:
Adds lime sources to a target.
------------------------------

.. command:: gluecodium_target_lime_sources

The general form of the command is::

  gluecodium_target_lime_sources(
    target                                  # The target to add sources to.
    <INTERFACE|PUBLIC|PRIVATE> [items1...]  # All items are passed to `target_sources` CMake
                                            # function. When sources are stored in `PUBLIC`
                                            # or `INTERFACE` scope then CMake propogates them in
                                            # `INTERFACE_SOURCES` default target property and it
                                            # makes possible to use them in dependent target (
                                            # check example below).
                                            # Additionally lime sources are stored in
                                            # `GLUECODIUM_LIME_SOURCES` target property.
  )

Example.
--------

add_library(module_foo SHARED)
gluecodium_generate(module_foo GENERATORS cpp swift)

# This function can be called before OR after `gluecodium_generate`.
gluecodium_target_lime_sources(module_foo
    # Those files will be used to generate code for this target, but won't
    # be exposed as public interface.
    PRIVATE "lime/my_private_class.lime"
    # Those files also will be used to generate code for this target, any
    # target which links to the current may use entities listed here.
    PUBLIC "lime/my_public_class.lime")


add_library(module_bar SHARED)
gluecodium_generate(module_bar GENERATORS cpp swift)

# All files listed here might use entities of module_foo's "lime/my_public_class.lime"
gluecodium_target_lime_sources(module_bar ... )

# Linking to target might be done before OR after gluecodium's functions.
# Vidibility rules are also applied here. I.e. if module_bar links module_foo
# with `PUBLIC` scope then `PUBLIC` lime source of `module_foo` will be used
# to any target which links `module_bar`.
target_link_libraries(module_bar PUBLIC module_foo)

#]===================================================================================================]

function(gluecodium_target_lime_sources _target)
  set(_multi_args PUBLIC PRIVATE INTERFACE)
  cmake_parse_arguments(_args "" "" "${_multi_args}" ${ARGN})

  target_sources(${_target} ${ARGN})

  set_property(
    TARGET ${_target} APPEND PROPERTY GLUECODIUM_LIME_SOURCES ${_args_PUBLIC} ${_args_PRIVATE}
                                      ${_args_INTERFACE} ${_args_UNPARSED_ARGUMENTS})
endfunction()
