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

.. command:message_colored

Function prints text like standart CMake's message but also can apply
color in terminal.
  message_colored(
     <color>              # Color to print text. Acceptable values: RED, GREEN, YELLOW, BLUE, WHITE
     [<mode>]             # Type of message. The same as <mode> variable for standart 'message' function
                          # please refer to official documentation for detailed information.
     "message to display" # Message or list of messages to display
   )
#]=======================================================================]

function (message_colored COLOR MODE)
    string (ASCII 27 Esc)
    set (COLOR_RESET "${Esc}[m")

    if (${COLOR} STREQUAL "RED")
        set (COLOR_STRING "${Esc}[31m")
    elseif (${COLOR} STREQUAL "GREEN")
        set (COLOR_STRING "${Esc}[32m")
    elseif (${COLOR} STREQUAL "YELLOW")
        set (COLOR_STRING "${Esc}[33m")
    elseif (${COLOR} STREQUAL "BLUE")
        set (COLOR_STRING "${Esc}[34m")
    elseif (${COLOR} STREQUAL "WHITE")
        set (COLOR_STRING "${Esc}[37m")
    endif ()
    if (${MODE} MATCHES "^(STATUS|WARNING|AUTHOR_WARNING|SEND_ERROR|FATAL_ERROR|DEPRECATION)$")
        message (${MODE} ${COLOR_STRING} ${ARGN} ${COLOR_RESET})
    else ()
        message (${COLOR_STRING} ${MODE} ${ARGN} ${COLOR_RESET})
    endif ()
endfunction ()
