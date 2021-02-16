cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

if(NOT APPLE OR NOT CMAKE_GENERATOR STREQUAL "Xcode")
  return()
endif()

enable_language(Swift)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)
include(gluecodium/Swift)

# COMMON + MAIN
add_library(ModuleWithMainAndCommon SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")
gluecodium_generate(ModuleWithMainAndCommon GENERATORS cpp swift)

gluecodium_target_lime_sources(ModuleWithMainAndCommon
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

set(MACOSX_FRAMEWORK_NAME ModuleWithMainAndCommon)
set_target_properties(
  ModuleWithMainAndCommon
  PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER gluecodium.common.main.test

             GLUECODIUM_SWIFT_EXPOSE_INTERNALS ON XCODE_ATTRIBUTE_DEFINES_MODULE YES)

if(TEST_OUTPUT_CUSTOM_NAME)
  set_target_properties(ModuleWithMainAndCommon PROPERTIES OUTPUT_NAME CustomName)
endif()

# MAIN
add_library(ModuleWithMainOnly SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
gluecodium_generate(ModuleWithMainOnly GENERATORS cpp swift MAIN_ONLY)

gluecodium_target_lime_sources(ModuleWithMainOnly
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")

set(MACOSX_FRAMEWORK_NAME ModuleWithMainOnly)
set_target_properties(
  ModuleWithMainOnly
  PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER gluecodium.main.test

             XCODE_ATTRIBUTE_DEFINES_MODULE YES)

gluecodium_target_link_frameworks(ModuleWithMainOnly FRAMEWORKS ModuleWithMainAndCommon
                                  COMMON_FRAMEWORK ModuleWithMainAndCommon)

# Check that generated Swift is compiled in the framework 'ModuleWithMainAndCommon'
add_library(ModuleUseMainOnly SHARED)
if(TEST_OUTPUT_CUSTOM_NAME)
  set(_user_bar_swift "${CMAKE_CURRENT_LIST_DIR}/swift/use_bar_custom.swift")
else()
  set(_user_bar_swift "${CMAKE_CURRENT_LIST_DIR}/swift/use_bar.swift")
endif()
target_sources(ModuleUseMainOnly PRIVATE ${_user_bar_swift})
add_dependencies(ModuleUseMainOnly ModuleWithMainOnly)
target_link_libraries(ModuleUseMainOnly PRIVATE ModuleWithMainOnly)

set(MACOSX_FRAMEWORK_NAME ModuleUseMainOnly)
set_target_properties(ModuleUseMainOnly PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER
                                                                  use.gluecodium.test)
