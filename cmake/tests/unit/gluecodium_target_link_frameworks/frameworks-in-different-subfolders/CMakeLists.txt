cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

if(NOT APPLE OR NOT CMAKE_GENERATOR STREQUAL "Xcode")
  return()
endif()

enable_language(Swift)

add_subdirectory(framework-common-main)
add_subdirectory(framework-main)

# Check that generated Swift is compiled in the framework 'ModuleWithMainAndCommon'
add_library(ModuleUseMainOnly SHARED "${CMAKE_CURRENT_LIST_DIR}/swift/use_bar.swift")
add_dependencies(ModuleUseMainOnly ModuleWithMainOnly)
target_link_libraries(ModuleUseMainOnly PRIVATE ModuleWithMainOnly)

set(MACOSX_FRAMEWORK_NAME ModuleUseMainOnly)
set_target_properties(ModuleUseMainOnly PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER
                                                                  use.gluecodium.test)

set(framework_dir $<TARGET_BUNDLE_DIR:ModuleWithMainOnly>/..)
set_property(
  TARGET ModuleUseMainOnly APPEND_STRING
  PROPERTY XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS " -framework ModuleWithMainOnly -F${framework_dir}")
