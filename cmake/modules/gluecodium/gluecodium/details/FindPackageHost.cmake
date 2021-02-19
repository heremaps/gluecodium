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

function(gluecodium_find_package_host)
  macro(_override_cmake_variable_if_exists _variable _value)
    unset(_restore_${_variable})
    if(DEFINED ${_variable})
      set(_restore_${_variable} ${_variable})
      set(${_variable} ${_value})
    endif()
  endmacro()

  macro(_restore_cmake_variable _variable)
    if(DEFINED _restore_${_variable})
      set(${_variable} ${_restore_${_variable}})
    endif()
  endmacro()

  _override_cmake_variable_if_exists(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  _override_cmake_variable_if_exists(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
  _override_cmake_variable_if_exists(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)
  _override_cmake_variable_if_exists(IOS FALSE)
  _override_cmake_variable_if_exists(ANDROID FALSE)

  find_package(${ARGN})

  _restore_cmake_variable(ANDROID)
  _restore_cmake_variable(IOS)
  _restore_cmake_variable(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
  _restore_cmake_variable(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
  _restore_cmake_variable(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
endfunction()
