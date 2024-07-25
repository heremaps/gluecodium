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

if(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  enable_language(Swift)
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(gluecodium/Gluecodium)

get_supported_gluecodium_generators(_gluecodium_generator)

# Module 1, includes MAIN and COMMON source set
add_library(shared.module.with.common SHARED)
target_sources(
  shared.module.with.common PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp"
  PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")

gluecodium_generate(shared.module.with.common GENERATORS ${_gluecodium_generator})
set_target_properties(shared.module.with.common PROPERTIES GLUECODIUM_SYNCHRONIZE_ACCESS_CLASS_CACHE ON)
gluecodium_target_lime_sources(shared.module.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

# Module 2, includes only MAIN source set and depends on module 1
add_library(shared.module.only.main SHARED)
target_sources(shared.module.only.main PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(shared.module.only.main PRIVATE shared.module.with.common)
gluecodium_target_lime_sources(shared.module.only.main
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")

gluecodium_generate(shared.module.only.main GENERATORS ${_gluecodium_generator} MAIN_ONLY)
