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

#[===========================================================================================[.rst:
GetLinkLibraries
-------------------
Return a list of all direct and transitive libraries needed for linking static libraries.

Usage:
  get_link_libraries(
    target
    output_link_arguments
    )

target
  Name of the target (e.g., hello).

output_link_arguments
  A variable to which the swiftc linking arguments will be written to. It's supposed to
  be passed to swiftc directly, i.e. `COMMAND swiftc "${output_link_arguments}" ... COMMAND_EXPAND_LISTS`

Note:
  make sure to always quote "${output_link_arguments}" and use COMMAND_EXPAND_LISTS in custom commands.
#]===========================================================================================]
function(get_swiftc_arguments _target output_link_arguments)
  set(visited)
  set(included)
  set(linked -Xlinker --start-group)
  get_swiftc_arguments_recurse(${_target})
  list(APPEND linked -Xlinker --end-group)
  set(${output_link_arguments} ${included} ${linked} PARENT_SCOPE)
endfunction()

function(get_swiftc_arguments_recurse _target)
  if(_target IN_LIST visited)
    return()
  endif()
  list(APPEND visited "${_target}")
  if(NOT TARGET ${_target})
    if(_target MATCHES ".*\\\$<LINK_ONLY:.*")
      # Do nothing, CMake propagates this to INTERFACE_LINK_LIBRARIES even for PRIVATE dependencies,
      # but it's only allowed in link targets.
    elseif(_target MATCHES ".*-[lL].*")
      # Only append -l and -L flags (optionally in generator expressions) since swiftc might not
      # understand other flags
      list(APPEND linked "${_target}")
    endif()
  else()
    get_target_property(TARGET_TYPE ${_target} TYPE)
    if(TARGET_TYPE STREQUAL "STATIC_LIBRARY" OR TARGET_TYPE STREQUAL "SHARED_LIBRARY")
      list(APPEND linked "-l$<TARGET_LINKER_FILE:${_target}>")
      if(TARGET_TYPE STREQUAL "STATIC_LIBRARY")
        get_target_property(linked_libs ${_target} LINK_LIBRARIES)
        if(linked_libs)
          foreach(lib ${linked_libs})
            get_swiftc_arguments_recurse(${lib})
          endforeach()
        endif()
      endif()
    endif()
    if(TARGET_TYPE STREQUAL "STATIC_LIBRARY" OR TARGET_TYPE STREQUAL "SHARED_LIBRARY"
       OR TARGET_TYPE STREQUAL "INTERFACE_LIBRARY")
      set(include_dirs
          "$<BUILD_INTERFACE:$<TARGET_PROPERTY:${_target},INTERFACE_INCLUDE_DIRECTORIES>>")
      list(APPEND included "$<$<BOOL:${include_dirs}>:-I$<JOIN:${include_dirs},;-I>>")

      get_target_property(linked_libs ${_target} INTERFACE_LINK_LIBRARIES)
      if(linked_libs)
        foreach(lib ${linked_libs})
          get_swiftc_arguments_recurse(${lib})
        endforeach()
      endif()
    endif()
  endif()
  set(visited "${visited}" PARENT_SCOPE)
  set(linked "${linked}" PARENT_SCOPE)
  set(included "${included}" PARENT_SCOPE)
endfunction()
