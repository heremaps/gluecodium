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

cmake_minimum_required(VERSION 3.6)
project(test_cpp)

if(NOT HELLO_BUILD_CPP_TESTS)
  return()
endif()

enable_testing()

# Download and unpack googletest at configure time
configure_file(googletest-download.cmake.in googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for downloading googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

set(BUILD_SHARED_LIBS OFF)
# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)

set(SOURCES
  tests/EquatableTest.cpp
  tests/ImmutableStructsTest.cpp
  tests/OptionalTest.cpp
  tests/ReturnTest.cpp
  tests/RuntimeTypeInformationTest.cpp
  tests/StructConstructorTest.cpp)

if(HELLO_TEST_CPP_VERSION LESS 17)
  list(APPEND SOURCES
    tests/OptionalTestCxx11.cpp)
else()
  list(APPEND SOURCES
    tests/OptionalTestCxx17.cpp)
endif()

# Set search path for libhello.so so it's easier to run the test
set(CMAKE_INSTALL_RPATH $ORIGIN/../lib)

add_executable(test_cpp ${SOURCES})
target_compile_definitions(test_cpp PRIVATE -DHELLO_TEST_CPP_VERSION=Cxx${HELLO_TEST_CPP_VERSION})
target_link_libraries(test_cpp
  hello
  gmock_main
  hello)

add_test(unit_tests test_cpp)
install(TARGETS test_cpp
        RUNTIME DESTINATION bin)
