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

if(NOT APPLE OR NOT CMAKE_GENERATOR STREQUAL "Xcode")
  return()
endif()

enable_language(Swift)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(gluecodium/Swift)

if(NOT TEST_COMMON_LIBRARY_TYPE)
  set(TEST_COMMON_LIBRARY_TYPE OBJECT)
endif()

if(NOT TEST_MAIN_LIBRARY_TYPE)
  set(TEST_MAIN_LIBRARY_TYPE OBJECT)
endif()

if(TEST_USE_ALIASES)
  set(TARGET_MODULE_WITH_COMMON test::module.with.common)
  set(TARGET_MODULE_ONLY_MAIN test::module.only.main)
else()
  set(TARGET_MODULE_WITH_COMMON module.with.common)
  set(TARGET_MODULE_ONLY_MAIN module.only.main)
endif()

# Module 1, includes MAIN and COMMON source set
add_library(module.with.common ${TEST_COMMON_LIBRARY_TYPE})
add_library(test::module.with.common ALIAS module.with.common)
target_sources(module.with.common PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")

gluecodium_generate(module.with.common GENERATORS swift cpp)
gluecodium_target_lime_sources(module.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

# Module 2, includes only MAIN source set and depends on module 1
add_library(module.only.main ${TEST_MAIN_LIBRARY_TYPE})
add_library(test::module.only.main ALIAS module.only.main)
target_sources(module.only.main PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp"
               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")

target_link_libraries(module.only.main PUBLIC ${TARGET_MODULE_WITH_COMMON})

gluecodium_generate(module.only.main GENERATORS swift cpp MAIN_ONLY)
gluecodium_target_lime_sources(module.only.main
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")

# Final shared module. Xcode doesn't like empty targets and silently ignores them, so dummy source
# file is necessary.
add_library(SharedModule SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.cpp"
                                "${CMAKE_CURRENT_LIST_DIR}/swift/dummy.swift")
target_link_libraries(SharedModule PRIVATE ${TARGET_MODULE_WITH_COMMON} ${TARGET_MODULE_ONLY_MAIN})
set_target_properties(SharedModule PROPERTIES FRAMEWORK TRUE XCODE_ATTRIBUTE_DEFINES_MODULE YES)
if(TEST_USE_COPY_FROM_TARGETS)
  gluecodium_target_swift_sources(
    SharedModule COPY_FROM_TARGETS ${TARGET_MODULE_WITH_COMMON} ${TARGET_MODULE_ONLY_MAIN}
    ADD_MODULE_MODULEMAP)
else()
  gluecodium_target_swift_sources(SharedModule COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
endif()

# Check that generated Swift is compiled in the framework 'SingleModule'
add_library(UseSharedModule SHARED "${CMAKE_CURRENT_LIST_DIR}/swift/use_foo_bar.swift")
target_link_libraries(UseSharedModule PRIVATE SharedModule)
set_target_properties(UseSharedModule PROPERTIES FRAMEWORK TRUE)
