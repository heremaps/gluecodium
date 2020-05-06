#!/usr/bin/env cmake -P
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

set (_required_vars APIGEN_GLUECODIUM_DIR APIGEN_OUTPUT_DIR APIGEN_JAVA_COMPILE_OUTPUT_DIR)
foreach(_var ${_required_vars})
    if (NOT ${_var})
        message(FATAL_ERROR "${_var} must be specified")
    endif ()
endforeach()

include(${APIGEN_GLUECODIUM_DIR}/Gradle.cmake)
include(${APIGEN_GLUECODIUM_DIR}/GradleSync.cmake)

list(APPEND _java_source_dirs "${APIGEN_OUTPUT_DIR}/android")

if (APIGEN_COMMON_OUTPUT_DIR)
  list(APPEND _java_source_dirs "${APIGEN_COMMON_OUTPUT_DIR}/android")
endif ()

string(REPLACE ";" "\;" _java_source_dirs "${_java_source_dirs}")
string(REPLACE ";" "\;" APIGEN_JAVA_LOCAL_DEPENDENCIES "${APIGEN_JAVA_LOCAL_DEPENDENCIES}")
string(REPLACE ";" "\;" APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS "${APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS}")
string(REPLACE ";" "\;" APIGEN_JAVA_REMOTE_DEPENDENCIES "${APIGEN_JAVA_REMOTE_DEPENDENCIES}")
string(REPLACE ";" "\;" APIGEN_JAVA_LOCAL_JARS "${APIGEN_JAVA_LOCAL_JARS}")

execute_process(
  COMMAND ${CMAKE_COMMAND} -E make_directory ${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
  COMMAND ${APIGEN_GLUECODIUM_GRADLE_WRAPPER}
    -b=compileJava.gradle
    -PsrcDirs=${_java_source_dirs}
    -PoutputDir=${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
    -PlocalDependencies=${APIGEN_JAVA_LOCAL_DEPENDENCIES}
    -PlocalDependenciesDirs=${APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS}
    -PlocalJars=${APIGEN_JAVA_LOCAL_JARS}
    -PremoteDependencies=${APIGEN_JAVA_REMOTE_DEPENDENCIES}
    compileJava
  WORKING_DIRECTORY ${APIGEN_GLUECODIUM_DIR}
  RESULT_VARIABLE COMPILE_RESULT)

if(COMPILE_RESULT)
    message(FATAL_ERROR "Failed to compile Java")
endif()
