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

if(DEFINED includeguard_gluecodium_swift_Compile)
  return()
endif()
set(includeguard_gluecodium_swift_Compile ON)

# 3.13 for generator expressions in add_custom_command(WORKING_DIRECTORY)
cmake_minimum_required(VERSION 3.13)

set(MINIMAL_CLANG_VERSION 5.0)
if(NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"
   OR CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
   OR CMAKE_CXX_COMPILER_VERSION VERSION_LESS ${MINIMAL_CLANG_VERSION})
  message(FATAL_ERROR "Clang compiler version > ${MINIMAL_CLANG_VERSION} is required,"
  "your compiler is ${CMAKE_CXX_COMPILER_ID} version ${CMAKE_CXX_COMPILER_VERSION}\n"
  "On Ubuntu 16.04 you can run\n"
  "apt-get install clang-${MINIMAL_CLANG_VERSION}\n"
  "update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang 100\n"
  "update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang++ 100\n
  and then do a clean rebuild")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/GetLinkLibraries.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Test.cmake)

#.rst:
# apigen_swift_compile
# -------------------
#
# This module create the framework structure and
# compiles and generate the framework binary.
#
# .. command:: apigen_swift_compile
#
# The general form of the command is::
#
#     apigen_swift_compile(target)
#

function(apigen_swift_compile target architecture)

  set(multiArgs FRAMEWORKS FRAMEWORK_DIRS)
  cmake_parse_arguments(APIGEN_SWIFT_COMPILE "" "" "${multiArgs}" ${ARGN})

  get_target_property(GENERATOR ${target} APIGEN_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_OUTPUT_DIR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)
  get_target_property(SWIFT_FRAMEWORK_VERSION_SHORT ${target} APIGEN_SWIFT_FRAMEWORK_VERSION_SHORT)
  get_target_property(SWIFT_FRAMEWORK_MINIMUM_OS_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_MINIMUM_OS_VERSION)
  get_target_property(SWIFT_FRAMEWORK_NAME ${target} APIGEN_SWIFT_FRAMEWORK_NAME)

  if(NOT ADDITIONAL_SOURCES)
    set(ADDITIONAL_SOURCES "")
  endif()
  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_compile() depends on apigen_generate() configured with generator 'swift'")
  endif()

  if(APPLE)
    if(XCODE_IOS_PLATFORM)
      execute_process(COMMAND xcrun --sdk "${XCODE_IOS_PLATFORM}" --find swiftc
        OUTPUT_VARIABLE SWIFTC)
    else()
      execute_process(COMMAND xcrun --find swiftc
        OUTPUT_VARIABLE SWIFTC)
    endif()
    string(STRIP ${SWIFTC} SWIFTC)
  else()
    find_program(SWIFTC swiftc)
  endif()

  if(SWIFTC)
    execute_process(COMMAND ${SWIFTC} --version OUTPUT_VARIABLE SWIFTC_VERSION)
    message(STATUS "[Swift] ${SWIFTC_VERSION}")
  else()
    message(FATAL_ERROR "Swift compiler was not found")
  endif()

  set(TARGET_ARCHITECTURE ${architecture})

  if(IOS_DEPLOYMENT_TARGET)
    # If the toolchain does not specify the platform, it uses 'iphone' by default.
    if(NOT XCODE_PLATFORM_SUFFIX)
      set(XCODE_PLATFORM_SUFFIX "ios")
    endif()
    set(full_target ${TARGET_ARCHITECTURE}-apple-${XCODE_PLATFORM_SUFFIX}${IOS_DEPLOYMENT_TARGET})
    message(STATUS "[Swift] Cross compiling for target ${full_target} for ${CMAKE_OSX_SYSROOT}")
    set(swift_target_flag -target ${full_target} -sdk ${CMAKE_OSX_SYSROOT})
  else()
    message(STATUS "[Swift] Compiling for target ${TARGET_ARCHITECTURE})")
    if(APPLE)
      set(full_target ${TARGET_ARCHITECTURE}-apple-apple-macosx10.12)
      set(swift_target_flag -target ${full_target} -sdk ${CMAKE_OSX_SYSROOT})
    else()
      set(swift_target_flag -target-cpu ${TARGET_ARCHITECTURE})
    endif()
  endif()

  set(MODULE_NAME ${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>)
  get_target_property(TARGET_TYPE ${target} TYPE)
  if(APPLE)
    if(NOT CMAKE_Swift_COMPILER_LOADED)
      messagE(FATAL_ERROR "Swift language must be enabled on top level")
    endif()
    set(SWIFT_FLAGS "-import-underlying-module -I${SWIFT_OUTPUT_DIR}")
    foreach(FRAMEWORK ${APIGEN_SWIFT_COMPILE_FRAMEWORKS})
      set(SWIFT_FLAGS "${SWIFT_FLAGS} -framework ${FRAMEWORK}")
    endforeach()
    foreach(FRAMEWORK_DIR ${APIGEN_SWIFT_COMPILE_FRAMEWORK_DIRS})
      set(SWIFT_FLAGS "${SWIFT_FLAGS} -F${FRAMEWORK_DIR}")
    endforeach()
    set(SWIFT_DEBUG_FLAG "-D DEBUG")
    set_target_properties(${target} PROPERTIES
      FRAMEWORK TRUE
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS "${SWIFT_FLAGS}"
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS[variant=Debug] "${SWIFT_FLAGS} ${SWIFT_DEBUG_FLAG}"
      XCODE_ATTRIBUTE_OTHER_LDFLAGS "-lc++"
      XCODE_ATTRIBUTE_PRODUCT_NAME ${SWIFT_FRAMEWORK_NAME})
    install(TARGETS ${target} FRAMEWORK DESTINATION .)
  else()
    # The custom Swift compile step needs to collect link libraries manually for static targets.
    if(NOT TARGET_TYPE STREQUAL "STATIC_LIBRARY")
      message(FATAL_ERROR "Building Swift on linux requires a \"STATIC_LIBRARY\" target which will be embedded the dynamic framework.")
    endif()
    # Rename the C++ lib so we can reuse the name for the final library. The name should also indicate that it's not a usable library.
    set_target_properties(${target} PROPERTIES ARCHIVE_OUTPUT_NAME ${MODULE_NAME}_intermediate)

    get_swiftc_arguments(${target} swift_link_libraries)

    get_target_property(additional_swift_flags ${target} APIGEN_SWIFT_FLAGS)
    if(additional_swift_flags)
      list(APPEND swift_target_flag ${additional_swift_flags})
    endif()

    set(BUILD_ARGUMENTS
      -I${OUTPUT_DIR}
      -I${SWIFT_OUTPUT_DIR}
      -L${SWIFT_OUTPUT_DIR}
      -import-underlying-module
      "${swift_link_libraries}"
      ${swift_target_flag}
      -emit-module
      -emit-library
      -module-name ${target}
      -o "lib${target}.so"
      -Xlinker "-rpath=$$ORIGIN"
      )

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if(uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
      set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif()

    get_property(all_sources TARGET ${target} PROPERTY SOURCES)
    set(swift_sources)
    foreach(source ${all_sources})
      get_filename_component(extension "${source}" EXT)
      if(extension STREQUAL ".swift")
        list(APPEND swift_sources "${source}")
      endif()
    endforeach()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMENT "Compiling generated Swift sources -> ${BUILD_ARGUMENTS}"
      COMMAND ${SWIFTC} "${BUILD_ARGUMENTS}" ${swift_sources} ${ADDITIONAL_SOURCES}
      WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR}
      COMMAND_EXPAND_LISTS)

    # Attach swiftc arguments needed to use the Swift module in other targets
    target_link_libraries(${target} INTERFACE "$<BUILD_INTERFACE:-L${SWIFT_OUTPUT_DIR}>" "$<BUILD_INTERFACE:-l${target}>")
    target_include_directories(${target} INTERFACE "$<BUILD_INTERFACE:${SWIFT_OUTPUT_DIR}>")

    install(
      FILES
        "${SWIFT_OUTPUT_DIR}/${target}.swiftmodule"
        "${SWIFT_OUTPUT_DIR}/${target}.swiftdoc"
      DESTINATION .)
    install(PROGRAMS "${SWIFT_OUTPUT_DIR}/lib${target}.so" DESTINATION .)
    if(${TARGET_TYPE} STREQUAL SHARED_LIBRARY)
      install(TARGETS ${target} DESTINATION .)
    endif()
  endif()
endfunction()
