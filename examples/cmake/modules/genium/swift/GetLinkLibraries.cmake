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

if(DEFINED includeguard_apigen_GetLinkLibraries)
    return()
endif()
set(includeguard_apigen_GetLinkLibraries ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# GetLinkLibraries
# -------------------
# Return a list of all direct and implicit libraries needed for linking.
#
# Usage:
#   get_link_libraries(
#     target
#     output_list
#     )
#
# target
#   Name of the target (e.g., hello).
#
# output_list
#   A variable to which the return list will be written to.
#

function(get_link_libraries TARGET OUTPUT_LIST)
    # Todo: Properly detect all interface only libraries and ignore them for linking
    if(${TARGET} STREQUAL "DebugUtils")
        return()
    endif()
    list(APPEND VISITED_TARGETS ${TARGET})
    get_target_property(LIBS ${TARGET} INTERFACE_LINK_LIBRARIES)
    foreach(LIB ${LIBS})
        if(TARGET ${LIB})
            list(FIND VISITED_TARGETS ${LIB} VISITED)
            if(${VISITED} EQUAL -1)
                get_link_libraries(${LIB} LINK_LIB_FILES)
            endif()
        endif()
    endforeach()
    set(VISITED_TARGETS ${VISITED_TARGETS} PARENT_SCOPE)
    set(${OUTPUT_LIST} ${VISITED_TARGETS} PARENT_SCOPE)
endfunction()
