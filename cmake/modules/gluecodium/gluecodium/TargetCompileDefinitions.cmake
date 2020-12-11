# Copyright (C) 2020 HERE Europe B.V.
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

if(DEFINED includeguard_gluecodium_TargetCompileDefinitions)
  return()
endif()
set(includeguard_gluecodium_TargetCompileDefinitions ON)

cmake_minimum_required(VERSION 3.5)

function(apigen_target_compile_definitions target)
  set(options MAIN COMMON)
  cmake_parse_arguments(_args "${options}" "" "" ${ARGN})

  apigen_check_no_unparsed_arguments(_args apigen_target_compile_definitions)

  get_target_property(_target_type ${target} TYPE)
  if(_target_type STREQUAL SHARED_LIBRARY AND _args_COMMON)
    get_target_property(_cpp_export ${target} GLUECODIUM_CPP_EXPORT)
    get_target_property(_cpp_export_common ${target} GLUECODIUM_CPP_EXPORT_COMMON)
    if (NOT _cpp_export OR NOT _cpp_export_common)
        message(FATAL_ERROR "apigen_generate should be called before apigen_target_compile_definitions")
    endif ()
    # TODO: Currently definitions ${_cpp_export}_SHARED and ${_cpp_export}_INTERNAL
    # are already set in apigen_generate, but this behaviour should be changed and those
    # definitions should also be set here.
    if (NOT _cpp_export STREQUAL _cpp_export_common)
      target_compile_definitions(${target}
        PUBLIC ${_cpp_export_common}_SHARED
        PRIVATE ${_cpp_export_common}_INTERNAL)
    endif()
  endif()
endfunction()