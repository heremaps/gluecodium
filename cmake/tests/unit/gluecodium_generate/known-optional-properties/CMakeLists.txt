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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)

get_property(_known_optional_properties GLOBAL PROPERTY GLUECODIUM_KNOWN_OPTIONAL_PROPERTIES)

test_assert_defined(
  VARIABLE _known_optional_properties
  MESSAGE "GLUECODIUM_KNOWN_OPTIONAL_PROPERTIES must contain list of known properties")

list(LENGTH _known_optional_properties _properties_count)

test_assert_true(CONDITION _properties_count GREATER_EQUAL 20
                 MESSAGE "There should be at least 20 known properties")

add_library(module.property SHARED EXCLUDE_FROM_ALL "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

add_library(module.property.global.property SHARED EXCLUDE_FROM_ALL
            "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

add_library(module.property.variable SHARED EXCLUDE_FROM_ALL
            "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

add_library(module.property.precedence SHARED EXCLUDE_FROM_ALL
            "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

add_library(module.property.overwrite SHARED EXCLUDE_FROM_ALL
            "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

foreach(_property ${_known_optional_properties})
  get_target_property(_property_value module.property ${_property})
  test_expect_false(CONDITION _property_value)

  set_target_properties(module.property.precedence PROPERTIES ${_property}
                                                              "precedence-${_property}-test")

  set_property(GLOBAL PROPERTY ${_property}_DEFAULT "global-property-${_property}-test")
endforeach()

gluecodium_generate(module.property.global.property GENERATORS cpp)
gluecodium_generate(module.property.precedence GENERATORS cpp)
gluecodium_generate(module.property.overwrite GENERATORS cpp)

foreach(_property ${_known_optional_properties})
  set(${_property}_DEFAULT "${_property}-test")
endforeach()
gluecodium_generate(module.property.variable GENERATORS cpp)

foreach(_property ${_known_optional_properties})
  get_target_property(_property_value module.property.global.property ${_property})

  test_expect_strequal(EXPECTED "global-property-${_property}-test" ACTUAL "${_property_value}"
                       MESSAGE "Property should be initialised by ${_property}_DEFAULT variable")

  get_target_property(_property_value module.property.variable ${_property})

  test_expect_strequal(EXPECTED "${_property}-test" ACTUAL "${_property_value}"
                       MESSAGE "Property should be initialised by ${_property}_DEFAULT variable")

  get_target_property(_property_value module.property.precedence ${_property})

  test_expect_strequal(
    EXPECTED "precedence-${_property}-test" ACTUAL "${_property_value}"
    MESSAGE "If property was set before then variable ${_property}_DEFAULT shouldn't change it")

  set_target_properties(module.property.overwrite PROPERTIES ${_property}
                                                             "overwrite-${_property}-test")
endforeach()

string(REPLACE ";" "$<SEMICOLON>" _escaped_known_optional_properties
               "${_known_optional_properties}")

# Check that files contain expected values in properties
add_custom_target(
  CheckGlobalProperty ALL
  COMMAND
    ${CMAKE_COMMAND} -DKNOWN_PROPERTIES="${_escaped_known_optional_properties}"
    -DPATH_TO_FILE_WITH_VARIABLES="${CMAKE_CURRENT_BINARY_DIR}/gluecodium/module.property.global.property/cpp/gluecodium-generate-configuration-module.property.global.property.cmake"
    -DEXPECTED_VALUE_PREFIX="global-property-" -P ${CMAKE_CURRENT_LIST_DIR}/check_properties.cmake)

add_custom_target(
  CheckVariable ALL
  COMMAND
    ${CMAKE_COMMAND} -DKNOWN_PROPERTIES="${_escaped_known_optional_properties}"
    -DPATH_TO_FILE_WITH_VARIABLES="${CMAKE_CURRENT_BINARY_DIR}/gluecodium/module.property.variable/cpp/gluecodium-generate-configuration-module.property.variable.cmake"
    -DEXPECTED_VALUE_PREFIX="" -P ${CMAKE_CURRENT_LIST_DIR}/check_properties.cmake)

add_custom_target(
  CheckPrecedence ALL
  COMMAND
    ${CMAKE_COMMAND} -DKNOWN_PROPERTIES="${_escaped_known_optional_properties}"
    -DPATH_TO_FILE_WITH_VARIABLES="${CMAKE_CURRENT_BINARY_DIR}/gluecodium/module.property.precedence/cpp/gluecodium-generate-configuration-module.property.precedence.cmake"
    -DEXPECTED_VALUE_PREFIX="precedence-" -P ${CMAKE_CURRENT_LIST_DIR}/check_properties.cmake)

add_custom_target(
  CheckOverwrite ALL
  COMMAND
    ${CMAKE_COMMAND} -DKNOWN_PROPERTIES="${_escaped_known_optional_properties}"
    -DPATH_TO_FILE_WITH_VARIABLES="${CMAKE_CURRENT_BINARY_DIR}/gluecodium/module.property.overwrite/cpp/gluecodium-generate-configuration-module.property.overwrite.cmake"
    -DEXPECTED_VALUE_PREFIX="overwrite-" -P ${CMAKE_CURRENT_LIST_DIR}/check_properties.cmake)
