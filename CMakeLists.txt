# ============================================================================
#
# Copyright (c) 2017 HERE Global B.V. and its affiliate(s).
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.
#
# ============================================================================


cmake_minimum_required(VERSION 3.2)
project(hello_world)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/")

add_subdirectory(libhello)
