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

if(DEFINED includeguard_gluecodium_swift_TargetCollectSwiftSources)
  return()
endif()
set(includeguard_gluecodium_swift_TargetCollectSwiftSources ON)

include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/GetLinkedTargets.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/TargetCopySwiftSources.cmake)

#[===================================================================================================[.rst:
Collects swift sources from properties `GLUECODIUM_SWIFT` and `GLUECODIUM_BRIDGING_HEADERS`
of linked targets.
------------------------------------------------------------------------

.. command:: gluecodium_target_collect_swift_sources

Enumerates all statically linked targets and filter out those which have
properties `GLUECODIUM_SWIFT` or `GLUECODIUM_BRIDGING_HEADERS`.
Then calls method `gluecodium_target_copy_swift_sources` for each such
target.

The general form of the command is::

  gluecodium_target_collect_swift_sources(
    <target>  # The destination target to add swift sources to.
  )

#]===================================================================================================]

function(gluecodium_target_collect_swift_sources _target)
  unset(_linked_targets)
  _gluecodium_get_targets_with_swift_sources(_linked_targets ${_target})
  foreach(_linked_target IN LISTS _linked_targets)
    gluecodium_target_copy_swift_sources(${_target} ${_linked_target})
  endforeach()
endfunction()

function(_gluecodium_get_targets_with_swift_sources result _target)
  unset(_result)
  unset(_linked_targets)
  gluecodium_get_linked_targets(_linked_targets ${_target} ${ARGN})
  foreach(_linked_target IN LISTS _linked_targets)
    get_target_property(_swift ${_linked_target} GLUECODIUM_SWIFT)
    get_target_property(_bridging_headers ${_linked_target} GLUECODIUM_BRIDGING_HEADERS)

    if(_swift OR _bridging_headers)
      list(APPEND _result ${_linked_target})
    endif()
  endforeach()

  set(${result} ${_result} PARENT_SCOPE)
endfunction()
