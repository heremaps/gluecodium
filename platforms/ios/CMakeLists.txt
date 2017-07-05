# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(ios)

if(NOT HELLO_BUILD_IOS_APP)
    return()
endif()

function(prefix_arguments output prefix)
    list(REMOVE_AT ARGV 0 1)
    set(prefixed)
    foreach(arg IN LISTS ARGV)
        list(APPEND prefixed ${prefix} ${arg})
    endforeach()
    set(${output} ${prefixed} PARENT_SCOPE)
endfunction()

set(CMAKE_CXX_STANDARD 11)
set(package_name hello)
set(bridge_target c_${package_name})

get_target_property(API_GEN_BASE_DIR hello APIGEN_TRANSPILER_GENERATOR_OUTPUT_DIR)

set(SWIFT_LIBRARY ${package_name})
set(C_BRIDGE ${bridge_target})
set(C_BRIDGE_LIBRARY hello)
set(C_BRIDGE_HEADER_PATH ${API_GEN_BASE_DIR}/cbridge/${package_name})
configure_file(resources/Package.swift.in swift/Package.swift)
configure_file(resources/module.modulemap.in swift/Modules/module.modulemap)

#TODO generate into the right folder
file(COPY ${API_GEN_BASE_DIR}/swift/${package_name} DESTINATION swift/Source/${package_name} )
file(COPY resources/Tests DESTINATION swift/)
file(COPY resources/assemble-framework DESTINATION swift/)

set(swift_lib_target ${package_name}_swift_lib)

set(SWIFT_ARGUMENTS
    -IModules
    -import-underlying-module
    -L\$<TARGET_FILE_DIR:hello>
    -lhello
)
# OSX needs additional -lc++
if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    list(APPEND SWIFT_ARGUMENTS -lc++)
endif()

prefix_arguments(BUILD_ARGUMENTS "-Xswiftc" ${SWIFT_ARGUMENTS})
prefix_arguments(EMIT_ARGUMENTS "-Xswiftc" -emit-module -emit-library -emit-objc-header)

add_custom_target(${swift_lib_target} ALL
    COMMAND swift test ${BUILD_ARGUMENTS}
    COMMAND swift build ${BUILD_ARGUMENTS} ${EMIT_ARGUMENTS}
    COMMAND ./assemble-framework ${package_name}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/swift
)
add_dependencies(${swift_lib_target} hello)
