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

if(DEFINED includeguard_gluecodium_details_GetOutputDirs)
  return()
endif()
set(includeguard_gluecodium_details_GetOutputDirs ON)

function(
  gluecodium_get_output_dirs
  output_dir
  target_binary_dir
  main_dir_variable
  common_dir_variable
  unity_dir_variable
  build_dir_variable)
  set(_gluecodium_output_main "${output_dir}/main")
  set(_gluecodium_output_common "${output_dir}/common")
  set(_gluecodium_output_unity "${output_dir}/unity")
  set(_gluecodium_output_build "${output_dir}/build")

  if(NOT IS_ABSOLUTE "${output_dir}")
    set(_gluecodium_output_main "${target_binary_dir}/${_gluecodium_output_main}")
    set(_gluecodium_output_common "${target_binary_dir}/${_gluecodium_output_common}")
    set(_gluecodium_output_unity "${target_binary_dir}/${_gluecodium_output_unity}")
    set(_gluecodium_output_build "${target_binary_dir}/${_gluecodium_output_build}")
  endif()
  set(${main_dir_variable} ${_gluecodium_output_main} PARENT_SCOPE)
  set(${common_dir_variable} ${_gluecodium_output_common} PARENT_SCOPE)
  set(${unity_dir_variable} ${_gluecodium_output_unity} PARENT_SCOPE)
  set(${build_dir_variable} ${_gluecodium_output_build} PARENT_SCOPE)
endfunction()
