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

.. command:check_symbols_exists_after_build

Checks that provided symbols exists in the provided binary after build.

  check_symbols_exists_after_build(
     <target>                   # Target to add post build command
     <lib_path>                 # Path to library, generator expressions can be used.
     <egrep_pattern>            # Symbols to find as extended grep pattern
   )
#]=======================================================================]

function(check_symbols_exists_after_build _target lib_path egrep_pattern)
    find_program(_grep_path NAMES grep)
    if (NOT _grep_path)
        message(FATAL_ERROR "Required grep utility wasn't found")
    endif ()

    _find_build_utility(_nm_path nm)
    if (NOT _nm_path)
        message(FATAL_ERROR "Required build utility nm wasn't found")
    endif ()

    add_custom_command(TARGET ${_target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E echo "Find symbol with regex pattern ${egrep_pattern} in binary ${lib_path}. Symbols doesn\\'t exists when this step fails"
        COMMAND ${_nm_path} ${lib_path} | ${_grep_path} -E \"${egrep_pattern}\")
endfunction()

#[=======================================================================[.rst:

Finds a build utility depending on GLUECODIUM_BUILD_ENVIRONMENT variable either
in Android NDK, in Xcode environment with xcrun or in host system.
Usage:
    _find_build_utility(
        <result>        # the result variable with full path to program.
                        # If nothing is found the result will be <result>-NOTFOUND
        <program_name>  # the name of program, for example 'nm'.
        )

#]=======================================================================]
function(_find_build_utility result program_name)
    if (NOT GLUECODIUM_BUILD_ENVIRONMENT OR GLUECODIUM_BUILD_ENVIRONMENT MATCHES "-host")
        # Host system's utility
        find_program(_utility_path NAMES ${program_name})
    elseif (GLUECODIUM_BUILD_ENVIRONMENT MATCHES "android-")
        _find_build_utility_in_android_ndk(_utility_path ${program_name})
    elseif (GLUECODIUM_BUILD_ENVIRONMENT MATCHES "ios-")
        _find_program_with_xcrun(_utility_path ${program_name})
    else ()
        message(FATAL_ERROR "Unknown GLUECODIUM_BUILD_ENVIRONMENT=${GLUECODIUM_BUILD_ENVIRONMENT}")
    endif ()

    set (${result} ${_utility_path} PARENT_SCOPE)
endfunction()

#[=======================================================================[.rst:

Finds a program by name in Android NDK for given Android ABI. For better results
next variables should be set (usually in cmake toolchain): ANDROID_ABI, ANDROID_PLATFORM
Usage:
    _find_build_utility_in_android_ndk(
        <result>        # the result variable with full path to program.
                        # If nothing is found the result will be <result>-NOTFOUND
        <program_name>  # the name of program, for example 'clang++'.
        )

#]=======================================================================]
function(_find_build_utility_in_android_ndk result name)
    # Following info is taken from documentation at
    # https://developer.android.com/ndk/guides/other_build_systems
    #
    # Path to utility should look like:
    # $NDK/toolchains/llvm/prebuilt/${HOST_TAG}/bin/${ABI_TAG}${ANDROID_API_LEVEL}-${UTILITY_NAME}
    # $NDK/toolchains/llvm/prebuilt/${HOST_TAG}/bin/${ABI_TAG}-${UTILITY_NAME}
    # $NDK/toolchains/llvm/prebuilt/${HOST_TAG}/bin/${UTILITY_NAME}
    #
    # For example:
    # $NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android-nm
    # $NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android28-clang++
    # $NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang-tidy
    #
    # HOST_TAG and ABI_TAG are taken from following tables:
    #
    # | Host           | HOST_TAG       |
    # -----------------------------------
    # | macOS          | darwin-x86_64  |
    # | Linux          | linux-x86_64   |
    # | 32-bit Windows | windows        |
    # | 64-bit Windows | windows-x86_64 |
    #
    # | ABI         | ABI_TAG                  |
    # ------------------------------------------
    # | armeabi-v7a | armv7a-linux-androideabi |
    # | arm64-v8a   | aarch64-linux-android    |
    # | x86         | i686-linux-android       |
    # | x86_64      | x86_64-linux-android     |

    unset (_possible_names)

    if (ANDROID_ABI)
        if (ANDROID_ABI STREQUAL "x86_64")
            set (_abi_tag "x86_64-linux-android")
        elseif (ANDROID_ABI STREQUAL "x86")
            set (_abi_tag "i686-linux-android")
        elseif (ANDROID_ABI STREQUAL "arm64-v8a")
            set (_abi_tag "aarch64-linux-android")
        elseif (ANDROID_ABI STREQUAL "armeabi-v7a")
            set (_abi_tag "armv7a-linux-androideabi")
        else()
            message(FATAL_ERROR "Unknown ANDROID_ABI=${ANDROID_ABI}")
        endif()

        if ("${ANDROID_PLATFORM}" MATCHES "android-([0-9]+)")
            list (APPEND _possible_names "${_abi_tag}${CMAKE_MATCH_1}-${program_name}")
        else()
            message(WARNING "ANDROID_PLATFORM was not provided or has incorrect format. Only restricted count of android utilities might be found")
        endif()

        list (APPEND _possible_names "${_abi_tag}-${program_name}")
    else()
        message(WARNING "ANDROID_ABI was not provided. Only restricted count of android utilities might be found")
    endif()

    # Order is important to pickup names with suffixes first
    list (APPEND _possible_names "${program_name}")

    find_program (
        _ndk_utility_path
        NAMES ${_possible_names}
        PATHS "${CMAKE_ANDROID_NDK}" ENV ANDROID_NDK_HOME ENV NDK_ROOT
        NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH
        PATH_SUFFIXES
            toolchains/llvm/prebuilt/darwin-x86_64/bin
            toolchains/llvm/prebuilt/linux-x86_64/bin
            toolchains/llvm/prebuilt/windows/bin
            toolchains/llvm/prebuilt/windows-x86_64/bin)

    set (${result} ${_ndk_utility_path} PARENT_SCOPE)
endfunction()

#[=======================================================================[.rst:

Finds a program by name using xcrun. Fails configuration if the program is not found
Usage:
    _find_program_with_xcrun(
        <result>        # the result variable with full path to program.
                        # If nothing is found and REQUIRED is not specified,
                        # the result will be <result>-NOTFOUND
        <program_name>  # the name of program, for example 'xcodebuild'.
        [REQUIRED]      # the option stops processing with an error message if
                        # the program cannot be found.
        )

#]=======================================================================]

function(_find_program_with_xcrun result program_name)
  if(NOT APPLE)
    message(FATAL_ERROR "xcrun is available only on the macOS platform")
  endif()
  set(_option_arg REQUIRED)
  cmake_parse_arguments(find_program_xcrun "${_option_arg}" "" "" ${ARGN})

  unset(xcrun_out)
  execute_process(
    COMMAND xcrun --find ${program_name}
    OUTPUT_VARIABLE xcrun_out
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_VARIABLE xcrun_err
    RESULT_VARIABLE xcrun_result)

  if(NOT xcrun_result EQUAL 0)
    if(find_program_xcrun_REQUIRED)
      message(SEND_ERROR "Failed to find program ${program_name}: ${xcrun_err}")
    else()
      set(${result} "${result}-NOTFOUND" PARENT_SCOPE)
      return()
    endif()
  endif()

  if(xcrun_out)
    set(${result} "${xcrun_out}" PARENT_SCOPE)
  else()
    if(find_program_xcrun_REQUIRED)
      message(SEND_ERROR "Failed to find program ${program_name}")
    else()
      set(${result} "${result}-NOTFOUND" PARENT_SCOPE)
    endif()
  endif()
endfunction()
