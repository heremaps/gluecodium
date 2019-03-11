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

cmake_minimum_required(VERSION 3.6)
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
