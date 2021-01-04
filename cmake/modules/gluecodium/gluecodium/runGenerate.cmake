#!/usr/bin/env cmake -P
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

set(_required_vars APIGEN_GLUECODIUM_DIR APIGEN_OUTPUT_DIR)
foreach(_var ${_required_vars})
  if(NOT ${_var})
    message(FATAL_ERROR "${_var} must be specified")
  endif()
endforeach()

include(${APIGEN_GLUECODIUM_DIR}/GeneratedSources.cmake)
include(${APIGEN_GLUECODIUM_DIR}/Gradle.cmake)
include(${APIGEN_GLUECODIUM_DIR}/GradleSync.cmake)
include(${APIGEN_GLUECODIUM_DIR}/StringJoin.cmake)

if(APIGEN_GLUECODIUM_AUXINPUT_FILE)
  set(APIGEN_GLUECODIUM_AUXINPUT_FILE_ONLY_LIME "${APIGEN_GLUECODIUM_AUXINPUT_FILE}.only-lime")
endif()

function(_print_status)
  if(APIGEN_VERBOSE)
    message(${ARGN})
  endif()
endfunction()

function(_main)
  apigen_set_generated_files(${APIGEN_TARGET})
  _merge_aux_file_with_options()
  _check_generation_necessary(_is_generation_necessary)
  if(NOT _is_generation_necessary)
    _print_status("Generated files are up to date")
    return()
  endif()
  _generate()
  _collect_all_files_in_single_compilation_units()
endfunction()

function(_merge_aux_file_with_options)
  # Move aux files from separate file to file with options (only for CMake < 3.15)
  if(NOT APIGEN_GLUECODIUM_AUXINPUT_FILE OR NOT EXISTS ${APIGEN_GLUECODIUM_AUXINPUT_FILE})
    return()
  endif()

  file(READ "${APIGEN_GLUECODIUM_AUXINPUT_FILE}" APIGEN_AUX_FILES)
  list(FILTER APIGEN_AUX_FILES INCLUDE REGEX ".*\\.lime$")

  if(APIGEN_AUX_FILES)
    list(REMOVE_DUPLICATES APIGEN_AUX_FILES)

    string_join("," _aux_lime ${APIGEN_AUX_FILES})
    file(APPEND "${APIGEN_GLUECODIUM_OPTIONS_FILE}" "auxinput=${_aux_lime}\n")

    # List of lime files in this file will be used to check if any lime file is newer than any of
    # known generated file.
    file(WRITE "${APIGEN_GLUECODIUM_AUXINPUT_FILE_ONLY_LIME}" "${APIGEN_AUX_FILES}")
  endif()

  file(REMOVE "${APIGEN_GLUECODIUM_AUXINPUT_FILE}")
endfunction()

# Function for CMake < 3.15 to check if any of lime files is newer than known generated.
function(_check_generation_necessary result)
  if(NOT APIGEN_GENERATED_FILES OR NOT EXISTS "${APIGEN_GLUECODIUM_AUXINPUT_FILE_ONLY_LIME}")
    # This branch should work for CMake >= 3.15. If runGenerate is executed it means that some lime
    # file (not source code) is changed.
    set(${result} YES PARENT_SCOPE)
    return()
  endif()

  string(REPLACE "," ";" _generated_files "${APIGEN_GENERATED_FILES}")
  file(READ "${APIGEN_GLUECODIUM_AUXINPUT_FILE_ONLY_LIME}" APIGEN_AUX_FILES)

  foreach(_aux_lime IN LISTS APIGEN_AUX_FILES)
    foreach(_generated_file IN LISTS _generated_files)
      if("${_aux_lime}" IS_NEWER_THAN "${_generated_file}")
        set(${result} YES PARENT_SCOPE)
        return()
      endif()
    endforeach()
  endforeach()

  set(${result} NO PARENT_SCOPE)
endfunction()

