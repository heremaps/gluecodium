cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

if(APPLE AND CMAKE_GENERATOR STREQUAL "Xcode")
  enable_language(Swift)
endif()

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(gluecodium/Gluecodium)

get_supported_gluecodium_generators(_gluecodium_generator)

if(ANDROID)
  set(_expected_symbol "Java_com_example_unit_test_Foo_make")
elseif(CMAKE_GENERATOR STREQUAL "Xcode")
  set(_expected_symbol "unit_test_Foo_make")
endif()

add_library(single.module SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
target_link_libraries(single.module PRIVATE Threads::Threads)

gluecodium_generate(single.module GENERATORS ${_gluecodium_generator})
set_property(TARGET single.module APPEND PROPERTY GLUECODIUM_LIME_SOURCES
                                                  "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

test_expect_true(CONDITION TARGET single.module.gluecodium.generate
                 MESSAGE "gluecodium_generate must create target <target>.gluecodium.generate")

if(_expected_symbol)
  include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_symbols_after_build.cmake)
  check_symbols_after_build(single.module EXPECT_EXIST "${_expected_symbol}")
endif()
