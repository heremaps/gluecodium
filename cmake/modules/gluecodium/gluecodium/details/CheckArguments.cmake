# Copyright (C) 2016-2020 HERE Europe B.V.
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

if(DEFINED includeguard_gluecodium_details_CheckArguments)
  return()
endif()
set(includeguard_gluecodium_details_CheckArguments ON)

#[===========================================================================================[.rst:
Macros to validate argument passed to function
----------------------

Next macros are provided:
 gluecodium_require_argument              Checks that argument exists
 gluecodium_check_no_unparsed_arguments   Checks that no unparsed arguments are left
 gluecodium_deprecate_argument            Shows deprecation message if argument exists
 gluecodium_deprecate_argument_renamed    Shows suggestion to use new argument
#]===========================================================================================]

#[===========================================================================================[.rst:
.. command:: gluecodium_require_argument

The general form of the macro is::

  gluecodium_require_argument(prefix argument_name function_name)

This macro checks that variable <prefix>_<argument_name> exists
in scope and shows fatal error otherwise.
#]===========================================================================================]
macro(gluecodium_require_argument prefix argument_name function_name)
  if(NOT DEFINED ${prefix}_${argument_name})
    message(FATAL_ERROR "Mandatory argument ${argument_name} was not passed "
                        "to function ${function_name}.")
  endif()
endmacro()

#[===========================================================================================[.rst:
.. command:: gluecodium_check_no_unparsed_arguments

The general form of the macro is::

  gluecodium_check_no_unparsed_arguments(prefix function_name)

This macro checks that variable <prefix>_UNPARSED_ARGUMENTS DOESN't exists
in scope and shows fatal error otherwise.
#]===========================================================================================]
macro(gluecodium_check_no_unparsed_arguments prefix function_name)
  if(${prefix}_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "Function ${function_name} detected unknown argument(s): ${${prefix}_UNPARSED_ARGUMENTS}.")
  endif()
endmacro()

#[===========================================================================================[.rst:
.. command:: gluecodium_deprecate_argument

The general form of the macro is::

  gluecodium_deprecate_argument(prefix argument_name function_name)

This macro checks that variable <prefix>_<argument_name> exists
in scope and shows deprrecation warning in this case.
#]===========================================================================================]
macro(gluecodium_deprecate_argument prefix argument_name function_name)
  if(DEFINED ${prefix}_${argument_name})
    message(WARNING "Argument ${argument_name} which is passed to function ${function_name} "
                    "is deprecated and might be removed in future versions.")
  endif()
endmacro()

#[===========================================================================================[.rst:
.. command:: gluecodium_deprecate_argument_renamed

The general form of the macro is::

  gluecodium_deprecate_argument_renamed(prefix argument_name new_argument_name function_name)

This macro checks that variable <prefix>_<argument_name> exists
in scope and shows deprrecation warning and suggestion to use variable <new_argument_name>
if exists.
#]===========================================================================================]
macro(gluecodium_deprecate_argument_renamed prefix argument_name new_argument_name function_name)
  if(DEFINED ${prefix}_${argument_name})
    message(WARNING "Argument ${argument_name} which is passed to function ${function_name} "
                    "is deprecated and might be removed in future versions. "
                    "Please use ${new_argument_name} instead.")
  endif()
endmacro()