function(_generate)
  if(DEFINED ENV{GLUECODIUM_PATH})
    _print_status("Using local Gluecodium from $ENV{GLUECODIUM_PATH}")
    set(_build_local_gluecodium --include-build $ENV{GLUECODIUM_PATH})
  else()
    unset(_build_local_gluecodium)
  endif()

  if(WIN32)
    set(_no_daemon --no-daemon)
  endif()

  unset(_gluecodium_time)
  if(DEFINED ENV{GLUECODIUM_TIME_LOGGING})
    set(_gluecodium_time time -o "${APIGEN_BUILD_OUTPUT_DIR}/gluecodium-time.log")
  endif()

  file(READ "${APIGEN_GLUECODIUM_OPTIONS_FILE}" _options_content)
  _print_status(
    "Gluecodium options (stored in file ${APIGEN_GLUECODIUM_OPTIONS_FILE}):\n${_options_content}\n")

  # All options are listed in file, gluecodium needs only path to this file
  set(APIGEN_GLUECODIUM_ARGS "-options \"${APIGEN_GLUECODIUM_OPTIONS_FILE}\"")

  set(_gluecodium_command
      ${_gluecodium_time}
      ${APIGEN_GLUECODIUM_GRADLE_WRAPPER}
      ${_build_local_gluecodium}
      ${_no_daemon}
      -Pversion=${APIGEN_GLUECODIUM_VERSION}
      run
      --args=${APIGEN_GLUECODIUM_ARGS})

  if(APIGEN_COMMON_OUTPUT_DIR)
    set(_make_common_output_dir ${CMAKE_COMMAND} -E make_directory ${APIGEN_COMMON_OUTPUT_DIR})
  else()
    set(_make_common_output_dir ${CMAKE_COMMAND} -E echo "No common directory specified")
  endif()

  if(NOT APIGEN_VERBOSE)
    set(_redirect_output OUTPUT_VARIABLE GENERATE_OUTPUT ERROR_VARIABLE GENERATE_OUTPUT)
  endif()

  execute_process(
    COMMAND ${CMAKE_COMMAND} -E make_directory ${APIGEN_OUTPUT_DIR} # otherwise java.io.File won't
                                                                    # have permissions to create
                                                                    # files at configure time
    COMMAND ${_make_common_output_dir}
    COMMAND ${_gluecodium_command}
    WORKING_DIRECTORY ${APIGEN_GLUECODIUM_DIR}
    RESULT_VARIABLE GENERATE_RESULT ${_redirect_output})

  if(GENERATE_RESULT)
    message(FATAL_ERROR "${GENERATE_OUTPUT}\nFailed to generate from given LimeIDL files")
  endif()
endfunction()

function(_collect_all_files_in_single_compilation_units)
  _include_all(cpp "cpp/*.cpp")

  if(APIGEN_GENERATOR MATCHES android)
    # Include all conversion headers first, so all later generic conversions relying on
    # specialization have all these defined
    _include_all(jni "android/jni/*_Conversion.h" "android/jni/*.cpp")
  elseif(APIGEN_GENERATOR MATCHES swift)
    _include_all(cbridge "cbridge/*.cpp")
    # Collect all includes to be used in the modulemap
    _include_all(cbridge_header "cbridge/*.h")
    _concatenate_swift_files()
  endif()
  # Support Android+Dart and Swift+Dart fused builds
  if(APIGEN_GENERATOR MATCHES dart)
    _include_all(dart "dart/ffi/*.cpp")
  endif()
endfunction()

function(_concatenate_swift_files)
  file(GLOB_RECURSE _main_swift RELATIVE "${APIGEN_OUTPUT_DIR}"
       "${APIGEN_OUTPUT_DIR}/swift/*.swift")

  file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_main}" "")
  foreach(_file ${_main_swift})
    file(READ "${APIGEN_OUTPUT_DIR}/${_file}" _content)
    file(APPEND "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_main}"
         "/////\n// ${_file}\n${_content}")
  endforeach()

  if(APIGEN_COMMON_OUTPUT_DIR)
    file(GLOB_RECURSE _common_swift RELATIVE "${APIGEN_OUTPUT_DIR}"
         "${APIGEN_COMMON_OUTPUT_DIR}/swift/*.swift")
    file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_common}" "")
    foreach(_file ${_common_swift})
      file(READ "${APIGEN_OUTPUT_DIR}/${_file}" _content)
      file(APPEND "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_common}"
           "/////\n// ${_file}\n${_content}")
    endforeach()
  endif()
endfunction()

function(_include_all _generator)
  unset(_main_files)
  unset(_common_files)
  foreach(_glob IN LISTS ARGN)
    file(GLOB_RECURSE _files "${APIGEN_OUTPUT_DIR}/${_glob}")
    list(APPEND _main_files ${_files})
    if(APIGEN_COMMON_OUTPUT_DIR)
      file(GLOB_RECURSE _files "${APIGEN_COMMON_OUTPUT_DIR}/${_glob}")
      list(APPEND _common_files ${_files})
    endif()
  endforeach()

  list(REMOVE_DUPLICATES _main_files)
  unset(_includes)
  foreach(_file IN LISTS _main_files)
    string(APPEND _includes "#include \"${_file}\"\n")
  endforeach()
  file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_${_generator}_main}" "${_includes}")

  if(APIGEN_COMMON_OUTPUT_DIR)
    list(REMOVE_DUPLICATES _common_files)
    unset(_includes)
    foreach(_file IN LISTS _common_files)
      string(APPEND _includes "#include \"${_file}\"\n")
    endforeach()
    file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_${_generator}_common}" "${_includes}")
  endif()
endfunction()

_main()
