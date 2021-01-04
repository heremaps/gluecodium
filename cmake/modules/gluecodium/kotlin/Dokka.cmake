# Copyright (C) 2016-2019 HERE Europe B.V.
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

cmake_minimum_required(VERSION 3.5)


#[===========================================================================================[.rst:
DokkaApiDocumentation
---------------

This module provides functions to generate documentation
for the Android public API.
Documents generation is done by dokka tool as a post-build command.

.. command:: dokka_api_documentation

The general form of the command is::

  dokka_api_documentation(TARGET target
          OUTPUT_DIR outputDir
          INPUT_DIR inputDir1
          INPUT_DIR inputDir2)

TARGET specifies the target that documents generation will be attached to
OUTPUT_DIR specifies the output directory of the documents generation tool
INPUT_DIR specifies the directory with source code that will be scanned by generator

#]===========================================================================================]

function(dokka_api_documentation)
    set(options OPTIONAL)
    set(one_value_args TARGET OUTPUT_DIR)
    set(multi_value_args INPUT_DIR)

    cmake_parse_arguments(
        DOKKA_DOCS
        "${options}"
        "${one_value_args}"
        "${multi_value_args}"
        "${ARGN}"
    )

    # find dokka
    find_program(DOKKA_EXECUTABLE NAMES dokka)

    if(NOT DOKKA_EXECUTABLE)
        message(STATUS "Dokka executable not found. Android documentation will not be generated.")
        return()
    endif()

    add_custom_command(
        TARGET ${DOKKA_DOCS_TARGET}
        POST_BUILD
        COMMAND ${DOKKA_EXECUTABLE} ${DOKKA_DOCS_INPUT_DIR}
                    -output ${DOKKA_DOCS_OUTPUT_DIR}
                    -format javadoc
        COMMENT "Generating android documentation"
    )
endfunction()
