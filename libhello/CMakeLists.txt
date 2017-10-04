# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.7)

# Here we create a new library 'hello' for which to generate target platform bindings.
# It aims to serve as a blueprint for real-world libraries such as libguidance or librouting.
project(hello)
set(CMAKE_CXX_STANDARD 11)

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(HELLO_SOURCES
    src/hello/HelloWorld.cpp
    src/hello/HelloWorldBuiltinTypes.cpp
    src/hello/HelloWorldFactory.cpp
    src/hello/HelloWorldInstances.cpp
    src/hello/HelloWorldPlainDataStructures.cpp
    src/test/PlainDataStructuresFromTypeCollection.cpp
    src/test/PlainDataStructures.cpp
    src/test/StaticBooleanMethods.cpp
    src/test/StaticByteArrayMethods.cpp
    src/test/StaticFloatDoubleMethods.cpp
    src/test/StaticIntMethods.cpp
    src/test/StaticStringMethods.cpp
    src/hello/HelloWorldStaticLogger.cpp
    src/hello/HelloWorldProfileManager.cpp
    src/hello/HelloWorldProfileManagerFactory.cpp)

set(HELLO_HEADERS
    src/hello/HelloWorldAttributesComplexImpl.h
    src/hello/HelloWorldAttributesImpl.h
    src/hello/HelloWorldInstances.h
    src/hello/HelloWorldListeners.h
    src/hello/HelloWorldProfileManager.h)

file(GLOB_RECURSE HELLO_FRANCA_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/fidl/*.fidl
    ${CMAKE_CURRENT_SOURCE_DIR}/fidl/*.fdepl)


# --- BEGIN TODO SECTION ---

#TODO: Remove this workaround once iOS supports Typedefs (APIGEN-783)
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp OR HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/test/StaticTypedef.cpp
        src/hello/HelloWorldTypedefs.cpp)
endif()

#TODO: Remove this workaround once iOS supports attributes (APIGEN-504)
if (HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp OR HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/hello/HelloWorldAttributesImpl.cpp
        src/hello/HelloWorldListeners.cpp)
endif()

#TODO: Remove this workaround once Android and iOS support complex types:
#      arrays: (APIGEN-767, APIGEN-766)
#      maps: (APIGEN-739, APIGEN-730)
#      unions: (APIGEN-776, APIGEN-775)
if (HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/hello/HelloWorldArrays.cpp
        src/hello/HelloWorldMaps.cpp
        src/hello/HelloWorldUnions.cpp)
endif()

#TODO: Remove this workaround once Android supports enum type (APIGEN-756)
if (NOT HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/hello/HelloWorldEnums.cpp
        src/test/Enums.cpp)
endif()

#TODO: the 'if' and the content of the 'else' block should be removed when all fidl files pass the build (APIGEN-357, APIGEN-460, APIGEN-462)
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    set(HELLO_FRANCA_DIR ${CMAKE_CURRENT_SOURCE_DIR}/fidl/)
else()
    #TODO: These excludes can be removed once iOS support Typedefs (APIGEN-783)
    if (NOT HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/StaticTypedef.fidl)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/StaticTypedef.fdepl)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldTypedefs.fidl)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldTypedefs.fdepl)
        #TODO: These excludes can be removed once ios platforms support listeners (APIGEN-515,516)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldListeners.fidl)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldListeners.fdepl)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/CalculatorListener.fidl)
        #TODO: These excludes can be removed once iOS supports attributes (APIGEN-504, APIGEN-505)
        list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldAttributes.fidl)
    endif()

    #TODO: This exclude can be removed once Android supports enums (APIGEN-756):
    if (NOT HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
      list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldEnums.fidl)
      list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldEnums.fdepl)
      list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Enums.fidl)
      list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Enums.fdepl)
    endif()

    #TODO: These excludes can be removed once Android and iOS support complex types:
    #      arrays: (APIGEN-767, APIGEN-766)
    #      attributes: (APIGEN-509, APIGEN-508)
    #      maps: (APIGEN-739, APIGEN-730)
    #      unions: (APIGEN-776, APIGEN-775)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldArrays.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldArrays.fdepl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldAttributesComplex.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldMaps.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldMaps.fdepl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldUnions.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldUnions.fdepl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Arrays.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Arrays.fdepl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Maps.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Maps.fdepl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Unions.fidl)
    list(REMOVE_ITEM HELLO_FRANCA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/Unions.fdepl)

    file(COPY ${HELLO_FRANCA_SOURCES} DESTINATION fidl-supported-features-only)

    set(HELLO_FRANCA_DIR ${CMAKE_CURRENT_BINARY_DIR}/fidl-supported-features-only/)
endif()

# --- END TODO SECTION ---


add_library(hello ${HELLO_SOURCES} ${HELLO_HEADERS} ${HELLO_FRANCA_SOURCES})
source_group("Franca files" FILES ${HELLO_FRANCA_SOURCES})
set_target_properties(hello PROPERTIES
        POSITION_INDEPENDENT_CODE ON
        SOVERSION ${HELLO_VERSION_MAJOR}
        VERSION ${HELLO_VERSION})

include(apigen/Apigen)
apigen_transpile(TARGET hello
        FRANCA_SOURCES ${HELLO_FRANCA_DIR}
        GENERATOR ${HELLO_APIGEN_TRANSPILER_GENERATOR}
        VERSION ${HELLO_APIGEN_TRANSPILER_VERSION})
apigen_target_include_directories(hello)
apigen_target_sources(hello)


# Target platform specific rules to follow...
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    # Only install the shared library for C++ customers, others don't care...
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION hello)
elseif(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)

    # Android customers want an Android Archive and it's pre-requirements...
    apigen_java_compile(hello)
    apigen_java_jar(hello)
    apigen_android_archive(hello)
elseif(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
    # Swift customers want a module...
    apigen_swift_build(hello TESTS ${HELLO_SWIFT_TESTS})

    #TODO: Investigate ways to separate debug host-builds (no cross toolchain)
    # for testing from debug/release cross-builds for iOS targets.
    #apigen_swift_test(hello test/folder)
    #apigen_ios_framework(hello)
endif()
