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

if(DEFINED includeguard_gluecodium_java_Compile)
  return()
endif()
set(includeguard_gluecodium_java_Compile ON)

cmake_minimum_required(VERSION 3.5)

#[===========================================================================================[.rst:
Java compilation module
-----------------------

This module compiles Java code into *.class files for a target for which
apigen_generate($target ... android) was run.

.. command:: apigen_java_compile

The general form of the command is::

    apigen_java_compile(TARGET target
       LOCAL_DEPENDENCIES jar_name
       LOCAL_DEPENDENCIES_DIRS dir_path
       LOCAL_SOURCES_DIRS source_path
       LOCAL_JARS jar_name
       REMOTE_DEPENDENCIES package_name )

LOCAL_DEPENDENCIES specifies name(s) of the local package(s) to include as dependencies.
LOCAL_DEPENDENCIES_DIRS specifies paths(s) of the local directories where to look for those
packages.
LOCAL_JARS specifies the path(s) of local JAR file(s) to include as dependencies
REMOTE_DEPENDENCIES specifies name(s) of the Gradle packages to include as dependencies through
LOCAL_SOURCES_DIRS specifies paths(s) of the local directories with Java sources to compile.
the regular dependency resolution process (i.e. fetching them from the remote repository unless
an up-to-date version is present in the local Gradle cache).

#]===========================================================================================]

find_package(Java COMPONENTS Development REQUIRED)

set(APIGEN_COMPILE_DIR ${CMAKE_CURRENT_LIST_DIR})

function(collect_java_dependencies TARGET JAVA_DEPENDENCIES JAVA_DEPENDENCIES_DIRS)
  if(${TARGET} IN_LIST java_deps_visited)
      return()
  endif()
  list(APPEND java_deps_visited "${TARGET}")

  get_target_property(interface_libs ${TARGET} INTERFACE_LINK_LIBRARIES)
  # CMake doesn't want us to ask INTERFACE_LIBRARY targets for arbitrary properties,
  # instead of just returning it's not defined it fails because it's not whitelisted
  # for INTERFACE_LIBRARY. So we have to do an additional check before the real check.
  get_target_property(target_type ${TARGET} TYPE)

  unset(java_deps)
  unset(java_dep_dirs)
  unset(link_libs)

  if(NOT target_type STREQUAL "INTERFACE_LIBRARY")
    get_target_property(link_libs ${TARGET} LINK_LIBRARIES)
    get_target_property(java_output ${TARGET} APIGEN_JAVA_JAR_OUTPUT_DIR)
    if (java_output)
      list(APPEND java_deps ${TARGET})
      list(APPEND java_dep_dirs ${java_output})
    endif()
  endif()

  foreach(lib ${interface_libs} ${link_libs})
      if(TARGET ${lib})
          collect_java_dependencies(${lib} java_deps java_dep_dirs)
      endif()
  endforeach()

  set(java_deps_visited "${java_deps_visited}" PARENT_SCOPE)

  if (java_deps)
    set(${JAVA_DEPENDENCIES} "${${JAVA_DEPENDENCIES}};${java_deps}" PARENT_SCOPE)
  endif()
  if (java_dep_dirs)
    set(${JAVA_DEPENDENCIES_DIRS} "${${JAVA_DEPENDENCIES_DIRS}};${java_dep_dirs}" PARENT_SCOPE)
  endif()
endfunction()

function(collect_java_source_dirs TARGET SOURCE_DIRS)
  get_target_property(INTERFACE_LIBS ${TARGET} INTERFACE_LINK_LIBRARIES)
  get_target_property(LINK_LIBS ${TARGET} LINK_LIBRARIES)
  foreach(LIB ${INTERFACE_LIBS} ${LINK_LIBS})
      if(TARGET ${LIB})
          list(FIND VISITED_TARGETS ${LIB} VISITED)
          if(${VISITED} EQUAL -1)
              collect_java_source_dirs(${LIB} DEP_SOURCES)
          endif()
      endif()
  endforeach()
  get_target_property(DIRS ${TARGET} APIGEN_JAVA_COMPILE_OUTPUT_DIR)
  set(${SOURCE_DIRS} "${${SOURCE_DIRS}};${DIRS};${DEP_SOURCES}" PARENT_SCOPE)
endfunction()

