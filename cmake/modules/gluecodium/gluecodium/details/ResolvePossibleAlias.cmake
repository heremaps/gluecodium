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

#[===========================================================================================[.rst:
.. command:: gluecodium_resolve_possible_alias

The general form of the command is::

  gluecodium_resolve_possible_alias(result_target target)

This function tries to treat the `target` as ALIAS and get the aliased
target into `result_target`. If `target` is not an alias then `target` is just copied
to `result_target`.

#]===========================================================================================]

function(gluecodium_resolve_possible_alias result_target _target)
  get_target_property(_aliased ${_target} ALIASED_TARGET)
  if(_aliased)
    set(${result_target} ${_aliased} PARENT_SCOPE)
  else()
    set(${result_target} ${_target} PARENT_SCOPE)
  endif()
endfunction()
