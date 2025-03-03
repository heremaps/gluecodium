# Copyright (C) 2016-2025 HERE Europe B.V.
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

.. command:check_file_contains_string_after_build

Checks that provided file contains a given string after given target is built.
Adds post build command which tries to grep for a given string.

  check_file_contains_string_after_build(
     <target>       # Target to add post build command
     <file_path>    # File or directory path to check
     <needle>       # String to look for in the file.
   )
#]=======================================================================]

function(check_file_contains_string_after_build _target file_path needle)
  add_custom_command(
    TARGET ${_target}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo
            "Loads a file '${file_path}' and looks for '${needle}'. The file does not contain it if command fails."
    COMMAND ${CMAKE_COMMAND} -DCHECK_FILE_CONTAINS_FILE_PATH="${file_path}"
                             -DCHECK_FILE_CONTAINS_NEEDLE="${needle}"
                             -P "${GLUECODIUM_CMAKE_TESTS_DIR}/utils/run_check_file_contains_string.cmake")
endfunction()
