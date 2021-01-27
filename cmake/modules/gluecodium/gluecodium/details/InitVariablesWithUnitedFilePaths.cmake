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

if(DEFINED includeguard_gluecodium_details_InitVariablesWithUnitedFilePaths)
  return()
endif()
set(includeguard_gluecodium_details_InitVariablesWithUnitedFilePaths ON)

macro(gluecodium_init_variables_with_united_file_paths name_suffix)
  foreach(_source_group main common)
    # TODO: Rename to xxx_unity?
    set(GLUECODIUM_GENERATED_cpp_${_source_group} cpp/${name_suffix}_${_source_group}_glue.cpp)
    set(GLUECODIUM_GENERATED_jni_${_source_group}
        android/${name_suffix}_${_source_group}_jniglue.cpp)
    set(GLUECODIUM_GENERATED_cbridge_${_source_group}
        cbridge/${name_suffix}_${_source_group}_cglue.cpp)
    set(GLUECODIUM_GENERATED_cbridge_header_${_source_group}
        cbridge/${name_suffix}_${_source_group}_cglue.h)
    set(GLUECODIUM_GENERATED_swift_${_source_group}
        swift/${name_suffix}_${_source_group}_glue.swift)
    set(GLUECODIUM_GENERATED_dart_${_source_group} dart/${name_suffix}_${_source_group}_ffiglue.cpp)
  endforeach()
endmacro()
