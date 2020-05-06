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

if(APPLE)
    enable_language(Swift)
endif()

set(HELLO_VERSION_MAJOR 0)
set(HELLO_VERSION_MINOR 0)
set(HELLO_VERSION_PATCH 1)
set(HELLO_VERSION ${HELLO_VERSION_MAJOR}.${HELLO_VERSION_MINOR}.${HELLO_VERSION_PATCH})

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

set(HELLO_SOURCES)
set(HELLO_LIME_SOURCES)

function(feature feature_name)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs GENERATORS SOURCES)
    cmake_parse_arguments(feature
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(sources)
    set(lime_sources)

    foreach(generator ${feature_GENERATORS} ${feature_UNPARSED_ARGUMENTS})
        if(HELLO_APIGEN_GLUECODIUM_GENERATOR STREQUAL ${generator})
            message("Enabling feature ${feature_name} for ${generator}")
            foreach(source ${feature_SOURCES})
                get_filename_component(extension "${source}" EXT)
                if(extension MATCHES "cpp|h")
                    list(APPEND sources "${source}")
                elseif(extension MATCHES "lime")
                    list(APPEND lime_sources "${source}")
                else()
                    message(SEND_ERROR "Unrecognized file format \"${extension}\" in \"${source}\"")
                endif()
            endforeach()
        endif()
    endforeach()

    set(HELLO_SOURCES "${HELLO_SOURCES};${sources}" PARENT_SCOPE)
    set(HELLO_LIME_SOURCES "${HELLO_LIME_SOURCES};${lime_sources}" PARENT_SCOPE)
endfunction()

feature(Strings cpp android swift dart SOURCES
    src/hello/HelloWorld.cpp
    src/test/StaticStringMethods.cpp
    src/test/StringsWithCstring.cpp

    lime/hello/HelloWorld.lime
    lime/test/StaticStringMethods.lime
    lime/test/StringsWithCstring.lime
)

feature(MethodOverloading cpp android swift dart SOURCES
    src/test/MethodOverloads.cpp

    lime/test/MethodOverloads.lime
)

feature(Blob cpp android swift dart SOURCES
    src/hello/HelloWorldBuiltinTypes.cpp
    src/test/ArraysByteBuffer.cpp
    src/test/StaticByteArrayMethods.cpp

    lime/hello/HelloWorldBuiltinTypes.lime
    lime/test/ArraysByteBuffer.lime
    lime/test/StaticByteArrayMethods.lime
)

feature(BuiltinTypes cpp android swift dart SOURCES
    src/test/StaticBooleanMethods.cpp
    src/test/StaticFloatDoubleMethods.cpp
    src/test/StaticIntMethods.cpp

    lime/test/StaticBooleanMethods.lime
    lime/test/StaticFloatDoubleMethods.lime
    lime/test/StaticIntMethods.lime
)

feature(Classes cpp android swift dart SOURCES
    src/hello/HelloWorldInstances.h
    src/hello/HelloWorldProfileManager.h
    src/hello/HelloWorldFactory.cpp
    src/hello/HelloWorldInstances.cpp
    src/hello/HelloWorldStaticLogger.cpp
    src/hello/HelloWorldProfileManager.cpp
    src/hello/HelloWorldProfileManagerFactory.cpp
    src/test/Instances.h
    src/test/Instances.cpp
    src/test/InstancesFactory.cpp

    lime/hello/HelloWorldInstances.lime
    lime/hello/HelloWorldProfileManager.lime
    lime/hello/HelloWorldProfileManagerFactory.lime
    lime/hello/HelloWorldFactory.lime
    lime/hello/HelloWorldStaticLogger.lime
    lime/test/Instances.lime
)

feature(Interfaces cpp android swift dart SOURCES
    src/test/Interfaces.h
    src/test/Interfaces.cpp
    src/test/InterfacesFactory.cpp

    lime/test/Interfaces.lime
)

feature(InstanceInStruct cpp android swift dart SOURCES
    src/test/InstanceInStruct.cpp

    lime/test/StructWithInstance.lime
)

feature(Structs cpp android swift dart SOURCES
    src/hello/HelloWorldPlainDataStructures.cpp
    src/test/PlainDataStructures.cpp

    lime/hello/HelloWorldPlainDataStructures.lime
    lime/test/PlainDataStructures.lime
)

feature(StructsInTypes cpp android swift dart SOURCES
    src/test/PlainDataStructuresFromTypeCollection.cpp

    lime/test/PlainDataStructuresFromTypeCollection.lime
    lime/test/TypeCollection.lime
)

feature(StructsImmutable cpp android swift dart SOURCES
    src/test/PlainDataStructuresImmutable.cpp

    lime/test/PlainDataStructuresImmutable.lime
)

feature(TypeDefs cpp android swift dart SOURCES
    src/hello/HelloWorldTypedefs.cpp
    src/test/StaticTypedef.cpp

    lime/hello/HelloWorldTypedefs.lime
    lime/test/StaticTypedef.lime
)

feature(Enums cpp android swift dart SOURCES
    src/hello/HelloWorldEnums.cpp
    src/test/Enums.cpp
    src/test/EnumsTypeCollection.cpp

    lime/hello/HelloWorldEnums.lime
    lime/test/Enums.lime
    lime/test/EnumsTypeCollection.lime
)

feature(Properties cpp android swift dart SOURCES
    src/hello/HelloWorldAttributesImpl.h
    src/hello/HelloWorldAttributesImpl.cpp
    src/test/AttributesInterfaceImpl.h
    src/test/AttributesInterfaceImpl.cpp
    src/test/AttributesInterfaceFactory.cpp
    src/test/AttributesImpl.h
    src/test/AttributesImpl.cpp
    src/test/CachedPropertiesImpl.h
    src/test/CachedPropertiesImpl.cpp

    lime/hello/HelloWorldAttributes.lime
    lime/test/Attributes.lime
    lime/test/AttributesInterface.lime
    lime/test/AttributesInterfaceFactory.lime
)

# This feature is intended for Android only.
feature(JavaBuilder android SOURCES
    lime/test/JavaBuilder.lime
)

feature(Listeners cpp android swift dart SOURCES
    src/hello/HelloWorldListeners.h
    src/hello/HelloWorldListeners.cpp
    src/hello/HelloWorldCalculatorListenerFactory.cpp
    src/test/StringListeners.cpp
    src/test/ListenerRoundtrip.cpp
    src/test/ListenerWithMaps.cpp

    lime/hello/HelloWorldCalculatorListenerFactory.lime
    lime/hello/CalculatorListener.lime
    lime/hello/HelloWorldListeners.lime
    lime/test/StringListeners.lime
    lime/test/ListenerRoundtrip.lime
    lime/test/ListenerWithMaps.lime
    lime/test/ListenerNameClash.lime
)

feature(ComplexListeners cpp android swift dart SOURCES
    src/test/ComplexListener.cpp
    src/test/ComplexListener.h

    lime/test/ComplexListeners.lime
)

feature(ListenersWithReturnValues cpp android swift dart SOURCES
    src/test/ListenersReturnValues.cpp
    src/test/ListenersReturnValues.h
    src/test/ListenerWithAttributes.cpp
    src/test/ListenerWithAttributes.h

    lime/test/ListenersReturnValues.lime
    lime/test/ListenerWithAttributes.lime
    lime/test/ListenerInternal.lime
)

feature(GenericTypes cpp android swift dart SOURCES
    src/hello/HelloWorldArrays.cpp
    src/hello/HelloWorldMaps.cpp
    src/test/Arrays.cpp
    src/test/SetType.cpp
    src/test/Maps.cpp
    src/test/NestedGenericTypes.cpp

    lime/hello/HelloWorldArrays.lime
    lime/hello/HelloWorldMaps.lime
    lime/test/Arrays.lime
    lime/test/SetType.lime
    lime/test/Maps.lime
    lime/test/NestedGenericTypes.lime
)

feature(Errors cpp android swift dart SOURCES
    src/hello/HelloWorldErrors.cpp
    src/test/Errors.cpp
    src/test/ErrorsInInterface.cpp
    src/test/ErrorsInInterface.h

    lime/hello/HelloWorldErrors.lime
    lime/test/Errors.lime
    lime/test/Errors2.lime
    lime/test/ErrorsInInterface.lime
)

feature(Defaults cpp android swift dart SOURCES
    src/hello/HelloWorldDefaults.cpp
    src/test/Defaults.cpp

    lime/hello/HelloWorldDefaults.lime
    lime/test/Defaults.lime
)

feature(Inheritance cpp android swift dart SOURCES
    src/hello/HelloWorldInheritance.cpp
    src/test/ChildClassImpl.cpp
    src/test/ChildClassImpl.h
    src/test/GrandchildClassImpl.cpp
    src/test/GrandchildClassImpl.h
    src/test/Talker.cpp
    src/test/Teacher.cpp
    src/test/Inheritance.cpp

    lime/hello/HelloWorldInheritance.lime
    lime/test/Inheritance.lime
    lime/test/ListenerInheritance.lime
    lime/test/ListenerInheritanceArrays.lime
)

feature(Serialization android swift SOURCES
    lime/hello/HelloWorldParcelable.lime
    lime/test/Serialization.lime
)

feature(CircularDependencies cpp android swift dart SOURCES
    lime/test/Circular.lime
)

feature(ExternalTypes cpp android swift dart SOURCES
    src/test/include/ExternalTypes.h
    src/test/src/ExternalTypes.cpp
    src/test/UseExternalTypes.cpp

    lime/test/ExternalTypes.lime
    lime/test/UseExternalTypes.lime
)

feature(UnderscorePackage cpp android swift dart SOURCES
    src/test/UseUnderscorePackage.cpp

    lime/test/UnderscorePackage.lime
    lime/test/UseUnderscorePackage.lime
)

feature(Constants cpp android swift dart SOURCES
    src/test/Constants.cpp

    lime/test/Constants.lime
)

feature(Equatable cpp android swift dart SOURCES
    src/test/EquatableImpl.cpp
    src/test/RefEquality.cpp
    src/test/SimpleEquality.cpp

    lime/hello/HelloWorldEquatable.lime
    lime/test/Equatable.lime
    lime/test/RefEquality.lime
    lime/test/SimpleEquality.lime
)

feature(Nullable cpp android swift dart SOURCES
    src/test/NullableInstances.cpp
    src/test/NullableInterfaceImpl.cpp

    lime/test/NullableInstances.lime
    lime/test/NullableInterface.lime
)

feature(CallbacksWithThreads cpp android dart SOURCES
    src/test/ListenersThreads.cpp

    lime/test/ListenersThreads.lime
)

feature(Dates cpp android swift dart SOURCES
    src/test/Dates.cpp

    lime/test/Dates.lime
)

feature(StructsWithCompanion cpp android swift dart SOURCES
    src/test/StructsWithMethods.cpp
    src/test/StructsWithConstants.cpp

    lime/test/StructsWithMethods.lime
    lime/test/StructsWithConstants.lime
)

feature(Comments cpp android swift dart SOURCES
    src/test/Comments.cpp

    lime/test/Comments.lime
    lime/test/CommentsInterface.lime
)

feature(PlatformNames cpp android swift dart SOURCES
    src/test/PlatformNames.cpp

    lime/test/PlatformNames.lime
)

feature(EscapedNames cpp android swift dart SOURCES
    lime/test/KeywordNames.lime
)

feature(Nesting cpp android swift dart SOURCES
    src/test/TopLevelTypes.cpp
    src/test/NestedContainers.cpp

    lime/test/TopLevelTypes.lime
    lime/test/NestedContainers.lime
)

feature(Lambdas cpp android swift dart SOURCES
    lime/test/Lambdas.lime

    src/test/Lambdas.cpp
)

feature(Visibility dart SOURCES
    lime/test/Visibility.lime

    src/test/Visibility.cpp
)

# Not supported for C++
feature(SkipAttribute android swift dart SOURCES
    lime/test/Skip.lime

    src/test/Skip.cpp
)

# This feature is intended for Swift only.
feature(Extensions swift SOURCES
    lime/test/Extensions.lime
)

if(APPLE)
    # This feature is intended for Swift only. It also does not compile outside of Apple platforms.
    feature(ObjcInterface swift SOURCES
        lime/test/ObjcInterface.lime
    )
endif()

add_library(hello ${HELLO_SOURCES} ${HELLO_LIME_SOURCES})

source_group("LimeIDL files" FILES ${HELLO_LIME_SOURCES})
set_target_properties(hello PROPERTIES
        POSITION_INDEPENDENT_CODE ON
        SOVERSION ${HELLO_VERSION_MAJOR}
        VERSION ${HELLO_VERSION})
target_include_directories(hello PRIVATE "src/test/")
target_link_libraries(hello PRIVATE Threads::Threads)

include(gluecodium/Gluecodium)
apigen_generate(TARGET hello
        LIME_SOURCES ${HELLO_LIME_SOURCES}
        GENERATOR ${HELLO_APIGEN_GLUECODIUM_GENERATOR}
        VERSION ${HELLO_APIGEN_GLUECODIUM_VERSION}
        JAVA_PACKAGE com.here.android
        JAVA_INTERNAL_PACKAGE lorem.ipsum
        JAVA_NONNULL_ANNOTATION android.support.annotation.NonNull
        JAVA_NULLABLE_ANNOTATION android.support.annotation.Nullable
        CPP_INTERNAL_NAMESPACE lorem_ipsum.test
        INTERNAL_PREFIX "libhello_"
        DART_LIBRARY_NAME "hello"
        DART_NAMERULES "${CMAKE_CURRENT_SOURCE_DIR}/../config/dart.properties"
        COPYRIGHT_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/../config/COPYRIGHT"
        VERBOSE)
apigen_target_include_directories(hello)
apigen_target_sources(hello)


# Target platform specific rules to follow...
if(HELLO_APIGEN_GLUECODIUM_GENERATOR STREQUAL cpp)
    # Install the shared library for C++
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION hello)
elseif(HELLO_APIGEN_GLUECODIUM_GENERATOR STREQUAL android)
    # Android users want an Android Archive and it's pre-requirements...

    # Optional step:
    # Use custom JNI_OnLoad method instead of generated one, so redefine generated one
    # Add this always public in case multiple modules share the same generated common code
    target_compile_definitions(hello PUBLIC GLUECODIUM_JNI_ONLOAD=JNI_OnLoad_hello)
    # And then add our own
    target_sources(hello PRIVATE src/android/CustomJniOnLoad.cpp)

    include(gluecodium/Android)
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
elseif(HELLO_APIGEN_GLUECODIUM_GENERATOR STREQUAL swift)
    # Swift users want a module...
    include(gluecodium/Swift)

    apigen_swift_build(hello)
    apigen_swift_framework_info_plist(hello)
    if(HELLO_SWIFT_TESTS)
        file(GLOB_RECURSE SWIFT_TEST_SOURCES CONFIGURE_DEPENDS ${HELLO_SWIFT_TESTS}/*.swift)
        apigen_swift_test(hello SOURCES ${SWIFT_TEST_SOURCES})
    endif()
elseif(HELLO_APIGEN_GLUECODIUM_GENERATOR STREQUAL dart)
    # Install the shared library for Dart
    install(TARGETS hello EXPORT helloTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION hello)

    if(HELLO_BUILD_DART_WITH_ASAN)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fsanitize=leak")
        set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fsanitize=address -fsanitize=leak")
    endif()
endif()
