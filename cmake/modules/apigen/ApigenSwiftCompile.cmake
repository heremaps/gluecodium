# Copyright (C) 2016-2018 HERE Europe B.V.
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

if(DEFINED includeguard_ApigenSwiftCompile)
  return()
endif()
set(includeguard_ApigenSwiftCompile ON)

cmake_minimum_required(VERSION 3.5)

set(MINIMAL_CLANG_VERSION 5.0)
if(NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang"))
  message(FATAL_ERROR "Clang compiler is required, your compiler identifies as ${CMAKE_CXX_COMPILER_ID}.
  On Ubuntu 16.04 you can run
    apt-get install clang-${MINIMAL_CLANG_VERSION}
  and then do a clean CMake run passing -DCMAKE_CXX_COMPILER=clang++ and -DCMAKE_C_COMPILER=clang
  ")
endif()
if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS ${MINIMAL_CLANG_VERSION})
  message(FATAL_ERROR "Clang compiler version > ${MINIMAL_CLANG_VERSION} is required,
  your compiler is ${CMAKE_CXX_COMPILER_ID} version ${CMAKE_CXX_COMPILER_VERSION}
  On Ubuntu 16.04 you can run
    apt-get install clang-${MINIMAL_CLANG_VERSION}
    update-alternatives --install /usr/bin/clang clang \\
      /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang 100
    update-alternatives --install /usr/bin/clang++ clang++ \\
      /usr/lib/llvm-${MINIMAL_CLANG_VERSION}/bin/clang++ 100
  and then do a clean rebuild
  ")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/ApigenSwiftTest.cmake)


#.rst:
# apigen_swift_compile
# -------------------
#
# This module create the framework structur and
# compiles and generate the framework binary.
#
# .. command:: apigen_swift_compile
#
# The general form of the command is::
#
#   apigen_swift_compile(target)
#

function(apigen_swift_compile target architecture)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)
  get_target_property(ADDITIONAL_SOURCES ${target} APIGEN_GENIUM_GENERATOR_ADDITIONAL_SOURCES)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)

  if(NOT ADDITIONAL_SOURCES)
    set(ADDITIONAL_SOURCES "")
  endif()
  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_compile() depends on apigen_generate() configured with generator 'swift'")
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

  file(GLOB_RECURSE SOURCES ${OUTPUT_DIR}/swift/*.swift)

  set(MODULE_NAME ${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>)
  if(APPLE)
    # CMakes compiler check is outdated and fails for Swift 4.0, force it to pass.
    set(CMAKE_Swift_COMPILER_FORCED TRUE)
    enable_language(Swift)

    set(SWIFT_FLAGS "-import-underlying-module -I${OUTPUT_DIR} -module-name=${target}")
    set(SWIFT_DEBUG_FLAG "-D DEBUG")

    set_target_properties(${target} PROPERTIES
      FRAMEWORK TRUE
      FRAMEWORK_VERSION ${SWIFT_FRAMEWORK_VERSION}
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS "${SWIFT_FLAGS}"
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS[variant=Debug] "${SWIFT_FLAGS} ${SWIFT_DEBUG_FLAG}"
      XCODE_ATTRIBUTE_OTHER_LDFLAGS "-lc++"
      XCODE_ATTRIBUTE_SWIFT_VERSION "4.0"
      XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=Debug] "YES"
      XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=RelWithDebInfo] "YES"
      )
    install(TARGETS ${target} FRAMEWORK DESTINATION .)
  else()
    set(MODULE_NAME ${MODULE_NAME}swift)
    set(BUILD_ARGUMENTS
      -I${OUTPUT_DIR}
      -import-underlying-module
      -L\$<TARGET_FILE_DIR:${target}>
      -l${target}$<TARGET_PROPERTY:${target},DEBUG_POSTFIX>
      ${swift_target_flag}
      -emit-module
      -emit-library
      -module-name ${target}
      -o "lib${MODULE_NAME}.so"
      )

    string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
    if(uppercase_CMAKE_BUILD_TYPE MATCHES "^(DEBUG|RELWITHDEBINFO)$")
      set(BUILD_ARGUMENTS ${BUILD_ARGUMENTS} -g)
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMENT "Compiling generated Swift sources -> ${BUILD_ARGUMENTS}"
      COMMAND swiftc ${BUILD_ARGUMENTS} ${SOURCES} ${ADDITIONAL_SOURCES}
      WORKING_DIRECTORY ${SWIFT_OUTPUT_DIR})

    install(
      FILES
        "${SWIFT_OUTPUT_DIR}/lib${MODULE_NAME}.so"
        "${SWIFT_OUTPUT_DIR}/${target}.swiftmodule"
        "${SWIFT_OUTPUT_DIR}/${target}.swiftdoc"
        "${SWIFT_OUTPUT_DIR}/module.modulemap"
      DESTINATION .)
  endif()

  apigen_swift_test(${target} "${swift_target_flag}" ${MODULE_NAME})

endfunction()
