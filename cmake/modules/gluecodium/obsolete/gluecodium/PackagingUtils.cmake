# Copyright (C) 2019 HERE Global B.V.
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

if(DEFINED includeguardapigen_packaging_gluecodium_PackagingUtils)
  return()
endif()
set(includeguardapigen_packaging_gluecodium_PackagingUtils ON)

function(apigen_packaging_find_shared_library_dependencies_rec var _target add_aliases)
  set(found_deps ${${var}})
  get_target_property(dependencies ${_target} LINK_LIBRARIES)
  foreach(dep ${dependencies})
    if(TARGET ${dep})
      get_target_property(lib_type ${dep} TYPE)
      if(NOT lib_type STREQUAL SHARED_LIBRARY AND NOT lib_type STREQUAL STATIC_LIBRARY)
        continue()
      endif()

      list(FIND found_deps ${dep} found_idx)
      if(found_idx GREATER -1)
        continue()
      endif()

      apigen_packaging_find_shared_library_dependencies_rec(found_deps ${dep} ${add_aliases})
      if(lib_type STREQUAL SHARED_LIBRARY)
        list(APPEND found_deps ${dep})
        if(add_aliases)
          get_target_property(alias ${dep} ALIASED_TARGET)
          if(alias)
            list(APPEND found_deps ${alias})
          endif()
        endif()
      endif()
    endif()
  endforeach()
  set(${var} ${found_deps} PARENT_SCOPE)
endfunction()

function(apigen_packaging_find_shared_library_dependencies all_deps limited_deps)
  set(single_args TARGET)
  set(multi_args EXCLUDE_TARGETS)
  cmake_parse_arguments(ARG "" "${single_args}" "${multi_args}" ${ARGN})

  # Main library dependencies.
  set(${all_deps})
  apigen_packaging_find_shared_library_dependencies_rec(${all_deps} ${ARG_TARGET} OFF)

  # Excluded dependencies.
  set(${limited_deps} ${${all_deps}})
  foreach(excluded_dep ${ARG_EXCLUDE_TARGETS})
    set(exclude ${excluded_dep})
    apigen_packaging_find_shared_library_dependencies_rec(exclude ${excluded_dep} ON)
    list(REMOVE_ITEM ${limited_deps} ${exclude})
  endforeach()

  set(${all_deps} ${${all_deps}} PARENT_SCOPE)
  set(${limited_deps} ${${limited_deps}} PARENT_SCOPE)
endfunction()

function(apigen_packaging_lib_name var _target)
  get_target_property(name ${_target} OUTPUT_NAME)
  if(NOT name)
    get_target_property(name ${_target} NAME)
  endif()

  get_target_property(prefix ${_target} PREFIX)
  if(prefix)
    if(CMAKE_SHARED_LIBRARY_PREFIX)
      string(REGEX REPLACE "^${CMAKE_SHARED_LIBRARY_PREFIX}" "" prefix ${prefix})
    endif()
    set(name ${prefix}${name})
  endif()

  set(${var} ${name} PARENT_SCOPE)
endfunction()
