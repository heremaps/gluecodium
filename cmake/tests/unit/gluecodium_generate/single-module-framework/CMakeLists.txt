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

add_library(SingleModule SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
gluecodium_generate(SingleModule GENERATORS cpp swift)

gluecodium_target_lime_sources(SingleModule PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set(MACOSX_FRAMEWORK_NAME SingleModule)
set_target_properties(SingleModule PROPERTIES FRAMEWORK TRUE XCODE_ATTRIBUTE_DEFINES_MODULE YES)

# Check that generated Swift is compiled in the framework 'SingleModule'
add_library(UseSingleModule SHARED "${CMAKE_CURRENT_LIST_DIR}/swift/use_foo.swift")
target_link_libraries(UseSingleModule PRIVATE SingleModule)
set_target_properties(UseSingleModule PROPERTIES FRAMEWORK TRUE)
