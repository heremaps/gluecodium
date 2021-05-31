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
if(TEST_USE_ALIASES)
  target_link_libraries(ModuleUseMainOnly PRIVATE test::ModuleWithMainOnly
                                                  test::ModuleWithMainAndCommon)
else()
  target_link_libraries(ModuleUseMainOnly PRIVATE ModuleWithMainOnly ModuleWithMainAndCommon)
endif()

set(MACOSX_FRAMEWORK_NAME ModuleUseMainOnly)
set_target_properties(ModuleUseMainOnly PROPERTIES FRAMEWORK TRUE MACOSX_FRAMEWORK_IDENTIFIER
                                                                  use.gluecodium.test)
if(TEST_USE_ALIASES)
  set_property(
    TARGET ModuleUseMainOnly
    APPEND_STRING
    PROPERTY
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS
      " -framework ModuleWithMainOnly -F$<TARGET_BUNDLE_DIR:test::ModuleWithMainOnly>/.. -framework CustomName -F$<TARGET_BUNDLE_DIR:test::ModuleWithMainAndCommon>/.."
  )
else()
  set_property(
    TARGET ModuleUseMainOnly
    APPEND_STRING
    PROPERTY
      XCODE_ATTRIBUTE_OTHER_SWIFT_FLAGS
      " -framework ModuleWithMainOnly -F$<TARGET_BUNDLE_DIR:ModuleWithMainOnly>/.. -framework CustomName -F$<TARGET_BUNDLE_DIR:ModuleWithMainAndCommon>/.."
  )
endif()
