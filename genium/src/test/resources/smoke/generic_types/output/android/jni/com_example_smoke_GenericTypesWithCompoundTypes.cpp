/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "smoke/GenericTypesWithCompoundTypes.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithStructList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_struct_list(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithStructMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_struct_map(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_enum_list(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::genium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::genium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_enum_map_key(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_enum_map_value(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumSet(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::genium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::genium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_enum_set(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithInstancesList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_instances_list(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_instances_map(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_GenericTypesWithCompoundTypes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (_jpointerRef);
}
}
