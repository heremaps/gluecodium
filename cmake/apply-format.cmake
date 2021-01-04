#!/usr/bin/env cmake -P

set(REQUIRED_CMAKE_FORMAT_VERSION "0.6.5")
set(FORMAT_INSTALL_INSTRUCTIONS
    "1. Run to install 'pip' (only if you don't have it): sudo easy_install pip\n"
    "2. Run to install cmake-format: sudo pip install cmake-format==${REQUIRED_CMAKE_FORMAT_VERSION}\n"
)

function(_check_cmake_format_is_installed)
  set(_options REQUIRED)
  set(_single_args PATH_VARIABLE)
  cmake_parse_arguments(_args "${_options}" "${_single_args}" "" ${ARGN})

  find_program(_cmake_format_path cmake-format)
  if(NOT _cmake_format_path)
    if(_args_REQUIRED)
      set(_message_type FATAL_ERROR)
      set(_message_color RED)
    else()
      set(_message_type WARNING)
      set(_message_color YELLOW)
    endif()

    message_colored(
      ${_message_color} ${_message_type}
      "You need cmake-format version ${REQUIRED_CMAKE_FORMAT_VERSION}. You can install it:\n"
      ${FORMAT_INSTALL_INSTRUCTIONS})
    return()
  endif()

  message(STATUS "Found cmake-format: ${_cmake_format_path}")

  execute_process(
    COMMAND ${_cmake_format_path} --version
    RESULT_VARIABLE _cmake_format_result
    OUTPUT_VARIABLE _cmake_format_output
    ERROR_VARIABLE _cmake_format_output)
  if(_cmake_format_result)
    message_colored(YELLOW WARNING
                    "Failed to retrieve cmake-format version: ${_cmake_format_error}")
  endif()

  string(STRIP "${_cmake_format_output}" _cmake_format_output)
  if(NOT "${_cmake_format_output}" VERSION_EQUAL ${REQUIRED_CMAKE_FORMAT_VERSION})
    message_colored(
      YELLOW WARNING
      " cmake-format version seems to be wrong.\n"
      " Expected: '${REQUIRED_CMAKE_FORMAT_VERSION}' but it's '${_cmake_format_output}'")
  endif()

  if(_args_PATH_VARIABLE)
    set(${_args_PATH_VARIABLE} ${_cmake_format_path} PARENT_SCOPE)
  endif()
endfunction()

function(_cmake_format)
  _check_cmake_format_is_installed(REQUIRED PATH_VARIABLE _cmake_format_path)

  set(_options APPLY CHECK)
  set(_single_args ROOT_PATH)
  set(_multi_args FILES)
  cmake_parse_arguments(_args "${_options}" "${_single_args}" "${_multi_args}" ${ARGN})

  if(_args_APPLY)
    set(_format_option "--in-place")
  elseif(_args_CHECK)
    set(_format_option "--check")
  endif()

  set(_formatting_required NO)
  foreach(_source_file IN LISTS _args_FILES)
    unset(_cmake_format_result)

    execute_process(COMMAND ${_cmake_format_path} "${_source_file}" ${_format_option}
                    WORKING_DIRECTORY ${_args_ROOT_PATH} RESULT_VARIABLE _cmake_format_result)

    if(_cmake_format_result)
      if(_args_APPLY)
        message(FATAL_ERROR "Failed to run ${CLANG_FORMAT} on ${_source_file}")
      elseif(_args_CHECK)
        set(_formatting_required YES)
        message(STATUS "${_source_file} does not conform to code formatting rules")
      endif()
    endif()
  endforeach()

  if(_args_CHECK AND _formatting_required)
    message(
      FATAL_ERROR
        "CMake files require formatting, see above for details.\n"
        "If you see this on CI it means that you don't have the latest pre-commit hook or cmake-format installed.\n"
        ${FORMAT_INSTALL_INSTRUCTIONS})
  endif()

  message(STATUS "CMake format: OK")
endfunction()

file(GLOB_RECURSE _all_cmake_sources FOLLOW_SYMLINKS RELATIVE ${CMAKE_CURRENT_LIST_DIR}
     ${CMAKE_CURRENT_LIST_DIR}/modules/*.cmake ${CMAKE_CURRENT_LIST_DIR}/tests/**/*.cmake
     ${CMAKE_CURRENT_LIST_DIR}/tests/**/CMakeLists.txt)
_cmake_format(APPLY ROOT_PATH "${CMAKE_CURRENT_LIST_DIR}"
              FILES ${_all_cmake_sources} ${CMAKE_CURRENT_LIST_DIR}/apply-format.cmake)
