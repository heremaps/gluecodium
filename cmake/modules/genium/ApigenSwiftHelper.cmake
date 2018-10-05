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

if(DEFINED includeguard_ApigenSwiftHelper)
  return()
endif()
set(includeguard_ApigenSwiftHelper ON)

cmake_minimum_required(VERSION 3.5)

## By default if the swift version is not defined, cmake will set the legacy
## swift version (depends of your cmake version).
function(set_xcode_swift_version target)
    if(${XCODE_VERSION} VERSION_EQUAL 10 OR ${XCODE_VERSION} VERSION_GREATER 10)
        set(swift_version 4.2)
    elseif(${XCODE_VERSION} VERSION_EQUAL 9.3 OR ${XCODE_VERSION} VERSION_GREATER 9.3)
        set(swift_version 4.1)
    else()
        set(swift_version 4.0)
    endif()
    message(STATUS "Swift version set to ${swift_version} with XCode version: ${XCODE_VERSION}")
    set_target_properties(${target} PROPERTIES
        XCODE_ATTRIBUTE_SWIFT_VERSION ${swift_version})
endfunction()
