# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.7)
project(hello_world)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../../apigen-cmake/cmake/modules/")

option(HELLO_BUILD_IOS_APP "Build example iOS apps" ON)
set(HELLO_APIGEN_TRANSPILER_GENERATOR "stub,android,swift" CACHE STRING "Transpiler generator(s) to use [defaults to: stub,android,swift]")

enable_testing()
add_subdirectory(libhello)
