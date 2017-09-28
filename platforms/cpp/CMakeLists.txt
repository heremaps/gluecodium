# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.7)
project(cpp_app)

if(NOT HELLO_BUILD_CPP_APP)
    return()
endif()

set(SOURCES
    src/main.cpp)

add_executable(cpp_app ${SOURCES})

target_compile_features(cpp_app PUBLIC cxx_range_for)
target_include_directories(cpp_app PRIVATE hello)
target_link_libraries(cpp_app PRIVATE hello)

install(TARGETS cpp_app
        RUNTIME DESTINATION bin)
