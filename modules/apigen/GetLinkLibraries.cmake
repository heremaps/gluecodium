# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

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
