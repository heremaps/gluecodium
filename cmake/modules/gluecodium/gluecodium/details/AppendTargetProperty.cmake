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

include(${CMAKE_CURRENT_LIST_DIR}/GeneratorExpressions.cmake)

macro(_gluecodium_append_target_property_eval variable_name target_name property_name)
  set(_target_property "$<TARGET_PROPERTY:${target_name},${property_name}>")
  _gluecodium_wrap_genex_eval_if_possible(_target_property ${target_name})
  string(APPEND ${variable_name} "set(${property_name} \"${_target_property}\")\n")
endmacro()
