cmake_minimum_required(VERSION 3.12)

project(gluecodium.test.foo)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

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

             XCODE_ATTRIBUTE_DEFINES_MODULE YES OUTPUT_NAME CustomName)
