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

if(DEFINED includeguard_gluecodium_swift_TargetCopySwiftSources)
  return()
endif()
set(includeguard_gluecodium_swift_TargetCopySwiftSources ON)

include(${CMAKE_CURRENT_LIST_DIR}/details/SetFrameworkSwiftSources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/GeneratorExpressions.cmake)

#[===================================================================================================[.rst:
Copies properties with Swift related sources from one target to another.
------------------------------------------------------------------------

.. command:: gluecodium_target_copy_swift_sources

Copies properties `GLUECODIUM_SWIFT` and `GLUECODIUM_BRIDGING_HEADERS`
from a source target to a destination target. For CMake >= 3.12
generator expression is used to copy properties. I.e. it's possible to
call this function either before or after other gluecodium functions.
If CMake < 3.12 is used then this function should be called after
`gluecodium_target_generated_sources` is called.
If a destination target is a framework or bundle then Swift sources are added as
$<TARGET_PROPERTY:GLUECODIUM_SWIFT> expression.

The general form of the command is::

  gluecodium_target_copy_swift_sources(
    <target_destination>  # The destination target to copy properties to
    <target_source>       # The source target to copy properties from
  )


#]===================================================================================================]

function(gluecodium_target_copy_swift_sources target_dst target_src)
  _gluecodium_swift_get_property_or_expression(_swift_src_property ${target_src} GLUECODIUM_SWIFT)
  _gluecodium_wrap_genex_eval_if_possible(_swift_src_property ${target_dst})

  _gluecodium_swift_get_property_or_expression(_bridging_header_src_property ${target_src}
                                               GLUECODIUM_BRIDGING_HEADERS)
  _gluecodium_wrap_genex_eval_if_possible(_bridging_header_src_property ${target_dst})

  set_property(TARGET ${target_dst} APPEND PROPERTY GLUECODIUM_SWIFT "${_swift_src_property}")
  set_property(TARGET ${target_dst} APPEND PROPERTY GLUECODIUM_BRIDGING_HEADERS
                                                    "${_bridging_header_src_property}")

  get_target_property(_type ${target_dst} TYPE)
  if(_type STREQUAL "EXECUTABLE" OR (_type STREQUAL "SHARED_LIBRARY" AND CMAKE_GENERATOR STREQUAL
                                                                         Ninja))
    target_sources(
      ${target_dst}
      PRIVATE "$<TARGET_GENEX_EVAL:${target_dst},$<TARGET_PROPERTY:${target_dst},GLUECODIUM_SWIFT>>"
    )
  else()
    _gluecodium_set_framework_swift_sources(${target_dst})
  endif()
endfunction()

function(_gluecodium_swift_get_property_or_expression result _target property_name)
  if(CMAKE_VERSION GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
    set(${result} "$<TARGET_PROPERTY:${_target},${property_name}>" PARENT_SCOPE)
  else()
    get_target_property(_result ${_target} ${property_name})
    if(_result)
      set(${result} "${_result}" PARENT_SCOPE)
    endif()
  endif()
endfunction()
