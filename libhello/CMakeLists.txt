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
    src/HelloWorldStub.cpp)

if(CMAKE_SYSTEM_NAME STREQUAL Android)
    set(TRANSPILER_ANDROID_JNI_DIR ${CMAKE_CURRENT_BINARY_DIR}/api/android/jni)
    #TODO: Change this soon:
    file(GLOB JNI_SOURCES ${TRANSPILER_ANDROID_JNI_DIR}/*.cpp)
    list(APPEND SOURCES ${JNI_SOURCES})
endif()

# Public library, either shared or static depending BUILD_SHARED_LIBS
add_library(hello ${SOURCES})
target_compile_features(hello PUBLIC cxx_range_for)
set_target_properties(hello PROPERTIES
    POSITION_INDEPENDENT_CODE ON
    VERSION ${HELLO_VERSION}
    SOVERSION ${HELLO_VERSION_MAJOR})
if(BUILD_SHARED_LIBS)
    target_compile_definitions(hello
        PRIVATE HELLO_SHARED)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL Android)
    target_include_directories(hello
        PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/api
        PRIVATE ${TRANSPILER_ANDROID_JNI_DIR}
        PRIVATE ${JNI_LIBRARIES})
    target_link_libraries(hello ${JNI_LIBRARIES})
else()
    target_include_directories(hello
        PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/api
        INTERFACE $<INSTALL_INTERFACE:include>)
endif()

install(TARGETS hello EXPORT helloTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include)
