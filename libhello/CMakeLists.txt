# Copyright (c) 2017 HERE Europe B.V.
#
# All rights reserved.  This software, including documentation, is protected
# by copyright controlled by HERE.  All rights are reserved.  Copying,
# including reproducing, storing, adapting or translating, any or all of
# this material requires the prior written consent of HERE.  This
# material also contains confidential information which may not be
# disclosed to others without the prior written consent of HERE.

cmake_minimum_required(VERSION 3.6)

# Here we create a new library 'hello' for which to generate target platform bindings.
# It aims to serve as a blueprint for real-world libraries such as libguidance or librouting.
project(hello)
set(CMAKE_CXX_STANDARD 11)

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(HELLO_SOURCES)
set(HELLO_FRANCA_SOURCES)

function(feature feature_name)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs GENERATORS SOURCES)
    cmake_parse_arguments(feature
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(sources)
    set(franca_sources)

    foreach(generator ${feature_GENERATORS} ${feature_UNPARSED_ARGUMENTS})
        if (HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL ${generator})
            message("Enabling feature ${feature_name} for ${generator}")
            foreach(source ${feature_SOURCES})
                get_filename_component(extension "${source}" EXT)
                if (extension MATCHES "cpp|h")
                    list(APPEND sources "${source}")
                elseif (extension MATCHES "fidl|fdepl")
                    list(APPEND franca_sources "${source}")
                else ()
                    message(SEND_ERROR "Unrecognized file format \"${extension}\" in \"${source}\"")
                endif ()
            endforeach()
        endif()
    endforeach()

    set(HELLO_SOURCES "${HELLO_SOURCES};${sources}" PARENT_SCOPE)
    set(HELLO_FRANCA_SOURCES "${HELLO_FRANCA_SOURCES};${franca_sources}" PARENT_SCOPE)
endfunction()

feature(Strings cpp android swift SOURCES
    src/hello/HelloWorld.cpp
    src/test/StaticStringMethods.cpp

    fidl/hello/HelloWorld.fdepl
    fidl/hello/HelloWorld.fidl
)

feature(MethodOverloading cpp android swift SOURCES
    src/test/MethodOverloads.cpp

    fidl/test/MethodOverloads.fdepl
    fidl/test/MethodOverloads.fidl
)

feature(BuiltinTypes cpp android swift SOURCES
    src/hello/HelloWorldBuiltinTypes.cpp
    src/test/StaticBooleanMethods.cpp
    src/test/StaticByteArrayMethods.cpp
    src/test/StaticFloatDoubleMethods.cpp
    src/test/StaticIntMethods.cpp
    src/test/StaticTypedef.cpp

    fidl/hello/HelloWorldBuiltinTypes.fdepl
    fidl/hello/HelloWorldBuiltinTypes.fidl
    fidl/test/StaticBooleanMethods.fdepl
    fidl/test/StaticBooleanMethods.fidl
    fidl/test/StaticByteArrayMethods.fdepl
    fidl/test/StaticByteArrayMethods.fidl
    fidl/test/StaticFloatDoubleMethods.fdepl
    fidl/test/StaticFloatDoubleMethods.fidl
    fidl/test/StaticIntMethods.fdepl
    fidl/test/StaticIntMethods.fidl
    fidl/test/StaticStringMethods.fdepl
    fidl/test/StaticStringMethods.fidl
)

feature(Instances cpp android swift SOURCES
    src/hello/HelloWorldInstances.h
    src/hello/HelloWorldProfileManager.h
    src/hello/HelloWorldFactory.cpp
    src/hello/HelloWorldInstances.cpp
    src/hello/HelloWorldStaticLogger.cpp
    src/hello/HelloWorldProfileManager.cpp
    src/hello/HelloWorldProfileManagerFactory.cpp
    src/test/Instances.h
    src/test/Instances.cpp
    src/test/Interfaces.h
    src/test/Interfaces.cpp
    src/test/InstancesFactory.cpp

    fidl/hello/HelloWorldInstances.fidl
    fidl/hello/HelloWorldProfileManager.fidl
    fidl/hello/HelloWorldProfileManagerFactory.fdepl
    fidl/hello/HelloWorldFactory.fdepl
    fidl/hello/HelloWorldFactory.fidl
    fidl/hello/HelloWorldProfileManagerFactory.fidl
    fidl/hello/HelloWorldStaticLogger.fdepl
    fidl/hello/HelloWorldStaticLogger.fidl
    fidl/test/Instances.fidl
    fidl/test/Interfaces.fidl
    fidl/test/Interfaces.fdepl
    fidl/test/InstancesFactory.fdepl
    fidl/test/InstancesFactory.fidl
)

feature(InstanceInStruct cpp android swift SOURCES
    src/test/InstanceInStruct.cpp

    fidl/test/StructWithInstance.fdepl
    fidl/test/StructWithInstance.fidl
)

feature(Structs cpp android swift SOURCES
    src/hello/HelloWorldPlainDataStructures.cpp
    src/test/PlainDataStructuresFromTypeCollection.cpp
    src/test/PlainDataStructures.cpp

    fidl/hello/HelloWorldPlainDataStructures.fdepl
    fidl/hello/HelloWorldPlainDataStructures.fidl
    fidl/test/PlainDataStructures.fdepl
    fidl/test/PlainDataStructures.fidl
    fidl/test/PlainDataStructuresFromTypeCollection.fdepl
    fidl/test/PlainDataStructuresFromTypeCollection.fidl
    fidl/test/TypeCollection.fidl
)

feature(TypeDefs cpp android swift SOURCES
    src/hello/HelloWorldTypedefs.cpp

    fidl/hello/HelloWorldTypedefs.fdepl
    fidl/hello/HelloWorldTypedefs.fidl
    fidl/test/StaticTypedef.fdepl
    fidl/test/StaticTypedef.fidl
)

feature(Enums cpp android swift SOURCES
    src/hello/HelloWorldEnums.cpp
    src/test/Enums.cpp
    src/test/EnumsTypeCollection.cpp

    fidl/hello/HelloWorldEnums.fdepl
    fidl/hello/HelloWorldEnums.fidl
    fidl/test/Enums.fdepl
    fidl/test/Enums.fidl
    fidl/test/EnumsTypeCollection.fdepl
    fidl/test/EnumsTypeCollection.fidl
)

#TODO: enable for swift (APIGEN-730)
feature(Maps cpp android SOURCES
    src/hello/HelloWorldMaps.cpp
    src/test/Maps.cpp

    fidl/hello/HelloWorldMaps.fdepl
    fidl/hello/HelloWorldMaps.fidl
    fidl/test/Maps.fdepl
    fidl/test/Maps.fidl
)

#TODO: enable for android and swift (APIGEN-776, APIGEN-775)
feature(Unions cpp SOURCES
    src/hello/HelloWorldUnions.cpp

    fidl/hello/HelloWorldUnions.fdepl
    fidl/hello/HelloWorldUnions.fidl
    fidl/test/Unions.fdepl
    fidl/test/Unions.fidl
)

feature(Attributes cpp android swift SOURCES
    src/hello/HelloWorldAttributesImpl.h
    src/hello/HelloWorldAttributesImpl.cpp
    src/test/AttributesInterfaceImpl.h
    src/test/AttributesInterfaceImpl.cpp
    src/test/AttributesInterfaceFactory.cpp

    fidl/hello/HelloWorldAttributes.fidl
    fidl/test/AttributesInterface.fidl
    fidl/test/AttributesInterface.fdepl
    fidl/test/AttributesInterfaceFactory.fidl
    fidl/test/AttributesInterfaceFactory.fdepl
)

#TODO: enable for android and swift (APIGEN-509, APIGEN-508)
feature(ComplexAttributes cpp SOURCES
    src/hello/HelloWorldAttributesComplexImpl.h
    src/hello/HelloWorldAttributesComplexImpl.cpp

    fidl/hello/HelloWorldAttributesComplex.fidl
)

#TODO: enable for swift (APIGEN-515, APIGEN-516)
feature(Listeners cpp android swift SOURCES
    src/hello/HelloWorldListeners.h
    src/hello/HelloWorldListeners.cpp
    src/hello/HelloWorldCalculatorListenerFactory.cpp

    fidl/hello/HelloWorldCalculatorListenerFactory.fdepl
    fidl/hello/HelloWorldCalculatorListenerFactory.fidl
    fidl/hello/CalculatorListener.fidl
    fidl/hello/CalculatorListener.fdepl
    fidl/hello/HelloWorldListeners.fdepl
    fidl/hello/HelloWorldListeners.fidl
)

#TODO: enable for swift (APIGEN-515, APIGEN-516)
feature(ComplexListeners cpp android SOURCES
    src/test/ComplexListener.cpp
    src/test/ComplexListener.h

    fidl/test/ComplexListeners.fdepl
    fidl/test/ComplexListeners.fidl
)

#This feature is not planned for Android
feature(ListenersWithReturnValues cpp swift SOURCES
    src/test/ListenersReturnValues.cpp
    src/test/ListenersReturnValues.h

    fidl/test/ListenersReturnValues.fdepl
    fidl/test/ListenersReturnValues.fidl
)

feature(Arrays cpp android swift SOURCES
    src/hello/HelloWorldArrays.cpp
    src/test/Arrays.cpp
    src/test/ArraysByteBuffer.cpp

    fidl/hello/HelloWorldArrays.fdepl
    fidl/hello/HelloWorldArrays.fidl
    fidl/test/Arrays.fdepl
    fidl/test/Arrays.fidl
    fidl/test/ArraysByteBuffer.fdepl
    fidl/test/ArraysByteBuffer.fidl
)

#TODO: enable for android (APIGEN-704)
feature(Errors cpp swift SOURCES
    src/hello/HelloWorldErrors.cpp
    src/test/Errors.cpp

    fidl/hello/HelloWorldErrors.fidl
    fidl/hello/HelloWorldErrors.fdepl
    fidl/test/Errors.fidl
    fidl/test/Errors.fdepl
    fidl/test/Errors2.fidl
)

#TODO: enable for android once JNI support for Errors is in (APIGEN-703)
feature(Unsupported cpp swift SOURCES
    fidl/hello/UnsupportedFeatures.fidl
)

#TODO: remove when Unions are done for Android (APIGEN-776) and Swift (APIGEN-775)
feature(UnsupportedUnions android swift SOURCES
    fidl/hello/UnsupportedUnions.fidl
)

add_library(hello ${HELLO_SOURCES} ${HELLO_FRANCA_SOURCES})
source_group("Franca files" FILES ${HELLO_FRANCA_SOURCES})
set_target_properties(hello PROPERTIES
        POSITION_INDEPENDENT_CODE ON
        SOVERSION ${HELLO_VERSION_MAJOR}
        VERSION ${HELLO_VERSION})

include(apigen/Transpiler)
apigen_transpile(TARGET hello
        FRANCA_SOURCES ${HELLO_FRANCA_SOURCES}
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
    include(apigen/Android)
    apigen_java_compile(hello)
    apigen_java_jar(hello)
    apigen_android_archive(hello)
elseif(HELLO_APIGEN_TRANSPILER_GENERATOR STREQUAL swift)
    # Swift customers want a module...
    include(apigen/iOS)
    set_target_properties(hello PROPERTIES APIGEN_SWIFT_TEST ${HELLO_SWIFT_TESTS})
    apigen_swift_configuration(hello)
    apigen_swift_build(hello)
    apigen_swift_package(hello)
    
    #TODO: Investigate ways to separate debug host-builds (no cross toolchain)
    # for testing from debug/release cross-builds for iOS targets.
    #apigen_swift_test(hello test/folder)
    #apigen_ios_framework(hello)
endif()
