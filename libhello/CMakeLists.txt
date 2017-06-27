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

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(SOURCES
    src/hello/HelloWorldStub.cpp

    src/test/StaticStringMethodsTestStub.cpp
)

add_library(hello ${SOURCES})
target_compile_features(hello PUBLIC cxx_range_for)
set_target_properties(hello PROPERTIES
    POSITION_INDEPENDENT_CODE ON
    SOVERSION ${HELLO_VERSION_MAJOR}
    VERSION ${HELLO_VERSION})
install(TARGETS hello EXPORT helloTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include)

include(Apigen)
apigen_transpile(hello
    ${CMAKE_CURRENT_SOURCE_DIR}/fidl/
    ${HELLO_APIGEN_TRANSPILER_GENERATOR})
apigen_target_include_directories(hello)
apigen_target_sources(hello)

if(CMAKE_SYSTEM_NAME STREQUAL Android)
    apigen_java_compile(hello)
    apigen_java_jar(hello)
    apigen_android_archive(hello)
elseif(CMAKE_SYSTEM_NAME STREQUAL Swift)
    #apigen_swift_package(hello ...)
endif()
