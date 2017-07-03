# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.7)
project(hello)
# Here we create a new library 'hello' for which to generate target platform bindings.
# It aims to serve as a blueprint for real-world libraries such as libguidance or librouting.

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

#TODO Remove this workaround for builtin types for Swift and just do the else part once
#APIGEN-202 is done
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
    set(HELLO_SOURCES
        #src/hello/HelloWorldBuiltinTypesStub.cpp
        src/hello/HelloWorldStub.cpp
        src/test/StaticStringMethodsTestStub.cpp)
else()
    set(HELLO_SOURCES
        src/hello/HelloWorldBuiltinTypesStub.cpp
        src/hello/HelloWorldStub.cpp
        src/test/StaticStringMethodsTestStub.cpp)
endif()

add_library(hello ${HELLO_SOURCES})
target_compile_features(hello PUBLIC cxx_range_for)
set_target_properties(hello PROPERTIES
    POSITION_INDEPENDENT_CODE ON
    SOVERSION ${HELLO_VERSION_MAJOR}
    VERSION ${HELLO_VERSION})

include(apigen/Apigen)

#TODO Remove this workaround for builtin types for Swift and just do the else part once
#APIGEN-202 is done
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
    set(HELLO_WORLD_BASE_FILES
        #fidl/HelloWorldBuiltinTypes.fdepl
        #fidl/HelloWorldBuiltinTypes.fidl
        fidl/HelloWorld.fdepl
        fidl/HelloWorld.fidl
        fidl/StaticStringMethodsTest.fdepl
        fidl/StaticStringMethodsTest.fidl
    )
    file(COPY ${HELLO_WORLD_BASE_FILES} DESTINATION swift-fidl)
    apigen_transpile(hello
        ${CMAKE_CURRENT_BINARY_DIR}/swift-fidl/
        ${HELLO_APIGEN_TRANSPILER_GENERATOR})
else()
    apigen_transpile(hello
        ${CMAKE_CURRENT_SOURCE_DIR}/fidl/
        ${HELLO_APIGEN_TRANSPILER_GENERATOR})
endif()
apigen_target_include_directories(hello)
apigen_target_sources(hello)

# Target platform specific rules to follow...
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL stub)
    # Only install the shared library for C++ customers, others don't care...
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION include)
elseif(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
    # Android customers want an Android Archive and it's pre-requirements...
    apigen_java_compile(hello)
    apigen_java_jar(hello)
    apigen_android_archive(hello)
elseif(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
    # Swift customers want a module...
    apigen_swift_build(hello TESTS ${HELLO_SWIFT_TESTS})
    #TODO: Investigate ways to separate debug host-builds (no cross toolchain)
    # for testing from debug/release cross-builds for iOS targets.
    #apigen_swift_test(hello test/folder)
    #apigen_ios_framework(hello)
endif()
