cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(gluecodium/Gluecodium)

add_library(single.module SHARED "${CMAKE_CURRENT_LIST_DIR}/cpp/FooImpl.cpp")

gluecodium_generate(single.module GENERATORS cpp)