function(apigen_java_compile)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs LOCAL_DEPENDENCIES LOCAL_DEPENDENCIES_DIRS LOCAL_JARS REMOTE_DEPENDENCIES LOCAL_SOURCES_DIRS)
  cmake_parse_arguments(apigen_java_compile
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  get_target_property(GENERATOR ${apigen_java_compile_TARGET} APIGEN_GENERATOR)
  get_target_property(OUTPUT_DIR ${apigen_java_compile_TARGET} APIGEN_OUTPUT_DIR)
  get_target_property(COMMON_OUTPUT_DIR ${apigen_java_compile_TARGET} APIGEN_COMMON_OUTPUT_DIR)
  get_target_property(BUILD_OUTPUT_DIR ${apigen_java_compile_TARGET} APIGEN_BUILD_OUTPUT_DIR)

  list(APPEND APIGEN_JAVA_LOCAL_SOURCES_DIRS "${OUTPUT_DIR}/android")
  if (COMMON_OUTPUT_DIR)
    list(APPEND APIGEN_JAVA_LOCAL_SOURCES_DIRS "${COMMON_OUTPUT_DIR}/android")
  endif ()

  if(NOT ${GENERATOR} MATCHES "android")
    message(FATAL_ERROR "apigen_java_compile() depends on apigen_generate() configured with generator 'android'")
  endif()

  # Gluecodium invocations for different generators need different output directories
  # as Gluecodium currently wipes the directory upon start.
  set(APIGEN_JAVA_COMPILE_OUTPUT_DIR ${BUILD_OUTPUT_DIR}/android/java)

  # Attach properties to target for re-use in other modules
  set_target_properties(${apigen_java_compile_TARGET} PROPERTIES
    APIGEN_JAVA_COMPILE_OUTPUT_DIR ${APIGEN_JAVA_COMPILE_OUTPUT_DIR})

  foreach(local_dependencies ${apigen_java_compile_LOCAL_DEPENDENCIES})
    list(APPEND APIGEN_JAVA_LOCAL_DEPENDENCIES "${local_dependencies}")
  endforeach()
  foreach(local_dependencies_dirs ${apigen_java_compile_LOCAL_DEPENDENCIES_DIRS})
    list(APPEND APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS "${local_dependencies_dirs}")
  endforeach()
  foreach(local_jars ${apigen_java_compile_LOCAL_JARS})
    list(APPEND APIGEN_JAVA_LOCAL_JARS "${local_jars}")
  endforeach()
  foreach(local_sources_dirs ${apigen_java_compile_LOCAL_SOURCES_DIRS})
    list(APPEND APIGEN_JAVA_LOCAL_SOURCES_DIRS "${local_sources_dirs}")
  endforeach()

  collect_java_dependencies(${apigen_java_compile_TARGET}
      APIGEN_JAVA_LOCAL_DEPENDENCIES
      APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS)

  foreach(remote_dependencies ${apigen_java_compile_REMOTE_DEPENDENCIES})
    list(APPEND APIGEN_JAVA_REMOTE_DEPENDENCIES "${remote_dependencies}")
  endforeach()

  string(REPLACE ";" "$<SEMICOLON>" APIGEN_JAVA_LOCAL_DEPENDENCIES "${APIGEN_JAVA_LOCAL_DEPENDENCIES}")
  string(REPLACE ";" "$<SEMICOLON>" APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS "${APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS}")
  string(REPLACE ";" "$<SEMICOLON>" APIGEN_JAVA_REMOTE_DEPENDENCIES "${APIGEN_JAVA_REMOTE_DEPENDENCIES}")
  string(REPLACE ";" "$<SEMICOLON>" APIGEN_JAVA_LOCAL_JARS "${APIGEN_JAVA_LOCAL_JARS}")
  string(REPLACE ";" "$<SEMICOLON>" APIGEN_JAVA_LOCAL_SOURCES_DIRS "${APIGEN_JAVA_LOCAL_SOURCES_DIRS}")

  add_custom_command(TARGET ${apigen_java_compile_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND}
      -DAPIGEN_JAVA_COMPILE_OUTPUT_DIR=${APIGEN_JAVA_COMPILE_OUTPUT_DIR}
      -DAPIGEN_JAVA_LOCAL_DEPENDENCIES=${APIGEN_JAVA_LOCAL_DEPENDENCIES}
      -DAPIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS=${APIGEN_JAVA_LOCAL_DEPENDENCIES_DIRS}
      -DAPIGEN_JAVA_REMOTE_DEPENDENCIES=${APIGEN_JAVA_REMOTE_DEPENDENCIES}
      -DAPIGEN_JAVA_LOCAL_SOURCES_DIRS=${APIGEN_JAVA_LOCAL_SOURCES_DIRS}
      -DAPIGEN_JAVA_LOCAL_JARS=${APIGEN_JAVA_LOCAL_JARS}
      -DAPIGEN_GRADLE_SYNCHRONISATION_DIR=${CMAKE_BINARY_DIR}
      -DAPIGEN_GLUECODIUM_DIR=${APIGEN_GLUECODIUM_DIR}
      -P ${APIGEN_COMPILE_DIR}/runCompile.cmake
    WORKING_DIRECTORY ${APIGEN_GLUECODIUM_DIR}
    DEPENDS
      "${CMAKE_CURRENT_LIST_DIR}/runCompile.cmake"
    VERBATIM
    COMMENT "Compiling generated Java sources into class files...")
endfunction()
