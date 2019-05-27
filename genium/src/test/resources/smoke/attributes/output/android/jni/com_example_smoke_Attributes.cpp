/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Attributes.h"
#include "com_example_smoke_Attributes.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jlong
Java_com_example_smoke_Attributes_getBuiltInTypeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_built_in_type_attribute();
    return result;
}
void
Java_com_example_smoke_Attributes_setBuiltInTypeAttribute(JNIEnv* _jenv, jobject _jinstance, jlong jvalue)
{
    uint32_t value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_built_in_type_attribute(value);
}
jfloat
Java_com_example_smoke_Attributes_getReadonlyAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_readonly_attribute();
    return result;
}
jobject
Java_com_example_smoke_Attributes_getStructAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_struct_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setStructAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::smoke::Attributes::ExampleStruct value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::smoke::Attributes::ExampleStruct*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_struct_attribute(value);
}
jobject
Java_com_example_smoke_Attributes_getArrayAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_array_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setArrayAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::vector< ::std::string > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::vector< ::std::string >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_array_attribute(value);
}
jobject
Java_com_example_smoke_Attributes_getComplexTypeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_complex_type_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setComplexTypeAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::smoke::Attributes::InternalError value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::smoke::Attributes::InternalError*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_complex_type_attribute(value);
}
jbyteArray
Java_com_example_smoke_Attributes_getByteBufferAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_byte_buffer_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setByteBufferAttribute(JNIEnv* _jenv, jobject _jinstance, jbyteArray jvalue)
{
    ::std::shared_ptr< ::std::vector< uint8_t > > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_byte_buffer_attribute(value);
}
jobject
Java_com_example_smoke_Attributes_getInstanceAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_instance_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setInstanceAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::shared_ptr< ::smoke::AttributesInterface > value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::smoke::AttributesInterface >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_instance_attribute(value);
}
jboolean
Java_com_example_smoke_Attributes_isBooleanAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->is_boolean_attribute();
    return result;
}
void
Java_com_example_smoke_Attributes_setBooleanAttribute(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)
{
    bool value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_boolean_attribute(value);
}
jstring
Java_com_example_smoke_Attributes_getStaticAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::smoke::Attributes::get_static_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Attributes_setStaticAttribute(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::std::string value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);
    ::smoke::Attributes::set_static_attribute(value);
}
jobject
Java_com_example_smoke_Attributes_getStaticReadonlyAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::smoke::Attributes::get_static_readonly_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Attributes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Attributes>*> (_jpointerRef);
}
}
