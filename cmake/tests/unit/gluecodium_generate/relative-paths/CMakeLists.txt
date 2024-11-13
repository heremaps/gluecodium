cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/get_supported_gluecodium_generators.cmake)
include(gluecodium/Gluecodium)

get_supported_gluecodium_generators(_gluecodium_generator)

add_library(single.module.package SHARED "cpp/FooImpl.cpp")
target_link_libraries(single.module.package PRIVATE Threads::Threads)

gluecodium_generate(single.module.package GENERATORS ${_gluecodium_generator}
                    OUTPUT_DIR "relative/output/path")
gluecodium_target_lime_sources(single.module.package PRIVATE "lime/foo.lime")

# TODO: Add more relative paths (namerules, etc)
