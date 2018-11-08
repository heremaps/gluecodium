# Copyright (C) 2016-2018 HERE Europe B.V.
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

if(DEFINED includeguard_genium_swift_Package)
  return()
endif()
set(includeguard_genium_swift_Package ON)

cmake_minimum_required(VERSION 3.5)

include(${CMAKE_CURRENT_LIST_DIR}/FatLibrary.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/FrameworkInfoPlist.cmake)

#.rst:
# apigen_swift_package
# --------------------
#
# This module execute post operations when the build process has finished.
#
# .. command:: apigen_swift_package
#
# The general form of the command is:
#
#     apigen_swift_swift_package(target)
#

function(apigen_swift_package target)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_package() depends on apigen_generate() configured with generator 'swift'")
  endif()

  apigen_swift_fat_library(${target})
  apigen_swift_framework_info_plist(${target})

endfunction()
