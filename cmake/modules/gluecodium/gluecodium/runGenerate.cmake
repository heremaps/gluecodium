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

include(${APIGEN_GLUECODIUM_DIR}/GeneratedSources.cmake)

function(_main)
    _generate()
    _collect_all_files_in_single_compilation_units()
endfunction()

function(_generate)
    if(DEFINED ENV{GLUECODIUM_PATH})
        message("Using local Gluecodium from " $ENV{GLUECODIUM_PATH})
        set(_build_local_gluecodium --include-build $ENV{GLUECODIUM_PATH})
    else()
        unset(_build_local_gluecodium)
    endif()

    if(DEFINED ENV{GLUECODIUM_TIME_LOGGING})
        set(_gluecodium_time time -o "${APIGEN_BUILD_OUTPUT_DIR}/gluecodium-time.log")
    else()
        unset(_gluecodium_time)
    endif()

    list(FILTER APIGEN_AUX_FILES INCLUDE REGEX ".*.lime")
    foreach(_aux_lime IN LISTS APIGEN_AUX_FILES)
      string(APPEND APIGEN_GLUECODIUM_ARGS " -auxinput \"${_aux_lime}\"")
    endforeach()
    set(_gluecodium_command ${_gluecodium_time} ${APIGEN_GLUECODIUM_GRADLE_WRAPPER} ${_build_local_gluecodium} -Pversion=${APIGEN_GLUECODIUM_VERSION} run --args=${APIGEN_GLUECODIUM_ARGS})

    execute_process(
        COMMAND ${CMAKE_COMMAND} -E make_directory ${APIGEN_OUTPUT_DIR} # otherwise java.io.File won't have permissions to create files at configure time
        COMMAND ${CMAKE_COMMAND} -E make_directory ${APIGEN_COMMON_OUTPUT_DIR}
        COMMAND ${_gluecodium_command}
        WORKING_DIRECTORY ${APIGEN_GLUECODIUM_DIR}
        RESULT_VARIABLE GENERATE_RESULT
        OUTPUT_VARIABLE GENERATE_OUTPUT
        ERROR_VARIABLE GENERATE_OUTPUT
        )
    if(GENERATE_RESULT)
        message(FATAL_ERROR "Failed to generate from given LimeIDL files:\n${GENERATE_OUTPUT}")
    elseif(APIGEN_VERBOSE)
        message(STATUS ${GENERATE_OUTPUT})
    endif()
    file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/gluecodium.log" "${GENERATE_OUTPUT}")
endfunction()

function(_collect_all_files_in_single_compilation_units)
    _include_all(cpp "cpp/*.cpp")

    if(APIGEN_GENERATOR STREQUAL android)
        # Include all conversion headers first, so all later generic conversions relying on specialization have all these defined
        _include_all(jni "android/jni/*_Conversion.h" "android/jni/*.cpp")
    elseif(APIGEN_GENERATOR STREQUAL swift)
        _include_all(cbridge "cbridge/*.cpp")
        # Collect all includes to be used in the modulemap
        _include_all(cbridge_header "cbridge/*.h")
        _concatenate_swift_files()
    elseif(APIGEN_GENERATOR STREQUAL dart)
        _include_all(dart "dart/ffi/*.cpp")
    endif()
endfunction()

function(_concatenate_swift_files)
    file(GLOB_RECURSE _main_swift RELATIVE "${APIGEN_OUTPUT_DIR}" "${APIGEN_OUTPUT_DIR}/swift/*.swift")

    file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_main}" "")
    foreach(_file ${_main_swift})
        file(READ "${APIGEN_OUTPUT_DIR}/${_file}" _content)
        file(APPEND "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_main}" "/////\n// ${_file}\n${_content}")
    endforeach()

    if(APIGEN_COMMON_OUTPUT_DIR)
        file(GLOB_RECURSE _common_swift RELATIVE "${APIGEN_OUTPUT_DIR}" "${APIGEN_COMMON_OUTPUT_DIR}/swift/*.swift")
        file(WRITE "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_common}" "")
        foreach(_file ${_common_swift})
            file(READ "${APIGEN_COMMON_OUTPUT_DIR}/${_file}" _content)
            file(APPEND "${APIGEN_BUILD_OUTPUT_DIR}/${APIGEN_GENERATED_swift_common}" "/////\n// ${_file}\n${_content}")
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
