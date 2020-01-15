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

if(DEFINED includeguard_gluecodium_TargetSources)
  return()
endif()
set(includeguard_gluecodium_TargetSources ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# Generated target_sources module
# -------------------------------
#
# This module attaches additional source files to the provided target.
# These might differ depending on the previously used generator (cpp, android,
# swift, etc.). This module depends on apigen_generate() to have been run on
# the target first.
#
# .. command:: apigen_target_sources
#
# The general form of the command is::
#
#     apigen_target_sources(target)
#

function(apigen_target_sources target)
  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(COMMON_OUTPUT_DIR ${target} APIGEN_COMMON_OUTPUT_DIR)
  get_target_property(BUILD_OUTPUT_DIR ${target} APIGEN_BUILD_OUTPUT_DIR)

  set(_source_sets MAIN)
  if(COMMON_OUTPUT_DIR)
    list(APPEND _source_sets COMMON)
  endif()
  apigen_list_generated_sources(_generated_files
    ${_source_sets}
    GENERATOR "${GENERATOR}"
    BUILD_OUTPUT_DIR "${BUILD_OUTPUT_DIR}")
  source_group("Generated Source Files" FILES ${_generated_files})
  target_sources(${target} PRIVATE ${_generated_files})
endfunction()
