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

if(DEFINED includeguard_gluecodium_Swift)
  return()
endif()
set(includeguard_gluecodium_Swift ON)

cmake_minimum_required(VERSION 3.10)

#[===========================================================================================[.rst:
The Swift Gluecodium module
---------------------

Includes modules needed for Swift builds (on Linux or macOS).
#]===========================================================================================]
# Swift modules

include(${CMAKE_CURRENT_LIST_DIR}/swift/TargetLinkFrameworks.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/swift/TargetSwiftSources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/swift/TargetAddModuleModulemap.cmake)
