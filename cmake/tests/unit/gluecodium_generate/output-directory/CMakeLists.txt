cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/check_file_or_directory_exists_after_build.cmake)
include(gluecodium/Gluecodium)

add_library(custom.output SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
add_library(custom.generator.folder SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")
add_library(custom.base.output SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(custom.output GENERATORS cpp
                    OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/custom-output")
gluecodium_target_lime_sources(custom.output PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set(GLUECODIUM_GENERATOR_FOLDER_DEFAULT "custom-generator-folder")
gluecodium_generate(custom.generator.folder GENERATORS cpp)
gluecodium_target_lime_sources(custom.generator.folder
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

set(GLUECODIUM_BASE_OUTPUT_DIR_DEFAULT "${CMAKE_CURRENT_BINARY_DIR}/custom-base-output")
gluecodium_generate(custom.base.output GENERATORS cpp)
gluecodium_target_lime_sources(custom.base.output PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/foo.lime")

foreach(_subfolder "common/cpp" "main/cpp" "unity/cpp")
  check_file_or_directory_exists_after_build(
    custom.output "${CMAKE_CURRENT_BINARY_DIR}/custom-output/${_subfolder}")

  check_file_or_directory_exists_after_build(
    custom.generator.folder
    "${CMAKE_CURRENT_BINARY_DIR}/gluecodium/custom.generator.folder/custom-generator-folder/${_subfolder}"
  )

  check_file_or_directory_exists_after_build(
    custom.base.output
    "${CMAKE_CURRENT_BINARY_DIR}/custom-base-output/custom.base.output/custom-generator-folder/${_subfolder}"
  )
endforeach()
