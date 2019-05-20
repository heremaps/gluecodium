/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Nullable.h"
#include "com_example_smoke_Nullable.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniReference.h"
extern "C" {
jstring
Java_com_example_smoke_Nullable_methodWithString(JNIEnv* _jenv, jobject _jinstance, jstring jinput)
{
    ::genium::optional< ::std::string > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::std::string >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_string(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithBoolean(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< bool > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< bool >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_boolean(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithDouble(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< double > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< double >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_double(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithInt(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< int64_t > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< int64_t >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_int(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithSomeStruct(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::smoke::Nullable::SomeStruct > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::smoke::Nullable::SomeStruct >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_some_struct(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithSomeEnum(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::smoke::Nullable::SomeEnum > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::smoke::Nullable::SomeEnum >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_some_enum(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithSomeArray(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::smoke::Nullable::SomeArray > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::smoke::Nullable::SomeArray >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_some_array(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithInlineArray(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::std::vector< ::std::string > > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::std::vector< ::std::string > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_inline_array(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithSomeMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::genium::optional< ::smoke::Nullable::SomeMap > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::genium::optional< ::smoke::Nullable::SomeMap >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_some_map(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Nullable_methodWithInstance(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::shared_ptr< ::smoke::SomeInterface > input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::shared_ptr< ::smoke::SomeInterface >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->method_with_instance(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jstring
Java_com_example_smoke_Nullable_getStringAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_string_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setStringAttribute(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::genium::optional< ::std::string > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::std::string >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_string_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getBoolAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->is_bool_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setBoolAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< bool > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< bool >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_bool_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getDoubleAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_double_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setDoubleAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< double > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< double >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_double_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getIntAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_int_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setIntAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< int64_t > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< int64_t >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_int_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getStructAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_struct_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setStructAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< ::smoke::Nullable::SomeStruct > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::smoke::Nullable::SomeStruct >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_struct_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getEnumAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_enum_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setEnumAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< ::smoke::Nullable::SomeEnum > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::smoke::Nullable::SomeEnum >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_enum_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getArrayAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_array_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setArrayAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< ::smoke::Nullable::SomeArray > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::smoke::Nullable::SomeArray >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_array_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getInlineArrayAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_inline_array_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setInlineArrayAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< ::std::vector< ::std::string > > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::std::vector< ::std::string > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_inline_array_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getMapAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_map_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setMapAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::genium::optional< ::smoke::Nullable::SomeMap > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::genium::optional< ::smoke::Nullable::SomeMap >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_map_attribute(value);
}
jobject
Java_com_example_smoke_Nullable_getInstanceAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_instance_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Nullable_setInstanceAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::shared_ptr< ::smoke::SomeInterface > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::smoke::SomeInterface >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_instance_attribute(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Nullable_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (_jpointerRef);
}
}