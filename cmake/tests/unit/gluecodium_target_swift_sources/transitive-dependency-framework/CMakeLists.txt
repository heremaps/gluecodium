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

if(NOT TEST_GENERATED_CODE_LIBRARY_TYPE)
  set(TEST_GENERATED_CODE_LIBRARY_TYPE OBJECT)
endif()

if(NOT TEST_TRANSITIVE_LIBRARY_TYPE)
  set(TEST_TRANSITIVE_LIBRARY_TYPE STATIC)
endif()

# Module with generated sourcess
add_library(module.with.generated.sources ${TEST_GENERATED_CODE_LIBRARY_TYPE})

gluecodium_generate(module.with.generated.sources GENERATORS swift cpp)
gluecodium_target_lime_sources(module.with.generated.sources
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

# Module which doesn't have generated sources
add_library(module.transitive ${TEST_TRANSITIVE_LIBRARY_TYPE})
if(TEST_TRANSITIVE_LIBRARY_TYPE STREQUAL "INTERFACE")
  target_sources(module.transitive INTERFACE "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp"
                                             "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")
  target_link_libraries(module.transitive INTERFACE module.with.generated.sources)
else()
  target_sources(module.transitive PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp"
                 PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")
  target_link_libraries(module.transitive PUBLIC module.with.generated.sources)
endif()

# Final shared module. Xcode doesn't like empty targets and silently ignores them, so dummy source
# file is necessary.
add_library(SharedModule SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.cpp"
                                "${CMAKE_CURRENT_LIST_DIR}/swift/dummy.swift")
target_link_libraries(SharedModule PRIVATE module.transitive)
set_target_properties(SharedModule PROPERTIES FRAMEWORK TRUE XCODE_ATTRIBUTE_DEFINES_MODULE YES)
gluecodium_target_swift_sources(SharedModule COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)

# Check that generated Swift is compiled in the framework 'SingleModule'
add_library(UseSharedModule SHARED "${CMAKE_CURRENT_LIST_DIR}/swift/use_foo_bar.swift")
target_link_libraries(UseSharedModule PRIVATE SharedModule)
set_target_properties(UseSharedModule PROPERTIES FRAMEWORK TRUE)
