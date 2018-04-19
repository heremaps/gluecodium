# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

if(DEFINED includeguard_ApigenSwiftModulemap)
  return()
endif()
set(includeguard_ApigenSwiftModulemap ON)

cmake_minimum_required(VERSION 3.5)

#.rst:
# ApigenSwiftModulemap
# -------------------
#
# This module builds Swift modulemap needed for the framework creation.
# The modulemap is used to get the Swift compiler into loading the header files and linking
# against the CBridge library without exposing the C bindings in the framework.
# The modulemap itself is not part of the framework.
#
# .. command:: apigen_swift_modulemap
#
# The general form of the command is::
#
#   apigen_swift_modulemap(target)
#

function(apigen_swift_modulemap target)

  get_target_property(GENERATOR ${target} APIGEN_GENIUM_GENERATOR)
  get_target_property(OUTPUT_DIR ${target} APIGEN_GENIUM_GENERATOR_OUTPUT_DIR)
  get_target_property(SWIFT_OUTPUT_DIR ${target} APIGEN_SWIFT_BUILD_OUTPUT_DIR)
  get_target_property(SWIFT_FRAMEWORK_VERSION ${target} APIGEN_SWIFT_FRAMEWORK_VERSION)

  if(NOT ${GENERATOR} MATCHES "swift")
    message(FATAL_ERROR "apigen_swift_modulemap() depends on apigen_generate() configured with generator 'swift'")
  endif()

  set(MODULEMAP_FRAMEWORK_PATH "${SWIFT_OUTPUT_DIR}/${target}.framework/Versions/${SWIFT_FRAMEWORK_VERSION}/Modules/module.modulemap")

  # Module map generation
  ## Top level:
  set(CBRIDGE_MODULE_MAP "module ${target} {\n")
  file(GLOB_RECURSE cbridge_headers ${OUTPUT_DIR}/cbridge/*.h)

  foreach(header IN LISTS cbridge_headers)
    set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n  header \"${header}\"")
  endforeach()

  set(CBRIDGE_MODULE_MAP "${CBRIDGE_MODULE_MAP}\n}\n")

  file(WRITE "${OUTPUT_DIR}/module.modulemap.generated" "${CBRIDGE_MODULE_MAP}")

  file(WRITE
    ${MODULEMAP_FRAMEWORK_PATH}
    "module ${target} {\n}\n")

  file(WRITE
    ${SWIFT_OUTPUT_DIR}/module.modulemap
    "module ${target} {\n}")

  # Clean up the modulemap after building to avoid double definition conflicts with the generated
  # framework - this is caused by using internally the same name as the final Xcode project
  # and Xcode will follow those caches
  add_custom_command(TARGET "${target}" PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${OUTPUT_DIR}/module.modulemap.generated" "${OUTPUT_DIR}/module.modulemap")
  if(APPLE)
    add_custom_command(TARGET "${target}" POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E remove "${OUTPUT_DIR}/module.modulemap")
  endif()


endfunction()
