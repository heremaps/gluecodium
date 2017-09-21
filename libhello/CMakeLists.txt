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
    src/hello/HelloWorldPlainDataStructures.cpp
    src/test/PlainDataStructuresFromTypeCollection.cpp
    src/test/PlainDataStructures.cpp
    src/test/StaticBooleanMethods.cpp
    src/test/StaticByteArrayMethods.cpp
    src/test/StaticFloatDoubleMethods.cpp
    src/test/StaticIntMethods.cpp
    src/test/StaticStringMethods.cpp
    src/hello/HelloWorldStaticLogger.cpp)

#TODO: Remove this workaround once iOS supports Typedefs (APIGEN-282) and Instances (APIGEN-195)
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp OR HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/test/StaticTypedef.cpp
        src/hello/HelloWorldProfileManager.cpp
        src/hello/HelloWorldProfileManagerFactory.cpp)
endif()

#TODO: Remove this workaround once Android and iOS supports complex types (APIGEN-280, APIGEN-281)
if (HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/hello/HelloWorldComplexTypes.cpp)

endif()

#TODO: Remove this workaround once Android and iOS supports instances (APIGEN-195, APIGEN-593)
if (HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    set(HELLO_SOURCES
        ${HELLO_SOURCES}
        src/hello/HelloWorldFactory.cpp
        src/hello/HelloWorldInstances.cpp
        src/hello/HelloWorldListeners.cpp)
endif()

add_library(hello ${HELLO_SOURCES})
set_target_properties(hello PROPERTIES
    POSITION_INDEPENDENT_CODE ON
    SOVERSION ${HELLO_VERSION_MAJOR}
    VERSION ${HELLO_VERSION})

include(apigen/Apigen)

#TODO: the 'if' and the content of the 'else' block should be removed when all fidl files pass the build (APIGEN-357, APIGEN-460, APIGEN-462)
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    apigen_transpile(TARGET hello
        FRANCA_DIR ${CMAKE_CURRENT_SOURCE_DIR}/fidl/
        GENERATOR ${HELLO_APIGEN_TRANSPILER_GENERATOR}
        VERSION ${HELLO_APIGEN_TRANSPILER_VERSION})
else()
    file(GLOB_RECURSE HELLO_WORLD_FIDL_FILES
                      ${CMAKE_CURRENT_SOURCE_DIR}/fidl/*.fidl
                      ${CMAKE_CURRENT_SOURCE_DIR}/fidl/*.fdepl)
    set(FRANCA_FILES ${HELLO_WORLD_FIDL_FILES})

    #TODO: These excludes can be removed once iOS support Typedefs (APIGEN-282) and non-nested instances(APIGEN-196)
    if (NOT HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL android)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/StaticTypedef.fidl)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/test/StaticTypedef.fdepl)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldProfileManager.fidl)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldProfileManagerFactory.fidl)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldProfileManagerFactory.fdepl)
        #TODO: These excludes can be removed once ios platforms support listeners (APIGEN-515,516)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldListeners.fidl)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/CalculatorListener.fidl)
        #TODO: These excludes can be removed once iOs supports attributes (APIGEN-504, APIGEN-505)
        list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldAttributes.fidl)
    endif()

    #TODO: These excludes can be removed once both platforms support nested instances (APIGEN-205, APIGEN-196)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldInstances.fidl)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldFactory.fidl)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldFactory.fdepl)


    #TODO: These excludes can be removed once both platforms support complex types (APIGEN-280, APIGEN-281)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldComplexTypes.fidl)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldComplexTypes.fdepl)
    list(REMOVE_ITEM FRANCA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/fidl/hello/HelloWorldAttributesComplex.fidl)



    file(COPY ${FRANCA_FILES} DESTINATION fidl-supported-features-only)
    apigen_transpile(TARGET hello
        FRANCA_DIR ${CMAKE_CURRENT_BINARY_DIR}/fidl-supported-features-only/
        GENERATOR ${HELLO_APIGEN_TRANSPILER_GENERATOR}
        VERSION ${HELLO_APIGEN_TRANSPILER_VERSION})
endif()

apigen_target_include_directories(hello)
apigen_target_sources(hello)

# Target platform specific rules to follow...
if(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL cpp)
    # Only install the shared library for C++ customers, others don't care...
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION include)
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
