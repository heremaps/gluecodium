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

#[=======================================================================[.rst:

.. command:check_file_or_directory_exists_after_build

Checks that provided file or directory exists after given taget is built.
Adds post build command which tries to rename file or directory.

  check_file_or_directory_exists_after_build(
     <target>       # Target to add post build command
     <file_path>    # File or directory path to check
   )
#]=======================================================================]

function(check_file_or_directory_exists_after_build target file_path)
    add_custom_command(TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E echo "Try to access file ${file_path}. This file doesn\\'t exists when command fails"
        COMMAND ${CMAKE_COMMAND} -E rename "${file_path}" "${file_path}_checked"
        COMMAND ${CMAKE_COMMAND} -E rename "${file_path}_checked" "${file_path}")
endfunction()
