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

include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/GeneratorExpressions.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../gluecodium/details/CheckArguments.cmake)

#[===================================================================================================[.rst:
Add custom command to generate module modulemap file and remove it after a build.
---------------------------------------------------------------------------------

.. command:: gluecodium_target_add_module_modulemap


The general form of the command is::

  gluecodium_target_add_module_modulemap(
    <target>            # The destination target to add swift sources to.
    [OUTPUT_DIR path]   # The output directory to generate module.modulemap file.
                        # Unique path for target is used if this parameter is not passed.
  )


#]===================================================================================================]

function(gluecodium_target_add_module_modulemap _target)
  set(_single_args OUTPUT_DIR)
  cmake_parse_arguments(_args "" "${_single_args}" "" ${ARGN})
  gluecodium_check_no_unparsed_arguments(_args gluecodium_add_module_modulemap)

  if(NOT _args_OUTPUT_DIR)
    set(_args_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/${_target}/gluecodium")
  endif()

  set(_underlying_module_dir "${_args_OUTPUT_DIR}/underlying-module")
  _gluecodium_get_framework_name_expression(_module_name ${_target})
  # TODO: Check relative paths
  set(_headers_property "$<TARGET_PROPERTY:${_target},GLUECODIUM_BRIDGING_HEADERS>")
  _gluecodium_wrap_genex_eval_if_possible(_headers_property ${_target})
  set(_modulemap_content
      "module ${_module_name} {\n  header \"$<JOIN:${_headers_property},\"\n  header \">\"\n\}\n")
  file(GENERATE OUTPUT "${_underlying_module_dir}/module.modulemap.generated"
       CONTENT "${_modulemap_content}")

  add_custom_command(
    TARGET ${_target} PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${_underlying_module_dir}/module.modulemap.generated"
            "${_underlying_module_dir}/module.modulemap")

  # If modulemap is not removed it stays in framework after compilation and code which uses the
  # framework tries to include all headers listed there (i.e all internal headers which are not
  # exposed)
  add_custom_command(
    TARGET ${_target} POST_BUILD COMMAND ${CMAKE_COMMAND} -E remove
                                         "${_underlying_module_dir}/module.modulemap")

  _gluecodium_is_framework_expression(_is_framework_expression ${_target})
  set_property(
    TARGET ${_target}
    APPEND_STRING
    PROPERTY
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS
      "$<${_is_framework_expression}: -import-underlying-module -I${_underlying_module_dir} >")
endfunction()
