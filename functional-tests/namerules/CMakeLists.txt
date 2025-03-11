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

cmake_minimum_required(VERSION 3.10)

project(namerules)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (swift IN_LIST GLUECODIUM_GENERATORS_DEFAULT)
    enable_language(Swift)
    set (CMAKE_Swift_LANGUAGE_VERSION 5)
    if (CMAKE_GENERATOR STREQUAL "Xcode")
        set (CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)
    endif()
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../../cmake/modules/")

include (CTest)

set(LIME_SOURCES
    input/lime/NameRules.lime
)

set(CPP_SOURCES
    cpp/NameRulesImpl.cpp
)

if(swift IN_LIST GLUECODIUM_GENERATORS_DEFAULT)
    include(gluecodium/Gluecodium)
    include(gluecodium/Swift)

    add_library(namerules_bindings STATIC ${CPP_SOURCES})

    gluecodium_generate(namerules_bindings)
    set_target_properties(namerules_bindings PROPERTIES
        GLUECODIUM_JAVA_PACKAGE com.here.namerules
        GLUECODIUM_JAVA_INTERNAL_PACKAGE lorem.ipsum
        GLUECODIUM_JAVA_NAMERULES "input/namerules/java.properties"
        GLUECODIUM_CPP_NAMERULES "input/namerules/cpp.properties"
        GLUECODIUM_SWIFT_NAMERULES "input/namerules/swift.properties"
        GLUECODIUM_CPP_INTERNAL_NAMESPACE "lorem_ipsum::test"
        GLUECODIUM_VERBOSE ON)

    gluecodium_target_lime_sources(namerules_bindings PRIVATE ${LIME_SOURCES})

    set_target_properties(namerules_bindings PROPERTIES
        POSITION_INDEPENDENT_CODE ON)

    add_library(namerules SHARED)
    target_link_libraries(namerules PUBLIC namerules_bindings)

    file(GLOB_RECURSE test_sources ${CMAKE_CURRENT_SOURCE_DIR}/swift/*.swift)

    gluecodium_target_swift_sources(namerules
           COPY_FROM_TARGETS namerules_bindings)

    if (APPLE OR CMAKE_GENERATOR STREQUAL "Xcode")
        find_package(XCTest REQUIRED)
    endif()

    if (CMAKE_GENERATOR STREQUAL "Xcode")
        gluecodium_target_add_module_modulemap(namerules RESULT_DIR_VARIABLE _underlying_dir REMOVE_AFTER_BUILD)
        target_include_directories(namerules PRIVATE ${_underlying_dir})

        set_target_properties(
            namerules
            PROPERTIES FRAMEWORK TRUE
                 XCODE_ATTRIBUTE_DEFINES_MODULE YES)

        xctest_add_bundle(testnamerules namerules ${test_sources})
        xctest_add_test(XCTest.functional testnamerules)

        foreach(_target namerules testnamerules)
            set_target_properties(${_target} PROPERTIES
                XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "$<IF:$<CONFIG:Debug>,dwarf,dwarf-with-dsym>"
                XCODE_ATTRIBUTE_SWIFT_OPTIMIZATION_LEVEL "$<IF:$<CONFIG:Debug>,-Onone,-O>")
        endforeach()
    else()
        gluecodium_target_add_module_modulemap(namerules RESULT_DIR_VARIABLE _underlying_dir)
        target_include_directories(namerules PUBLIC ${_underlying_dir})

        target_compile_options(namerules PRIVATE -enable-testing)

        add_executable(testnamerules ${test_sources})
        # XCTest_LIBRARIES is unspecified in Linux
        target_link_libraries(testnamerules PRIVATE namerules ${XCTest_LIBRARIES})

        add_test(NAME XCTest.namerules COMMAND testnamerules)
    endif()
elseif(DEFINED GLUECODIUM_GENERATED_DIR)
    add_library(namerules SHARED ${CPP_SOURCES})
    set_target_properties(namerules PROPERTIES
        POSITION_INDEPENDENT_CODE ON)

    # Android library targets need the cpp and JNI headers to compile
    # but should not expose those to the public.
    target_include_directories(namerules
      PRIVATE $<BUILD_INTERFACE:${GLUECODIUM_GENERATED_DIR}/cpp/include>
      PRIVATE $<BUILD_INTERFACE:${GLUECODIUM_GENERATED_DIR}>) # JNI headers and sources

    if(NOT CMAKE_CROSSCOMPILING)
        find_package(JNI REQUIRED)
        target_include_directories(namerules
            PRIVATE $<BUILD_INTERFACE:${JNI_INCLUDE_DIRS}>)
    endif()

    file(GLOB_RECURSE GENERATED_CPP_SOURCES ${GLUECODIUM_GENERATED_DIR}/cpp/*.cpp)
    file(GLOB_RECURSE GENERATED_CPP_HEADERS ${GLUECODIUM_GENERATED_DIR}/cpp/*.h)
    file(GLOB_RECURSE JNI_SOURCES ${GLUECODIUM_GENERATED_DIR}/android/jni/*.cpp)
    target_sources(namerules PRIVATE
        ${GENERATED_CPP_SOURCES}
        ${GENERATED_CPP_HEADERS}
        ${JNI_SOURCES})
endif()
