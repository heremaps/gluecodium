# Copyright (C) 2016-2019 HERE Europe B.V.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# License-Filename: LICENSE

cmake_minimum_required(VERSION 3.6)

# Here we create a new library 'hello' for which to generate target platform bindings.
# It aims to serve as a blueprint for real-world libraries such as libguidance or librouting.
project(hello)

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

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
        if(HELLO_APIGEN_GENIUM_GENERATOR STREQUAL ${generator})
            message("Enabling feature ${feature_name} for ${generator}")
            foreach(source ${feature_SOURCES})
                get_filename_component(extension "${source}" EXT)
                if(extension MATCHES "cpp|h")
                    list(APPEND sources "${source}")
                elseif(extension MATCHES "fidl|fdepl")
                    list(APPEND franca_sources "${source}")
                else()
                    message(SEND_ERROR "Unrecognized file format \"${extension}\" in \"${source}\"")
                endif()
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

feature(Maps cpp android swift SOURCES
    src/hello/HelloWorldMaps.cpp
    src/test/Maps.cpp

    fidl/hello/HelloWorldMaps.fdepl
    fidl/hello/HelloWorldMaps.fidl
    fidl/test/Maps.fdepl
    fidl/test/Maps.fidl
)

feature(Attributes cpp android swift SOURCES
    src/hello/HelloWorldAttributesImpl.h
    src/hello/HelloWorldAttributesImpl.cpp
    src/test/AttributesInterfaceImpl.h
    src/test/AttributesInterfaceImpl.cpp
    src/test/AttributesInterfaceFactory.cpp
    src/test/AttributesImpl.h
    src/test/AttributesImpl.cpp

    fidl/hello/HelloWorldAttributes.fidl
    fidl/test/Attributes.fidl
    fidl/test/Attributes.fdepl
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

feature(Listeners cpp android swift SOURCES
    src/hello/HelloWorldListeners.h
    src/hello/HelloWorldListeners.cpp
    src/hello/HelloWorldCalculatorListenerFactory.cpp
    src/test/StringListeners.cpp
    src/test/ListenerRoundtrip.cpp
    src/test/ListenerWithMaps.cpp

    fidl/hello/HelloWorldCalculatorListenerFactory.fdepl
    fidl/hello/HelloWorldCalculatorListenerFactory.fidl
    fidl/hello/CalculatorListener.fidl
    fidl/hello/CalculatorListener.fdepl
    fidl/hello/HelloWorldListeners.fdepl
    fidl/hello/HelloWorldListeners.fidl
    fidl/test/StringListeners.fdepl
    fidl/test/StringListeners.fidl
    fidl/test/ListenerRoundtrip.fdepl
    fidl/test/ListenerRoundtrip.fidl
    fidl/test/ListenerWithMaps.fidl
    fidl/test/ListenerWithMaps.fdepl
)

feature(ComplexListeners cpp android swift SOURCES
    src/test/ComplexListener.cpp
    src/test/ComplexListener.h

    fidl/test/ComplexListeners.fdepl
    fidl/test/ComplexListeners.fidl
)

feature(ListenersWithReturnValues cpp android swift SOURCES
    src/test/ListenersReturnValues.cpp
    src/test/ListenersReturnValues.h
    src/test/ListenerWithAttributes.cpp
    src/test/ListenerWithAttributes.h

    fidl/test/ListenersReturnValues.fdepl
    fidl/test/ListenersReturnValues.fidl
    fidl/test/ListenerWithAttributes.fdepl
    fidl/test/ListenerWithAttributes.fidl
)

feature(ListenersWithErrorTypes cpp android swift SOURCES
    src/test/ListenerWithErrors.cpp
    src/test/ListenerWithErrors.h

    fidl/test/ListenerWithErrors.fdepl
    fidl/test/ListenerWithErrors.fidl
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

feature(Errors cpp android swift SOURCES
    src/hello/HelloWorldErrors.cpp
    src/test/Errors.cpp

    fidl/hello/HelloWorldErrors.fidl
    fidl/hello/HelloWorldErrors.fdepl
    fidl/test/Errors.fidl
    fidl/test/Errors.fdepl
    fidl/test/Errors2.fidl
)

feature(Defaults cpp android swift SOURCES
    src/hello/HelloWorldDefaults.cpp
    src/test/Defaults.cpp

    fidl/hello/HelloWorldDefaults.fidl
    fidl/hello/HelloWorldDefaults.fdepl
    fidl/test/Defaults.fidl
    fidl/test/Defaults.fdepl
)

feature(Inheritance cpp android swift SOURCES
    src/hello/HelloWorldInheritance.cpp
    src/test/ChildClassImpl.cpp
    src/test/ChildClassImpl.h
    src/test/GrandchildClassImpl.cpp
    src/test/GrandchildClassImpl.h
    src/test/Talker.cpp
    src/test/Teacher.cpp

    src/test/Inheritance.cpp

    fidl/hello/HelloWorldInheritance.fdepl
    fidl/hello/HelloWorldInheritance.fidl
    fidl/test/Inheritance.fdepl
    fidl/test/Inheritance.fidl
    fidl/test/ListenerInheritance.fdepl
    fidl/test/ListenerInheritance.fidl
    fidl/test/ListenerInheritanceArrays.fdepl
    fidl/test/ListenerInheritanceArrays.fidl
)

feature(Serialization android SOURCES
    fidl/hello/HelloWorldParcelable.fidl
    fidl/hello/HelloWorldParcelable.fdepl

    fidl/test/Serialization.fidl
    fidl/test/Serialization.fdepl
)

feature(CircularDependencies cpp android swift SOURCES
    fidl/test/Circular.fidl
)

feature(ExternalTypes cpp android swift SOURCES
    src/test/include/ExternalTypes.h
    src/test/src/ExternalTypes.cpp
    src/test/UseExternalTypes.cpp

    fidl/test/ExternalTypes.fidl
    fidl/test/ExternalTypes.fdepl
    fidl/test/UseExternalTypes.fidl
    fidl/test/UseExternalTypes.fdepl
)

feature(UnderscorePackage cpp android swift SOURCES
    src/test/UseUnderscorePackage.cpp

    fidl/test/UnderscorePackage.fidl
    fidl/test/UseUnderscorePackage.fidl
    fidl/test/UseUnderscorePackage.fdepl
)

feature(Constants cpp android swift SOURCES
    src/test/Constants.cpp

    fidl/test/Constants.fidl
    fidl/test/Constants.fdepl
)

feature(Equatable cpp android swift SOURCES
    src/test/EquatableImpl.cpp

    fidl/hello/HelloWorldEquatable.fidl
    fidl/hello/HelloWorldEquatable.fdepl
    fidl/test/Equatable.fidl
    fidl/test/Equatable.fdepl
)

feature(Nullable cpp android swift SOURCES
    src/test/NullableInstances.cpp
    src/test/NullableInterfaceImpl.cpp

    fidl/test/NullableInstances.fidl
    fidl/test/NullableInstances.fdepl
    fidl/test/NullableInterface.fidl
    fidl/test/NullableInterface.fdepl
)

feature(ListenersWithThreads cpp android SOURCES
    src/test/ListenersThreads.cpp

    fidl/test/ListenersThreads.fidl
    fidl/test/ListenersThreads.fdepl
)


if(APPLE)
    #This feature is intended for Swift only. It also does not compile outside of Apple platforms.
    feature(ObjcInterface swift SOURCES
        fidl/test/ObjcInterface.fidl
        fidl/test/ObjcInterface.fdepl
    )
endif()

add_library(hello ${HELLO_SOURCES} ${HELLO_FRANCA_SOURCES})
source_group("Franca files" FILES ${HELLO_FRANCA_SOURCES})
set_target_properties(hello PROPERTIES
        POSITION_INDEPENDENT_CODE ON
        SOVERSION ${HELLO_VERSION_MAJOR}
        VERSION ${HELLO_VERSION})
target_include_directories(hello PRIVATE "src/test/")
target_link_libraries(hello Threads::Threads)

include(genium/Genium)
apigen_generate(TARGET hello
        FRANCA_SOURCES ${HELLO_FRANCA_SOURCES}
        GENERATOR ${HELLO_APIGEN_GENIUM_GENERATOR}
        VERSION ${HELLO_APIGEN_GENIUM_VERSION}
        JAVA_PACKAGE com.here.android
        CPP_INTERNAL_NAMESPACE lorem_ipsum
        COPYRIGHT_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/../config/COPYRIGHT")
apigen_target_include_directories(hello)
apigen_target_sources(hello)


# Target platform specific rules to follow...
if(HELLO_APIGEN_GENIUM_GENERATOR STREQUAL cpp)
    # Only install the shared library for C++ users, others don't care...
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION hello)
elseif(HELLO_APIGEN_GENIUM_GENERATOR STREQUAL android)
    # Android users want an Android Archive and it's pre-requirements...
    include(genium/Android)
    if(NOT DEFINED ANDROID_NATIVE_API_LEVEL)
        set(ANDROID_NATIVE_API_LEVEL "28")
    endif()
    if(NOT DEFINED ANDROID_PLATFORM)
        set(ANDROID_PLATFORM "android-${ANDROID_NATIVE_API_LEVEL}")
    endif()
    apigen_java_compile(TARGET hello
        LOCAL_DEPENDENCIES "android"
        LOCAL_DEPENDENCIES_DIRS "$ENV{ANDROID_HOME}/platforms/${ANDROID_PLATFORM}"
        REMOTE_DEPENDENCIES "com.android.support:support-annotations:28.0.0")
    apigen_java_jar(hello)
    apigen_android_archive(TARGET hello)
elseif(HELLO_APIGEN_GENIUM_GENERATOR STREQUAL swift)
    # Swift users want a module...
    include(genium/Swift)
    if(HELLO_SWIFT_TESTS)
        set_target_properties(hello PROPERTIES APIGEN_SWIFT_TESTS_SHARED ${HELLO_SWIFT_TESTS})
    endif()

    apigen_swift_build(hello)
    apigen_swift_framework_info_plist(hello)
endif()
