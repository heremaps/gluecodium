# Copyright (C) 2021 HERE Europe B.V.
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

include(${CMAKE_CURRENT_LIST_DIR}/ListGeneratedFiles.cmake)

function(_gluecodium_create_default_generated_target _target)
  gluecodium_list_generated_files(${_target} OUTPUT_ALL _generated_sources)
  set(_custom_target_name ${_target}.gluecodium.generate)
  add_custom_target(${_custom_target_name} DEPENDS ${_generated_sources})
  # CMake 3.19 enabled support of "new build system" in Xcode >= 12.x "New build system" requires
  # for targets which depend on the same generated files to have dependency between them.
  add_dependencies(${_target} ${_custom_target_name})
endfunction()
