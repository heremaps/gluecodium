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

cmake_minimum_required(VERSION 3.6)

project(namerules)

set(FRANCA_SOURCES
    input/fidl/NameRules.fidl
    input/fidl/NameRules.fdepl
    )

set(CPP_SOURCES
    cpp/NameRulesImpl.cpp
)

add_library(namerules ${CPP_SOURCES} ${FRANCA_SOURCES})
set_target_properties(namerules PROPERTIES
    POSITION_INDEPENDENT_CODE ON)

include(genium/Genium)
apigen_generate(TARGET namerules
        FRANCA_SOURCES ${FRANCA_SOURCES}
        GENERATOR ${GENIUM_GENERATOR}
        VERSION ${GENIUM_VERSION}
        JAVA_PACKAGE com.here.namerules
        JAVA_INTERNAL_PACKAGE lorem.ipsum
        JAVA_NAMERULES input/namerules/java.properties
        CPP_INTERNAL_NAMESPACE lorem_ipsum.test
        CPP_NAMERULES input/namerules/cpp.properties
        SWIFT_NAMERULES input/namerules/swift.properties)
apigen_target_include_directories(namerules)
apigen_target_sources(namerules)

# Target platform specific rules to follow...
if(GENIUM_GENERATOR STREQUAL cpp)
    # Only install the shared library for C++ users, others don't care...
    install(TARGETS namerules EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION namerules)
elseif(GENIUM_GENERATOR STREQUAL android)
    # Android users want an Android Archive and it's pre-requirements...
    include(genium/Android)
    if(NOT DEFINED ANDROID_NATIVE_API_LEVEL)
        set(ANDROID_NATIVE_API_LEVEL "28")
    endif()
    if(NOT DEFINED ANDROID_PLATFORM)
        set(ANDROID_PLATFORM "android-${ANDROID_NATIVE_API_LEVEL}")
    endif()
    apigen_java_compile(TARGET namerules
        LOCAL_DEPENDENCIES "android"
        LOCAL_DEPENDENCIES_DIRS "$ENV{ANDROID_HOME}/platforms/${ANDROID_PLATFORM}"
        REMOTE_DEPENDENCIES "com.android.support:support-annotations:28.0.0")
    apigen_java_jar(namerules)
    apigen_android_archive(TARGET namerules)
elseif(GENIUM_GENERATOR STREQUAL swift)
    # Swift users want a module...
    include(genium/Swift)
    set_target_properties(namerules PROPERTIES APIGEN_SWIFT_TESTS_SHARED "${CMAKE_CURRENT_SOURCE_DIR}/swift/")

    apigen_swift_build(namerules)
    apigen_swift_framework_info_plist(namerules)
endif()