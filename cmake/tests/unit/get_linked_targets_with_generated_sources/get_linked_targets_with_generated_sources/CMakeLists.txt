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

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

list(APPEND _gluecodium_generators cpp)
if(ANDROID)
  list(APPEND _gluecodium_generators android)
elseif(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  list(APPEND _gluecodium_generators swift)
endif()

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)
include(gluecodium/gluecodium/GetLinkedTargetsWithGeneratedSources)

add_library(shared1.generated.code SHARED EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")
gluecodium_generate(shared1.generated.code GENERATORS ${_gluecodium_generators})

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED shared1.generated.code ACTUAL ${_targets})

# cmake-format: off
# (G) - target with generated code
#
# SHARED1(G) -> STATIC1(G)
# cmake-format: on

add_library(static1.generated.code STATIC EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")
gluecodium_generate(static1.generated.code GENERATORS ${_gluecodium_generators})
target_link_libraries(shared1.generated.code PRIVATE static1.generated.code)

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED shared1.generated.code static1.generated.code
                           ACTUAL ${_targets})

gluecodium_get_linked_targets_with_generated_sources(_targets static1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED static1.generated.code ACTUAL ${_targets})

# cmake-format: off
# (G) - target with generated code
#
# SHARED1(G) -> STATIC1(G)
#     |-------> STATIC2 -> OBJECT1(G)
# cmake-format: on

add_library(static2.generated.code STATIC EXCLUDE_FROM_ALL "cpp/FooImpl.cpp")

add_library(object1.generated.code OBJECT EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")

gluecodium_generate(object1.generated.code GENERATORS ${_gluecodium_generators})

target_link_libraries(static2.generated.code PRIVATE object1.generated.code)
target_link_libraries(shared1.generated.code PRIVATE static2.generated.code)

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED shared1.generated.code static1.generated.code
                                    object1.generated.code ACTUAL ${_targets})

gluecodium_get_linked_targets_with_generated_sources(_targets static2.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED object1.generated.code ACTUAL ${_targets})

unset(_targets)
gluecodium_get_linked_targets_with_generated_sources(_targets object1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED object1.generated.code ACTUAL ${_targets})

# cmake-format: off
# (G) - target with generated code
#
# SHARED1(G) -> STATIC1(G) -> SHARED2(G)
#     |-------> STATIC2 -> OBJECT1(G)
# cmake-format: on

add_library(shared2.generated.code SHARED EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")
gluecodium_generate(shared2.generated.code GENERATORS ${_gluecodium_generators})

target_link_libraries(static1.generated.code PRIVATE shared2.generated.code)

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code)
test_expect_strequal_lists(
  EXPECTED shared1.generated.code static1.generated.code shared2.generated.code
           object1.generated.code ACTUAL ${_targets})

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED shared1.generated.code static1.generated.code
                                    object1.generated.code ACTUAL ${_targets})

gluecodium_get_linked_targets_with_generated_sources(_targets shared2.generated.code ONLY_STATIC)
test_expect_strequal_lists(EXPECTED shared2.generated.code ACTUAL ${_targets})

# cmake-format: off
# (G) - target with generated code
#
# SHARED1(G) -> STATIC1(G) -> SHARED2(G)
#     |-------> STATIC2 -> OBJECT1(G)
#     |-------> OBJECT3 -> SHARED1(G) - loop
# cmake-format: on

add_library(object3.generated.code SHARED EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")
gluecodium_generate(object3.generated.code GENERATORS ${_gluecodium_generators})
target_link_libraries(object3.generated.code PRIVATE shared1.generated.code)

gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code)
test_expect_strequal_lists(
  EXPECTED shared1.generated.code static1.generated.code shared2.generated.code
           object1.generated.code ACTUAL ${_targets})

if(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  # cmake-format: off
  # (G) - target with generated code
  #
  # SHARED1(G) -> STATIC1(G) -> SHARED2(G)
  #     |-------> STATIC2 -> OBJECT1(G)
  #     |-------> OBJECT3 -> SHARED1(G) - loop
  #     |-------> STATIC3(GF)
  # cmake-format: on

  add_library(static3.generated.code STATIC EXCLUDE_FROM_ALL "cpp/FooImpl.cpp" "lime/foo.lime")
  gluecodium_generate(static3.generated.code GENERATORS ${_gluecodium_generators})
  target_link_libraries(shared1.generated.code PRIVATE static3.generated.code)
  set_target_properties(static3.generated.code PROPERTIES FRAMEWORK TRUE)

  gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code)
  test_expect_strequal_lists(
    EXPECTED shared1.generated.code static1.generated.code shared2.generated.code
             object1.generated.code static3.generated.code ACTUAL ${_targets})

  gluecodium_get_linked_targets_with_generated_sources(_targets shared1.generated.code ONLY_STATIC)
  test_expect_strequal_lists(EXPECTED shared1.generated.code static1.generated.code
                                      object1.generated.code ACTUAL ${_targets})
endif()
