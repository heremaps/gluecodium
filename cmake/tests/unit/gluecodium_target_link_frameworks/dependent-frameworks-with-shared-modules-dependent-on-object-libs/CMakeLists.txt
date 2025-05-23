cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

if(NOT APPLE OR NOT CMAKE_GENERATOR STREQUAL "Xcode")
  return()
else()
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-undefined,error")
endif()

enable_language(Swift)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)
include(gluecodium/Swift)

if(TEST_USE_ALIASES)
  set(TARGET_OBJECT_WITH_MAIN_AND_COMMON test::ObjectWithMainAndCommon)
  set(TARGET_OBJECT_WITH_MAIN_ONLY test::ObjectWithMainOnly)
  set(TARGET_MODULE_WITH_MAIN_AND_COMMON test::ModuleWithMainAndCommon)
else()
  set(TARGET_OBJECT_WITH_MAIN_AND_COMMON ObjectWithMainAndCommon)
  set(TARGET_OBJECT_WITH_MAIN_ONLY ObjectWithMainOnly)
  set(TARGET_MODULE_WITH_MAIN_AND_COMMON ModuleWithMainAndCommon)
endif()

# COMMON + MAIN
add_library(ObjectWithMainAndCommon OBJECT)
add_library(test::ObjectWithMainAndCommon ALIAS ObjectWithMainAndCommon)
gluecodium_generate(ObjectWithMainAndCommon GENERATORS cpp swift)
gluecodium_target_lime_sources(ObjectWithMainAndCommon
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")
set_target_properties(ObjectWithMainAndCommon PROPERTIES GLUECODIUM_SWIFT_EXPOSE_INTERNALS ON)

# Ensure, that required external symbols related to CBridge code are exposed. By default they are
# unconditionally exported only for `SHARED` target. Please check scenario 2 in 'Generate.cmake'.
gluecodium_get_target_compile_definitions(ObjectWithMainAndCommon
                                          RESULT_PUBLIC _public_common RESULT_PRIVATE _private_common)
target_compile_definitions(ObjectWithMainAndCommon PUBLIC ${_public_common} PRIVATE ${_private_common})

add_library(ModuleWithMainAndCommon SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")
add_library(test::ModuleWithMainAndCommon ALIAS ModuleWithMainAndCommon)
target_link_libraries(ModuleWithMainAndCommon PUBLIC ${TARGET_OBJECT_WITH_MAIN_AND_COMMON})

set(MACOSX_FRAMEWORK_NAME ModuleWithMainAndCommon)
set_target_properties(
  ModuleWithMainAndCommon
  PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER gluecodium.common.main.test

             XCODE_ATTRIBUTE_DEFINES_MODULE YES)
gluecodium_target_swift_sources(ModuleWithMainAndCommon COLLECT_FROM_DEPENDENCIES
                                ADD_MODULE_MODULEMAP)

if(TEST_OUTPUT_CUSTOM_NAME)
  set_target_properties(ModuleWithMainAndCommon PROPERTIES OUTPUT_NAME CustomName)
endif()

# MAIN
add_library(ObjectWithMainOnly OBJECT)
add_library(test::ObjectWithMainOnly ALIAS ObjectWithMainOnly)
gluecodium_generate(ObjectWithMainOnly GENERATORS cpp swift MAIN_ONLY)
gluecodium_target_lime_sources(ObjectWithMainOnly
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
target_link_libraries(ObjectWithMainOnly PUBLIC ModuleWithMainAndCommon)

add_library(ModuleWithMainOnly SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(ModuleWithMainOnly PRIVATE ${TARGET_OBJECT_WITH_MAIN_ONLY})

set(MACOSX_FRAMEWORK_NAME ModuleWithMainOnly)
set_target_properties(
  ModuleWithMainOnly
  PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER gluecodium.main.test

             XCODE_ATTRIBUTE_DEFINES_MODULE YES)

gluecodium_target_swift_sources(ModuleWithMainOnly COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
get_target_property(_main_only_swift_sources ModuleWithMainOnly GLUECODIUM_SWIFT)
if(GLUECODIUM_DONT_USE_TARGET_GENEX_EVAL)
  test_expect_strequal_lists(
    EXPECTED
      "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/ObjectWithMainOnly/cpp-swift/unity/swift/ObjectWithMainOnly_main_glue.swift"
    ACTUAL ${_main_only_swift_sources}
    MESSAGE "When Swift sources are collected then they should belong only to the current target")
else()
  test_expect_strequal_lists(
    EXPECTED
      "$<TARGET_GENEX_EVAL:ModuleWithMainOnly,$<TARGET_PROPERTY:${TARGET_OBJECT_WITH_MAIN_ONLY},GLUECODIUM_SWIFT>>"
    ACTUAL ${_main_only_swift_sources}
    MESSAGE "When Swift sources are collected then they should belong only to the current target")
endif()

gluecodium_target_link_frameworks(
  ModuleWithMainOnly FRAMEWORKS ${TARGET_MODULE_WITH_MAIN_AND_COMMON}
  COMMON_FRAMEWORK ${TARGET_MODULE_WITH_MAIN_AND_COMMON})

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

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_symbols_after_build.cmake)
check_symbols_after_build(ModuleWithMainAndCommon EXPECT_EXIST "unit_test_CommonMainFoo_make")
check_symbols_after_build(ModuleWithMainOnly EXPECT_EXIST "unit_test_MainBar_make"
                          EXPECT_NOT_EXIST "unit_test_CommonMainFoo_make")
