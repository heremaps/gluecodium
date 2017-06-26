# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.7)
project(base_api_app)

if(NOT HELLO_BUILD_CPP_APP)
    return()
endif()

set(SRC_LIST src/main.cpp)
add_executable(base_api_app ${SRC_LIST})

target_link_libraries(base_api_app hello)
target_compile_features(base_api_app PUBLIC cxx_range_for)
target_include_directories(base_api_app PUBLIC hello)
