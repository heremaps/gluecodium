# Copyright (C) 2020 HERE Europe B.V.
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

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

get_supported_gluecodium_generators(_gluecodium_generators)

if(NOT dart IN_LIST _gluecodium_generators)
  return()
endif()

# Default namespace
add_library(target.with.warnings SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(target.with.warnings GENERATORS cpp dart)
gluecodium_target_lime_sources(target.with.warnings
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")
