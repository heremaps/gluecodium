cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)


# Following hierarchy ended up in Swift code which mistakenly.
# - imported framework1 in OBJECT BASE.
# - unconditionally imported framework1 and framework2 in OBJECT DEPENDANT1.
#
#                    OBJECT BASE
#                    /      \   \
#     FRAMEWORK BASE1        \  FRAMEWORK BASE2
#           |                 \       |
#     OBJECT DEPENDANT1       OBJECT DEPENDANT2
#           |            \            |
#           |             \           |
#           |              \          |
#   FRAMEWORK DEPENDANT1     FRAMEWORK DEPENDANT2

if(NOT APPLE OR NOT CMAKE_GENERATOR STREQUAL "Xcode")
  return()
endif()

enable_language(Swift)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/Gluecodium)
include(gluecodium/Swift)

# OBJECT BASE
add_library(ObjectBase OBJECT)
gluecodium_generate(ObjectBase GENERATORS cpp swift)
gluecodium_target_lime_sources(ObjectBase
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")
set_target_properties(ObjectBase PROPERTIES GLUECODIUM_SWIFT_EXPOSE_INTERNALS ON)

# FRAMEWORK BASE1
add_library(FrameworkBase1 SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")
target_link_libraries(FrameworkBase1 PUBLIC ObjectBase)
set(MACOSX_FRAMEWORK_NAME FrameworkBase1)
set_target_properties(
  FrameworkBase1
  PROPERTIES FRAMEWORK TRUE
             MACOSX_FRAMEWORK_IDENTIFIER gluecodium.common.main.test
             XCODE_ATTRIBUTE_DEFINES_MODULE YES)
gluecodium_target_swift_sources(FrameworkBase1 COLLECT_FROM_DEPENDENCIES
                                ADD_MODULE_MODULEMAP)

# FRAMEWORK BASE2
add_library(FrameworkBase2 SHARED EXCLUDE_FROM_ALL "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")
target_link_libraries(FrameworkBase2 PUBLIC ObjectBase)
set(MACOSX_FRAMEWORK_NAME FrameworkBase2)
set_target_properties(
  FrameworkBase2
  PROPERTIES FRAMEWORK TRUE
             MACOSX_FRAMEWORK_IDENTIFIER gluecodium.common.main.test
             XCODE_ATTRIBUTE_DEFINES_MODULE YES)
gluecodium_target_swift_sources(FrameworkBase2 COLLECT_FROM_DEPENDENCIES
                                ADD_MODULE_MODULEMAP)

# OBJECT DEPENDANT1
add_library(ObjectDependant1 OBJECT)
gluecodium_generate(ObjectDependant1 GENERATORS cpp swift MAIN_ONLY)
gluecodium_target_lime_sources(ObjectDependant1
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
target_link_libraries(ObjectDependant1 PUBLIC FrameworkBase1)

# OBJECT DEPENDANT2
add_library(ObjectDependant2 OBJECT EXCLUDE_FROM_ALL)
gluecodium_generate(ObjectDependant2 GENERATORS cpp swift MAIN_ONLY)
gluecodium_target_lime_sources(ObjectDependant2
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
target_link_libraries(ObjectDependant2 PUBLIC ObjectBase FrameworkBase2)

# FRAMEWORK DEPENDANT1
add_library(FrameworkDependant1 SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp" "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(FrameworkDependant1 PRIVATE ObjectDependant1)
set(MACOSX_FRAMEWORK_NAME FrameworkDependant1)
set_target_properties(
  FrameworkDependant1
  PROPERTIES FRAMEWORK TRUE
             MACOSX_FRAMEWORK_IDENTIFIER gluecodium.main.test
             XCODE_ATTRIBUTE_DEFINES_MODULE YES
             XCODE_ATTRIBUTE_SWIFT_ACTIVE_COMPILATION_CONDITIONS "DONT_IMPORT_FRAMEWORKBASE2")
gluecodium_target_swift_sources(FrameworkDependant1 COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
gluecodium_target_link_frameworks(
  FrameworkDependant1 FRAMEWORKS FrameworkBase1
  COMMON_FRAMEWORK FrameworkBase1)

# FRAMEWORK DEPENDANT2
add_library(FrameworkDependant2 SHARED EXCLUDE_FROM_ALL "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp" "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp")
target_link_libraries(FrameworkDependant2 PRIVATE ObjectDependant1 ObjectDependant2)
set(MACOSX_FRAMEWORK_NAME FrameworkDependant2)
set_target_properties(
  FrameworkDependant2
  PROPERTIES FRAMEWORK TRUE
             MACOSX_FRAMEWORK_IDENTIFIER gluecodium.main.test
             XCODE_ATTRIBUTE_DEFINES_MODULE YES)
gluecodium_target_swift_sources(FrameworkDependant2 COLLECT_FROM_DEPENDENCIES ADD_MODULE_MODULEMAP)
gluecodium_target_link_frameworks(
  FrameworkDependant2 FRAMEWORKS FrameworkBase2
  COMMON_FRAMEWORK FrameworkBase2)
