# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_apigen_Android)
  return()
endif()
set(includeguard_apigen_Android ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# The Android Apigen module
# -------------------------
#
# Includes modules needed for Android builds.

# Java modules
include(${CMAKE_CURRENT_LIST_DIR}/ApigenJavaCompile.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ApigenJavaJar.cmake)

# Android modules
include(${CMAKE_CURRENT_LIST_DIR}/ApigenAndroidArchive.cmake)
