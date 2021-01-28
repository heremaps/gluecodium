cmake_minimum_required(VERSION 3.12)

project(gluecodium.test.bar)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)
include(gluecodium/Swift)

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
