/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Properties.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Properties.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jlong
Java_com_example_smoke_Properties_getBuiltInTypeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_built_in_type_attribute();
    return result;
}
void
Java_com_example_smoke_Properties_setBuiltInTypeAttribute(JNIEnv* _jenv, jobject _jinstance, jlong jvalue)
{
    uint32_t value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_built_in_type_attribute(value);
}
jfloat
Java_com_example_smoke_Properties_getReadonlyAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_readonly_attribute();
    return result;
}
jobject
Java_com_example_smoke_Properties_getStructAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_struct_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setStructAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::smoke::Properties::ExampleStruct value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::smoke::Properties::ExampleStruct*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_struct_attribute(value);
}
jobject
Java_com_example_smoke_Properties_getArrayAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_array_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setArrayAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::vector< ::std::string > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::vector< ::std::string >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_array_attribute(value);
}
jobject
Java_com_example_smoke_Properties_getComplexTypeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_complex_type_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setComplexTypeAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::smoke::Properties::InternalError value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::smoke::Properties::InternalError*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_complex_type_attribute(value);
}
jbyteArray
Java_com_example_smoke_Properties_getByteBufferAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_byte_buffer_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setByteBufferAttribute(JNIEnv* _jenv, jobject _jinstance, jbyteArray jvalue)
{
    ::std::shared_ptr< ::std::vector< uint8_t > > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_byte_buffer_attribute(value);
}
jobject
Java_com_example_smoke_Properties_getInstanceAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_instance_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setInstanceAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::shared_ptr< ::smoke::PropertiesInterface > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::smoke::PropertiesInterface >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_instance_attribute(value);
}
jboolean
Java_com_example_smoke_Properties_isBooleanAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->is_boolean_attribute();
    return result;
}
void
Java_com_example_smoke_Properties_setBooleanAttribute(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)
{
    bool value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_boolean_attribute(value);
}
jstring
Java_com_example_smoke_Properties_getStaticAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::smoke::Properties::get_static_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Properties_setStaticAttribute(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::std::string value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);
    ::smoke::Properties::set_static_attribute(value);
}
jobject
Java_com_example_smoke_Properties_getStaticReadonlyAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::smoke::Properties::get_static_readonly_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (_jpointerRef);
}
}
