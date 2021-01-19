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

project(functional)

if(APPLE)
    enable_language(Swift)
endif()

set(FUNCTIONAL_VERSION_MAJOR 0)
set(FUNCTIONAL_VERSION_MINOR 0)
set(FUNCTIONAL_VERSION_PATCH 1)
set(FUNCTIONAL_VERSION ${FUNCTIONAL_VERSION_MAJOR}.${FUNCTIONAL_VERSION_MINOR}.${FUNCTIONAL_VERSION_PATCH})

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

set(FUNCTIONAL_SOURCES)
set(FUNCTIONAL_LIME_SOURCES)

function(feature feature_name)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs GENERATORS SOURCES)
    cmake_parse_arguments(feature
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(sources)
    set(lime_sources)

    foreach(generator ${feature_GENERATORS} ${feature_UNPARSED_ARGUMENTS})
        if(FUNCTIONAL_GLUECODIUM_GENERATOR STREQUAL ${generator})
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

    set(FUNCTIONAL_SOURCES "${FUNCTIONAL_SOURCES};${sources}" PARENT_SCOPE)
    set(FUNCTIONAL_LIME_SOURCES "${FUNCTIONAL_LIME_SOURCES};${lime_sources}" PARENT_SCOPE)
endfunction()

feature(Strings cpp android swift dart SOURCES
    input/src/cpp/StaticStringMethods.cpp
    input/src/cpp/StringsWithCstring.cpp
    input/src/cpp/CppRefReturnType.cpp

    input/lime/StaticStringMethods.lime
    input/lime/StringsWithCstring.lime
    input/lime/CppRefReturnType.lime
)

feature(MethodOverloading cpp android swift dart SOURCES
    input/src/cpp/MethodOverloads.cpp

    input/lime/MethodOverloads.lime
)

feature(Blob cpp android swift dart SOURCES
    input/src/cpp/ArraysByteBuffer.cpp
    input/src/cpp/StaticByteArrayMethods.cpp

    input/lime/ArraysByteBuffer.lime
    input/lime/StaticByteArrayMethods.lime
)

feature(BuiltinTypes cpp android swift dart SOURCES
    input/src/cpp/StaticBooleanMethods.cpp
    input/src/cpp/StaticFloatDoubleMethods.cpp
    input/src/cpp/StaticIntMethods.cpp

    input/lime/StaticBooleanMethods.lime
    input/lime/StaticFloatDoubleMethods.lime
    input/lime/StaticIntMethods.lime
)

feature(Classes cpp android swift dart SOURCES
    input/src/cpp/Instances.h
    input/src/cpp/Instances.cpp
    input/src/cpp/InstancesFactory.cpp

    input/lime/Instances.lime
)

feature(Interfaces cpp android swift dart SOURCES
    input/src/cpp/Interfaces.h
    input/src/cpp/Interfaces.cpp
    input/src/cpp/InterfacesFactory.cpp

    input/lime/Interfaces.lime
)

feature(InstanceInStruct cpp android swift dart SOURCES
    input/src/cpp/InstanceInStruct.cpp

    input/lime/StructWithInstance.lime
)

feature(Structs cpp android swift dart SOURCES
    input/src/cpp/PlainDataStructures.cpp

    input/lime/PlainDataStructures.lime
)

feature(StructsInTypes cpp android swift dart SOURCES
    input/src/cpp/PlainDataStructuresFromTypeCollection.cpp

    input/lime/PlainDataStructuresFromTypeCollection.lime
    input/lime/TypeCollection.lime
)

feature(StructsImmutable cpp android swift dart SOURCES
    input/src/cpp/PlainDataStructuresImmutable.cpp

    input/lime/PlainDataStructuresImmutable.lime
)

feature(TypeDefs cpp android swift dart SOURCES
    input/src/cpp/StaticTypedef.cpp

    input/lime/StaticTypedef.lime
)

feature(Enums cpp android swift dart SOURCES
    input/src/cpp/Enums.cpp
    input/src/cpp/EnumsTypeCollection.cpp

    input/lime/Enums.lime
    input/lime/EnumsTypeCollection.lime
)

feature(Properties cpp android swift dart SOURCES
    input/src/cpp/AttributesInterfaceImpl.h
    input/src/cpp/AttributesInterfaceImpl.cpp
    input/src/cpp/AttributesInterfaceFactory.cpp
    input/src/cpp/AttributesImpl.h
    input/src/cpp/AttributesImpl.cpp
    input/src/cpp/CachedPropertiesImpl.h
    input/src/cpp/CachedPropertiesImpl.cpp

    input/lime/Attributes.lime
    input/lime/AttributesInterface.lime
    input/lime/AttributesInterfaceFactory.lime
)

# This feature is intended for Android only.
feature(JavaBuilder android SOURCES
    input/lime/JavaBuilder.lime
)

feature(Listeners cpp android swift dart SOURCES
    input/src/cpp/StringListeners.cpp
    input/src/cpp/ListenerRoundtrip.cpp
    input/src/cpp/ListenerWithMaps.cpp
    input/src/cpp/MultiListener.cpp

    input/lime/StringListeners.lime
    input/lime/ListenerRoundtrip.lime
    input/lime/ListenerWithMaps.lime
    input/lime/ListenerNameClash.lime
    input/lime/MultiListener.lime
)

feature(ComplexListeners cpp android swift dart SOURCES
    input/src/cpp/ComplexListener.cpp
    input/src/cpp/ComplexListener.h

    input/lime/ComplexListeners.lime
)

feature(ListenersWithReturnValues cpp android swift dart SOURCES
    input/src/cpp/ListenersReturnValues.cpp
    input/src/cpp/ListenersReturnValues.h
    input/src/cpp/ListenerWithAttributes.cpp
    input/src/cpp/ListenerWithAttributes.h

    input/lime/ListenersReturnValues.lime
    input/lime/ListenerWithAttributes.lime
    input/lime/ListenerInternal.lime
)

# This is a Swift-only feature
feature(WeakListeners swift SOURCES
    input/src/cpp/WeakListeners.cpp

    input/lime/WeakListeners.lime
)

feature(GenericTypes cpp android swift dart SOURCES
    input/src/cpp/Arrays.cpp
    input/src/cpp/SetType.cpp
    input/src/cpp/Maps.cpp
    input/src/cpp/NestedGenericTypes.cpp

    input/lime/Arrays.lime
    input/lime/SetType.lime
    input/lime/Maps.lime
    input/lime/NestedGenericTypes.lime
)

feature(Errors cpp android swift dart SOURCES
    input/src/cpp/Errors.cpp
    input/src/cpp/ErrorsInInterface.cpp
    input/src/cpp/ErrorsInInterface.h
    input/src/cpp/ErrorsWithNonTrivialType.cpp

    input/lime/Errors.lime
    input/lime/Errors2.lime
    input/lime/ErrorsInInterface.lime
    input/lime/ErrorsWithNonTrivialType.lime
)

feature(Defaults cpp android swift dart SOURCES
    input/src/cpp/Defaults.cpp

    input/lime/Defaults.lime
    input/lime/PositionalDefaults.lime
)

feature(Inheritance cpp android swift dart SOURCES
    input/src/cpp/ChildClassImpl.cpp
    input/src/cpp/ChildClassImpl.h
    input/src/cpp/GrandchildClassImpl.cpp
    input/src/cpp/GrandchildClassImpl.h
    input/src/cpp/Talker.cpp
    input/src/cpp/Teacher.cpp
    input/src/cpp/Inheritance.cpp
    input/src/cpp/CrossPackageInheritance.cpp

    input/lime/Inheritance.lime
    input/lime/ListenerInheritance.lime
    input/lime/ListenerInheritanceArrays.lime
    input/lime/CrossPackageInheritance.lime
    input/lime/InterfaceWithLambda.lime
)

feature(Serialization android swift SOURCES
    input/lime/Serialization.lime
)

feature(CircularDependencies cpp android swift dart SOURCES
    input/lime/Circular.lime
)

feature(ExternalTypes cpp android swift dart SOURCES
    input/src/cpp/include/ExternalTypes.h
    input/src/cpp/include/MyClass.h
    input/src/cpp/src/ExternalTypes.cpp
    input/src/cpp/UseExternalTypes.cpp
    input/src/cpp/UseMyClass.cpp

    input/lime/ExternalTypes.lime
    input/lime/ExternalClassAsInterface.lime
    input/lime/UseExternalTypes.lime
)

feature(JavaExternalTypes android SOURCES
    input/src/cpp/JavaExternalTypes.cpp

    input/lime/JavaExternalTypes.lime
)

feature(SwiftExternalTypes swift SOURCES
    input/src/cpp/SwiftExternalTypes.cpp

    input/lime/SwiftExternalTypes.lime
)

feature(DartExternalTypes dart SOURCES
    input/src/cpp/DartExternalTypes.cpp

    input/lime/DartExternalTypes.lime
)

feature(UnderscorePackage cpp android swift dart SOURCES
    input/src/cpp/UseUnderscorePackage.cpp

    input/lime/UnderscorePackage.lime
    input/lime/UseUnderscorePackage.lime
)

feature(Constants cpp android swift dart SOURCES
    input/src/cpp/Constants.cpp

    input/lime/Constants.lime
)

feature(Equatable cpp android swift dart SOURCES
    input/src/cpp/EquatableImpl.cpp
    input/src/cpp/RefEquality.cpp
    input/src/cpp/SimpleEquality.cpp

    input/lime/Equatable.lime
    input/lime/RefEquality.lime
    input/lime/SimpleEquality.lime
)

feature(Nullable cpp android swift dart SOURCES
    input/src/cpp/NullableInstances.cpp
    input/src/cpp/NullableInterfaceImpl.cpp

    input/lime/NullableInstances.lime
    input/lime/NullableInterface.lime
)

feature(CallbacksWithThreads cpp android dart SOURCES
    input/src/cpp/ListenersThreads.cpp

    input/lime/ListenersThreads.lime
)

feature(Dates cpp android swift dart SOURCES
    input/src/cpp/Dates.cpp

    input/lime/Dates.lime
)

feature(StructsWithCompanion cpp android swift dart SOURCES
    input/src/cpp/StructsWithMethods.cpp
    input/src/cpp/StructsWithConstants.cpp
    input/src/cpp/StructsWithMethodsDeclarationOrder.cpp

    input/lime/StructsWithMethods.lime
    input/lime/StructsWithConstants.lime
    input/lime/StructsWithMethodsDeclarationOrder.lime
)

feature(Comments cpp android swift dart SOURCES
    input/src/cpp/Comments.cpp

    input/lime/Comments.lime
    input/lime/CommentsInterface.lime
)

feature(PlatformNames cpp android swift dart SOURCES
    input/src/cpp/PlatformNames.cpp

    input/lime/PlatformNames.lime
)

feature(EscapedNames cpp android swift dart SOURCES
    input/lime/KeywordNames.lime
)

feature(Nesting cpp android swift dart SOURCES
    input/src/cpp/TopLevelTypes.cpp
    input/src/cpp/NestedContainers.cpp
    input/src/cpp/NestedClassWithProperty.cpp
    input/src/cpp/NestingInStruct.cpp

    input/lime/TopLevelTypes.lime
    input/lime/NestedContainers.lime
    input/lime/NestedClassWithProperty.lime
    input/lime/NestingInStruct.lime
)

feature(Lambdas cpp android swift dart SOURCES
    input/lime/Lambdas.lime

    input/src/cpp/Lambdas.cpp
)

feature(Visibility dart SOURCES
    input/lime/Visibility.lime

    input/src/cpp/Visibility.cpp
)

# Not supported for C++
feature(SkipAttribute android swift dart SOURCES
    input/lime/Skip.lime

    input/src/cpp/Skip.cpp
)

feature(SkipTags cpp SOURCES
    input/lime/SkipTags.lime

    input/src/cpp/SkipTags.cpp
)

# This feature is intended for Swift only.
feature(Extensions swift SOURCES
    input/lime/Extensions.lime
)

feature(CppConst cpp android swift dart SOURCES
    input/lime/CppConstMethods.lime

    input/src/cpp/CppConstMethods.cpp
)

feature(Locales cpp android swift dart SOURCES
    input/src/cpp/Locales.cpp

    input/lime/Locales.lime
)

if(APPLE)
    # This feature is intended for Swift only. It also does not compile outside of Apple platforms.
    feature(ObjcInterface swift SOURCES
        input/lime/ObjcInterface.lime
    )
endif()

add_library(functional ${FUNCTIONAL_SOURCES} ${FUNCTIONAL_LIME_SOURCES})

source_group("LimeIDL files" FILES ${FUNCTIONAL_LIME_SOURCES})
set_target_properties(functional PROPERTIES
        POSITION_INDEPENDENT_CODE ON
        SOVERSION ${FUNCTIONAL_VERSION_MAJOR}
        VERSION ${FUNCTIONAL_VERSION})
target_include_directories(functional PRIVATE "input/src/cpp/")
target_link_libraries(functional PRIVATE Threads::Threads)

include(gluecodium/Gluecodium)
apigen_generate(TARGET functional
        LIME_SOURCES ${FUNCTIONAL_LIME_SOURCES}
        GENERATOR ${FUNCTIONAL_GLUECODIUM_GENERATOR}
        VERSION ${FUNCTIONAL_GLUECODIUM_VERSION}
        JAVA_PACKAGE com.here.android
        JAVA_INTERNAL_PACKAGE lorem.ipsum
        JAVA_NONNULL_ANNOTATION android.support.annotation.NonNull
        JAVA_NULLABLE_ANNOTATION android.support.annotation.Nullable
        CPP_INTERNAL_NAMESPACE lorem_ipsum.test
        INTERNAL_PREFIX "libfunctional_"
        DART_LIBRARY_NAME "functional"
        DART_NAMERULES "${CMAKE_CURRENT_SOURCE_DIR}/../config/dart.properties"
        COPYRIGHT_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/../config/COPYRIGHT"
        TAGS "Lite"
        VERBOSE)
apigen_target_include_directories(functional)
apigen_target_sources(functional)


# Target platform specific rules to follow...
if(FUNCTIONAL_GLUECODIUM_GENERATOR STREQUAL cpp)
    # Install the shared library for C++
    install(TARGETS functional EXPORT functionalTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION functional)
elseif(FUNCTIONAL_GLUECODIUM_GENERATOR STREQUAL android)
    # Android users want an Android Archive and it's pre-requirements...

    # Optional step:
    # Use custom JNI_OnLoad method instead of generated one, so redefine generated one
    # Add this always public in case multiple modules share the same generated common code
    target_compile_definitions(functional PUBLIC GLUECODIUM_JNI_ONLOAD=JNI_OnLoad_functional)
    # And then add our own
    target_sources(functional PRIVATE input/src/android/CustomJniOnLoad.cpp)

    include(gluecodium/Android)
    if(NOT DEFINED ANDROID_NATIVE_API_LEVEL)
        set(ANDROID_NATIVE_API_LEVEL "28")
    endif()
    if(NOT DEFINED ANDROID_PLATFORM)
        set(ANDROID_PLATFORM "android-${ANDROID_NATIVE_API_LEVEL}")
    endif()
    apigen_java_compile(TARGET functional
        LOCAL_SOURCES_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/input/src/android"
        LOCAL_DEPENDENCIES "android"
        LOCAL_DEPENDENCIES_DIRS "$ENV{ANDROID_HOME}/platforms/${ANDROID_PLATFORM}"
        REMOTE_DEPENDENCIES "com.android.support:support-annotations:28.0.0")
    apigen_java_jar(functional)
    apigen_android_archive(TARGET functional)
elseif(FUNCTIONAL_GLUECODIUM_GENERATOR STREQUAL swift)
    # Swift users want a module...
    include(gluecodium/Swift)

    list(APPEND ADDITIONAL_SOURCES
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/swift/ColorConverter.swift"
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/swift/PseudoColor.swift"
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/swift/Season.swift"
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/swift/SeasonConverter.swift")

    apigen_swift_build(functional)
    apigen_swift_framework_info_plist(functional)
    file(GLOB_RECURSE SWIFT_TEST_SOURCES CONFIGURE_DEPENDS ${FUNCTIONAL_SWIFT_TESTS}/*.swift)
    apigen_swift_test(functional SOURCES ${SWIFT_TEST_SOURCES})
elseif(FUNCTIONAL_GLUECODIUM_GENERATOR STREQUAL dart)
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/dart/color_converter.dart"
        "${CMAKE_CURRENT_BINARY_DIR}/functional/dart/dart/lib/src/color_converter.dart"
        COPYONLY)
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/input/src/dart/season_converter.dart"
        "${CMAKE_CURRENT_BINARY_DIR}/functional/dart/dart/lib/src/season_converter.dart"
        COPYONLY)

    # Install the shared library for Dart
    install(TARGETS functional EXPORT functionalTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION functional)

    if(BUILD_DART_WITH_ASAN)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fsanitize=leak")
        set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fsanitize=address -fsanitize=leak")
    endif()
endif()

add_subdirectory(cpp)
add_subdirectory(dart)
