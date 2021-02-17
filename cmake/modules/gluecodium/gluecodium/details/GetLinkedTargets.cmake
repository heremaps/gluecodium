# Copyright (C) 2016-2021 HERE Europe B.V.
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

include(${CMAKE_CURRENT_LIST_DIR}/CheckArguments.cmake)

function(gluecodium_get_linked_targets result _target)
  set(_options ONLY_STATIC)
  cmake_parse_arguments(_args "${_options}" "" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_get_linked_targets_with_generated_sources)

  if(_args_ONLY_STATIC)
    set(_only_static TRUE)
  else()
    set(_only_static FALSE)
  endif()

  set(_visited_targets ${_target})
  gluecodium_get_linked_targets_rec(${result} _visited_targets ${_target} ${_only_static})
  set(${result} ${${result}} PARENT_SCOPE)
endfunction()

function(gluecodium_get_linked_targets_rec result visited_targets _target only_static)
  unset(_linked_libs)
  get_target_property(_interface_linked_libs ${_target} INTERFACE_LINK_LIBRARIES)
  get_target_property(_target_type ${_target} TYPE)
  if(NOT _target_type STREQUAL "INTERFACE_LIBRARY")
    get_target_property(_linked_libs ${_target} LINK_LIBRARIES)
  endif()

  unset(_lib_targets)
  foreach(_linked_lib ${_linked_libs} ${_interface_linked_libs})
    if(${_linked_lib} IN_LIST ${visited_targets})
      continue()
    else()
      list(APPEND ${visited_targets} ${_linked_lib})
    endif()

    if(NOT TARGET ${_linked_lib})
      continue()
    endif()

    if(only_static)
      get_target_property(_linked_type ${_linked_lib} TYPE)
      get_target_property(_framework ${_linked_lib} FRAMEWORK)
      # Framework can be static, but it's still final target
      if(_linked_type STREQUAL "SHARED_LIBRARY" OR _framework)
        continue()
      endif()
    endif()

    list(APPEND _lib_targets ${_linked_lib})

    unset(_lib_targets_dependency)
    gluecodium_get_linked_targets_rec(_lib_targets_dependency ${visited_targets} ${_linked_lib}
                                      ${only_static})
    list(APPEND _lib_targets ${_lib_targets_dependency})
  endforeach()

  set(${visited_targets} ${${visited_targets}} PARENT_SCOPE)
  set(${result} ${_lib_targets} PARENT_SCOPE)
endfunction()
