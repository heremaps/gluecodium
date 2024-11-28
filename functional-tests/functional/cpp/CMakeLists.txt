# Copyright (C) 2016-2024 HERE Europe B.V.
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

if(NOT BUILD_CPP_TESTS)
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
  tests/AccessorsTest.cpp
  tests/EnumTest.cpp
  tests/EquatableTest.cpp
  tests/FieldConstructorsTest.cpp
  tests/ImmutableStructsTest.cpp
  tests/ReturnTest.cpp
  tests/RuntimeTypeInformationTest.cpp
  tests/StructConstructorTest.cpp)

# Set search path for libfunctional.so so it's easier to run the test
set(CMAKE_INSTALL_RPATH $ORIGIN/../lib)

add_executable(test_cpp ${SOURCES})
target_include_directories(test_cpp PRIVATE ${CPP_INPUT_DIR})
target_compile_definitions(test_cpp PRIVATE -DTEST_CPP_VERSION=Cxx${TEST_CPP_VERSION})
target_link_libraries(test_cpp PRIVATE functional gmock_main)

add_test(NAME unit_tests_cpp COMMAND test_cpp)
install(TARGETS test_cpp
        RUNTIME DESTINATION bin)
