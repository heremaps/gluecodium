# Copyright (C) 2016-2026 HERE Europe B.V.
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

function(gluecodium_get_gradle_init_script_arguments result init_script)
  if(NOT init_script)
    set(${result} "" PARENT_SCOPE)
    return()
  endif()

  if(NOT IS_ABSOLUTE "${init_script}")
    message(FATAL_ERROR "GLUECODIUM_GRADLE_INIT_SCRIPT must be an absolute path: ${init_script}")
  endif()

  if(NOT EXISTS "${init_script}" OR IS_DIRECTORY "${init_script}")
    message(FATAL_ERROR "GLUECODIUM_GRADLE_INIT_SCRIPT must be an existing file: ${init_script}")
  endif()

  set(${result} --init-script "${init_script}" PARENT_SCOPE)
endfunction()