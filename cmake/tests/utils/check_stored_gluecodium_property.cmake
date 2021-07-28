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

#[=======================================================================[.rst:

.. command:check_file_or_directory_exists_after_build

Checks that provided file or directory exists after given taget is built.
Adds post build command which tries to rename file or directory.

  check_file_or_directory_exists_after_build(
     <target>       # Target to add post build command
     <file_path>    # File or directory path to check
   )
#]=======================================================================]

set(_check_stored_gluecodium_property_DIR ${CMAKE_CURRENT_LIST_DIR})

function(check_stored_gluecodium_property _new_target_name file_path property_name expected_value)
  add_custom_target(
    ${_new_target_name} ALL
    COMMAND ${CMAKE_COMMAND} -DPATH_TO_FILE_WITH_VARIABLES="${file_path}"
            -DVARIABLE_NAME="${property_name}" -DEXPECTED_VALUE="${expected_value}" -P
            ${_check_stored_gluecodium_property_DIR}/run_check_property.cmake)
endfunction()
