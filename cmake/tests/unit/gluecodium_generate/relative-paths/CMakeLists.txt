cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(gluecodium/Gluecodium)

get_supported_gluecodium_generators(_gluecodium_generator)

add_library(single.module.package SHARED "cpp/FooImpl.cpp")

gluecodium_generate(single.module.package GENERATORS ${_gluecodium_generator}
                    OUTPUT_DIR "relative/output/path")
gluecodium_target_lime_sources(single.module.package PRIVATE "lime/foo.lime")

# TODO: Add more relative paths (namerules, etc)
