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

if(DEFINED includeguard_gluecodium_GetLinkedTargetsWithGeneratedSources)
  return()
endif()
set(includeguard_gluecodium_GetLinkedTargetsWithGeneratedSources ON)

include(${CMAKE_CURRENT_LIST_DIR}/details/GetLinkedTargets.cmake)

#[===================================================================================================[.rst:
Returns list of directly and indirectly linked targets with generated sources.
------------------------------------------------------------------------------

.. command:: gluecodium_get_linked_targets_with_generated_sources

This function might be used to list targets with generated sources in cases when
it's necessary to split generted sources in few libraries/modules and then collect
such targets on top level. See `gluecodium_target_link_frameworks` with
`FRAMEWORKS` option as example of usage.
Any target is treated to be a target with generated sources if it has
`GLUECODIUM_GENERATORS` property.

Note: This function must be called after hierarchy for a desired target is built,
i.e. all targets are linked.

The general form of the command is::

  gluecodium_get_linked_targets_with_generated_sources(
    <result>        # The result variable which is set to a list of linked targets.
    <target>        # The target to list dependencies for. If this target contains generated
                    # sources it's also included to a result list.
    [ONLY_STATIC]   # Set this variable to list only targets which should be treated as
                    # statically linked (`STATIC`, `OBJECT`, `INTERFACE`) and stop recursion
                    # on them.
    )

#]===================================================================================================]

function(gluecodium_get_linked_targets_with_generated_sources result _target)
  unset(_result)
  unset(_linked_targets)

  gluecodium_get_linked_targets(_linked_targets ${_target} ${ARGN})
  if(TARGET ${_target})
    list(INSERT _linked_targets 0 ${_target})
  endif()

  foreach(_linked_target IN LISTS _linked_targets)
    get_target_property(_generators ${_linked_target} GLUECODIUM_GENERATORS)
    if(_generators)
      list(APPEND _result ${_linked_target})
    endif()
  endforeach()

  set(${result} ${_result} PARENT_SCOPE)
endfunction()
