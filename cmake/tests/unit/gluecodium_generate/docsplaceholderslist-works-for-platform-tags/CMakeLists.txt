# Copyright (C) 2025 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)
set(CMAKE_CXX_STANDARD 17)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")
include(gluecodium/Gluecodium)

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_contains_string_after_build.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)

add_library(dummySharedLibrary SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/dummy.cpp")
target_link_libraries(dummySharedLibrary PRIVATE Threads::Threads)

get_supported_gluecodium_generators(_gluecodium_generators)
list(SORT _gluecodium_generators)

gluecodium_generate(dummySharedLibrary GENERATORS ${_gluecodium_generators})
gluecodium_target_lime_sources(dummySharedLibrary PRIVATE ${LIME_SOURCES})

set_property(TARGET dummySharedLibrary APPEND PROPERTY GLUECODIUM_DOCS_PLACEHOLDERS_FILES
             ${PLACEHOLDER_FILES})

set_property(TARGET dummySharedLibrary APPEND PROPERTY GLUECODIUM_DOCS_PLACEHOLDERS
             ${PLACEHOLDER_PROPERTIES})

string(REPLACE ";" "-" GENERATORS_DIR_NAME "${_gluecodium_generators}")

set(GENERATED_MAIN_DIR_PATH "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/dummySharedLibrary/${GENERATORS_DIR_NAME}/main")
set(GENERATED_MAIN_dart_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/dart/lib/src/unit/test")
set(GENERATED_MAIN_android_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/android/com/example/unit/test")
set(GENERATED_MAIN_cpp_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/cpp/include/unit/test")
set(GENERATED_MAIN_swift_FILES_PATH "${GENERATED_MAIN_DIR_PATH}/swift/unit/test")

foreach(_index 1 2 3 4)
    foreach(_generator dart android swift cpp)
        if(${_generator} IN_LIST _gluecodium_generators AND DEFINED EXPECTED_${_generator}_FILE_${_index})
            test_assert_defined(
                VARIABLE EXPECTED_${_generator}_TEXT_${_index}
                MESSAGE "When EXPECTED_${_generator}_FILE_${_index} is defined then EXPECTED_${_generator}_TEXT_${_index} also must be defined")

            check_file_contains_string_after_build(
                dummySharedLibrary
                "${GENERATED_MAIN_${_generator}_FILES_PATH}/${EXPECTED_${_generator}_FILE_${_index}}"
                "${EXPECTED_${_generator}_TEXT_${_index}}")
        endif()
    endforeach()
endforeach()
