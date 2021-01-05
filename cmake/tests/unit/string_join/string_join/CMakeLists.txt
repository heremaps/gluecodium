cmake_minimum_required(VERSION 3.12)

project(gluecodium.test)

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH "${GLUECODIUM_CMAKE_DIR}/modules")

include(${GLUECODIUM_CMAKE_TESTS_DIR}/utils/assert.cmake)
include(gluecodium/gluecodium/StringJoin)

string_join("-" _result)
test_expect_strequal(EXPECTED "" ACTUAL "${_result}"
                     MESSAGE "When list contains no words then result is empty")

string_join("-" _result oneword)
test_expect_strequal(EXPECTED "oneword" ACTUAL "${_result}"
                     MESSAGE "When list contains one word then no glue is used")

string_join("-" _result firstword secondword)
test_expect_strequal(EXPECTED "firstword-secondword" ACTUAL "${_result}"
                     MESSAGE "When list contains more than one word then glue is used")

set(GLUECODIUM_DONT_USE_STRING_JOIN ON)
unset(_result)

string_join("-" _result)
test_expect_strequal(EXPECTED "" ACTUAL "${_result}"
                     MESSAGE "When list contains no words then result is empty")

string_join("-" _result oneword)
test_expect_strequal(EXPECTED "oneword" ACTUAL "${_result}"
                     MESSAGE "When list contains one word then no glue is used")

string_join("-" _result firstword secondword)
test_expect_strequal(EXPECTED "firstword-secondword" ACTUAL "${_result}"
                     MESSAGE "When list contains more than one word then glue is used")
