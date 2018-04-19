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

if(DEFINED includeguard_ApigenSwiftModulemap)
    return()
endif()
set(includeguard_ApigenSwiftModulemap ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenSwiftModulemap
# -------------------
#
# This module builds Swift modulemap needed for the framework creation.
# The modulemap is used to get the Swift compiler into loading the header files and linking
# against the CBridge library without exposing the C bindings in the framework.
# The modulemap itself is not part of the framework.
#
# .. command:: apigen_swift_modulemap
#
# The general form of the command is::
#
#     apigen_swift_modulemap(target)
#

function(apigen_swift_modulemap target)

    get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
    get_target_property(OUTPUT_DIR ${target} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)
    get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
    get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)

    if(NOT ${GENERATOR} MATCHES "swift")
        message(FATAL_ERROR "apigen_swift_modulemap() depends on apigen_generate() configured with generator 'swift'")
    endif()

    set(MODULEMAP_FRAMEWORK_PATH "${SWIFT_OUTPUT_DIR}/${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Modules/module.modulemap")

    # Module map generation
    ## Top level:
    set(CBRIDGE_MODULE_MAP "module ${target} {\n")
    file(GLOB_RECURSE cbridge_headers ${OUTPUT_DIR}/cbridge/*.h)

    foreach(header IN LISTS cbridge_headers)
        set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n    header \"${header}\"")
    endforeach()

    set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n}\n")

    file(WRITE "${OUTPUT_DIR}/module.modulemap.generated" "${CBRIDGE_MODULE_MAP}")

    file(WRITE
        ${MODULEMAP_FRAMEWORK_PATH}
        "module ${target} {\n}\n")

    file(WRITE
        ${SWIFT_OUTPUT_DIR}/module.modulemap
        "module ${target} {\n}")

    # Clean up the modulemap after building to avoid double definition conflicts with the generated
    # framework - this is caused by using internally the same name as the final Xcode project
    # and Xcode will follow those caches
    add_custom_command(TARGET "${target}" PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy "${OUTPUT_DIR}/module.modulemap.generated" "${OUTPUT_DIR}/module.modulemap")
    if(APPLE)
        add_custom_command(TARGET "${target}" POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E remove "${OUTPUT_DIR}/module.modulemap")
    endif()


endfunction()
