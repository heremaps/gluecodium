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

include(gluecodium/gluecodium/details/FindPackageHost)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)

if(ANDROID OR IOS)
  if(ANDROID)
    set(_is_android TRUE)
  else()
    set(_is_ios TRUE)
  endif()
endif()

# Since we run those tests on CI for desktop we can't relay on toolchain and we should set following
# variables ourselves.
unset(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Override default CMake function find_package which is called inside gluecodium_find_package_host
function(find_package)
  test_expect_false(VARIABLE ANDROID)
  test_expect_false(VARIABLE IOS)

  test_expect_false(CONDITION DEFINED CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
  test_expect_strequal(EXPECTED "NEVER" ACTUAL ${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
  test_expect_strequal(EXPECTED "NEVER" ACTUAL ${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})

  test_expect_strequal_lists(EXPECTED NonExistingPackage REQUIRED ACTUAL ${ARGN})
endfunction()

gluecodium_find_package_host(NonExistingPackage REQUIRED)

# Check that all variables are returned back
if(_is_android)
  test_expect_true(VARIABLE ANDROID)
elseif(_is_ios)
  test_expect_true(VARIABLE IOS)
endif()

test_expect_strequal(EXPECTED "ONLY" ACTUAL ${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
test_expect_strequal(EXPECTED "ONLY" ACTUAL ${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
test_expect_false(CONDITION DEFINED CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
