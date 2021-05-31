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

if(TEST_USE_ALIASES)
  set(TARGET_MODULE_WITH_GENERATED_SOURCES test::module.with.generated.sources)
else()
  set(TARGET_MODULE_WITH_GENERATED_SOURCES module.with.generated.sources)
endif()

# Module with generated sources
add_library(module.with.generated.sources ${TEST_GENERATED_CODE_LIBRARY_TYPE})
add_library(test::module.with.generated.sources ALIAS module.with.generated.sources)

gluecodium_generate(module.with.generated.sources GENERATORS swift cpp)
gluecodium_target_lime_sources(module.with.generated.sources
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")
gluecodium_target_swift_sources(module.with.generated.sources
                                SWIFT_FILES "${CMAKE_CURRENT_LIST_DIR}/swift/custom.swift")

# Final shared module.
add_library(SharedModule SHARED)
target_sources(SharedModule PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
target_link_libraries(SharedModule PRIVATE ${TARGET_MODULE_WITH_GENERATED_SOURCES})
set_target_properties(SharedModule PROPERTIES FRAMEWORK TRUE XCODE_ATTRIBUTE_DEFINES_MODULE YES)

if(TEST_USE_COPY_FROM_TARGETS)
  gluecodium_target_swift_sources(
    SharedModule COPY_FROM_TARGETS ${TARGET_MODULE_WITH_GENERATED_SOURCES} ADD_MODULE_MODULEMAP)
else()
  gluecodium_target_swift_sources(SharedModule COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
endif()

# Check that generated Swift is compiled in the framework 'SingleModule'
add_library(UseCustomCode SHARED "${CMAKE_CURRENT_LIST_DIR}/swift/use_custom.swift")
target_link_libraries(UseCustomCode PRIVATE SharedModule)
set_target_properties(UseCustomCode PROPERTIES FRAMEWORK TRUE)
