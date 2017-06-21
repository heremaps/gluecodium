# Copyright (c) 2017 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required(VERSION 3.2)
project(hello)

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(HEADERS
    include/hello/config.h)

set(SOURCES
    src/HelloWorldStub.cpp)

# Public library, either shared or static depending BUILD_SHARED_LIBS
add_library(hello ${HEADERS} ${SOURCES})
target_compile_features(hello PUBLIC cxx_range_for)
set_target_properties(hello PROPERTIES
    VERSION ${HELLO_VERSION}
    SOVERSION ${HELLO_VERSION_MAJOR})
if(BUILD_SHARED_LIBS)
    target_compile_definitions(hello
        PRIVATE HELLO_SHARED)
endif()

target_include_directories(hello
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        ${CMAKE_CURRENT_BINARY_DIR}/api
    INTERFACE
        $<INSTALL_INTERFACE:include>
     )
install(TARGETS hello EXPORT helloTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include)
install(FILES ${HEADERS}
    DESTINATION include/hello
    COMPONENT Devel)
