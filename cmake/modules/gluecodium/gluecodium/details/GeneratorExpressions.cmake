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

function(_gluecodium_use_property_or_default_expression result _target property default)
  set(_target_property "$<TARGET_PROPERTY:${_target},${property}>")
  set(${result} "$<IF:$<BOOL:${_target_property}>,${_target_property},${default}>" PARENT_SCOPE)
endfunction()

function(_gluecodium_get_framework_name_expression result _target)
  string(MAKE_C_IDENTIFIER "${_target}" _target_name_c)
  _gluecodium_use_property_or_default_expression(${result} ${_target} "OUTPUT_NAME"
                                                 "${_target_name_c}")
  set(${result} "${${result}}" PARENT_SCOPE)
endfunction()

function(_gluecodium_is_framework_expression result _target)
  set(${result} "$<BOOL:$<TARGET_PROPERTY:${_target},FRAMEWORK>>" PARENT_SCOPE)
endfunction()

function(_gluecodium_is_bundle_expression result _target)
  set(${result} "$<BOOL:$<TARGET_PROPERTY:${_target},BUNDLE>>" PARENT_SCOPE)
endfunction()

function(_gluecodium_is_framework_or_bundle_expression result _target)
  _gluecodium_is_framework_expression(_is_framework ${_target})
  _gluecodium_is_bundle_expression(_is_bundle ${_target})
  set(${result} "$<OR:${_is_framework},${_is_bundle}>" PARENT_SCOPE)
endfunction()

function(_gluecodium_wrap_genex_eval_if_possible result _target)
  if(CMAKE_VERSION GREATER_EQUAL 3.12 AND NOT GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
    set(${result} "$<TARGET_GENEX_EVAL:${_target},${${result}}>" PARENT_SCOPE)
  endif()
endfunction()
