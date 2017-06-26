# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(ios)

if(NOT HELLO_BUILD_IOS_APP)
    return()
endif()

set(CMAKE_CXX_STANDARD 11)
set(package_name hello)
set(bridge_target c_${package_name})

get_target_property(API_GEN_BASE_DIR hello APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

add_library(${bridge_target} STATIC ${API_GEN_BASE_DIR}/cbridge/${package_name}/HelloWorld)
target_link_libraries(${bridge_target} hello)

set(SWIFT_LIBRARY ${package_name})
set(SWIFT_LIBRARY_C_BRIDGE ${bridge_target})
configure_file(resources/Package.swift.in swift/Package.swift)

#TODO generate into the right folder
file(COPY ${API_GEN_BASE_DIR}/swift/${package_name} DESTINATION swift/Source/${package_name} )
file(COPY ${API_GEN_BASE_DIR}/cbridge/${package_name} DESTINATION swift/Source/${bridge_target}/include FILES_MATCHING PATTERN *.h)

file(COPY resources/empty.c DESTINATION swift/Source/${bridge_target})
file(COPY resources/Tests DESTINATION swift/)

set(swift_lib_target ${package_name}_swift_lib)

# Linux wants the linked library in the format -l:libTARGET.a while OSX wants -lTARGET and needs additional -lc++
# Generator expressions are escaped as these are only evaluated when used inside add_custom_target.
if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(SWIFT_LINK_ARGUMENTS -Xlinker -L\$<TARGET_FILE_DIR:${bridge_target}> -Xlinker -l:\$<TARGET_FILE_NAME:${bridge_target}> -Xlinker -L\$<TARGET_FILE_DIR:${package_name}> -Xlinker -l:\$<TARGET_FILE_NAME:${package_name}>)
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(SWIFT_LINK_ARGUMENTS -Xlinker -L\$<TARGET_FILE_DIR:${bridge_target}> -Xlinker -l${bridge_target} -Xlinker -L\$<TARGET_FILE_DIR:${package_name}> -Xlinker -l${package_name} -Xlinker -lc++)
endif()

add_custom_target(${swift_lib_target} ALL
    COMMAND swift build -C swift ${SWIFT_LINK_ARGUMENTS}
)
add_dependencies(${swift_lib_target} hello ${bridge_target})

add_test(NAME swift_test
    COMMAND swift test -C swift ${SWIFT_LINK_ARGUMENTS}
)
