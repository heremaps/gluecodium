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

include(${CMAKE_CURRENT_LIST_DIR}/../../gluecodium/details/GeneratorExpressions.cmake)

function(_gluecodium_set_framework_swift_sources _target)
  if(CMAKE_VERSION GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
    get_target_property(_sources_were_set ${_target} GLUECODIUM_SWIFT_IS_SET)
    if(_sources_were_set)
      return()
    endif()
    set_target_properties(${_target} PROPERTIES GLUECODIUM_SWIFT_IS_SET TRUE)
  endif()

  _gluecodium_is_framework_or_bundle_expression(_is_framework_or_bundle_expression ${_target})
  _gluecodium_swift_get_property_or_expression(_swift_dst_property ${_target} GLUECODIUM_SWIFT)
  _gluecodium_wrap_genex_eval_if_possible(_swift_dst_property ${_target})

  target_sources(${_target}
                 PRIVATE "$<${_is_framework_or_bundle_expression}:${_swift_dst_property}>")
endfunction()
