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

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/gluecodium/details/ResolvePossibleAlias)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)

add_library(aliased-target EXCLUDE_FROM_ALL cpp/dummy.cpp)
gluecodium_resolve_possible_alias(result aliased-target)
test_assert_strequal(EXPECTED "aliased-target" ACTUAL "${result}"
                     MESSAGE "For ordinary target function returns name of the target")

unset(result)
add_library(test::alias-to-target ALIAS aliased-target)
gluecodium_resolve_possible_alias(result test::alias-to-target)
test_assert_strequal(EXPECTED "aliased-target" ACTUAL "${result}"
                     MESSAGE "For alias target function returns name of the aliased target")
