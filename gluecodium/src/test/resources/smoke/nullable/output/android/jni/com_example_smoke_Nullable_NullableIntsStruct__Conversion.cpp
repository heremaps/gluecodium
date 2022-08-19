/*
 *
 */
#include "com_example_smoke_Nullable_NullableIntsStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Nullable::NullableIntsStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Nullable::NullableIntsStruct*)
{
    ::smoke::Nullable::NullableIntsStruct _nout{};
    std::optional< int8_t > n_int8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (std::optional< int8_t >*)nullptr );
    _nout.int8_field = n_int8_field;
    std::optional< int16_t > n_int16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (std::optional< int16_t >*)nullptr );
    _nout.int16_field = n_int16_field;
    std::optional< int32_t > n_int32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (std::optional< int32_t >*)nullptr );
    _nout.int32_field = n_int32_field;
    std::optional< int64_t > n_int64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (std::optional< int64_t >*)nullptr );
    _nout.int64_field = n_int64_field;
    std::optional< uint8_t > n_uint8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (std::optional< uint8_t >*)nullptr );
    _nout.uint8_field = n_uint8_field;
    std::optional< uint16_t > n_uint16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (std::optional< uint16_t >*)nullptr );
    _nout.uint16_field = n_uint16_field;
    std::optional< uint32_t > n_uint32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (std::optional< uint32_t >*)nullptr );
    _nout.uint32_field = n_uint32_field;
    std::optional< uint64_t > n_uint64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (std::optional< uint64_t >*)nullptr );
    _nout.uint64_field = n_uint64_field;
    return _nout;
}
std::optional<::smoke::Nullable::NullableIntsStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Nullable::NullableIntsStruct>*)
{
    return _jinput
        ? std::optional<::smoke::Nullable::NullableIntsStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Nullable::NullableIntsStruct*)nullptr))
        : std::optional<::smoke::Nullable::NullableIntsStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Nullable$NullableIntsStruct", com_example_smoke_Nullable_00024NullableIntsStruct, ::smoke::Nullable::NullableIntsStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Nullable::NullableIntsStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Nullable::NullableIntsStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int8Field", _ninput.int8_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int16Field", _ninput.int16_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int32Field", _ninput.int32_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int64Field", _ninput.int64_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint8Field", _ninput.uint8_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint16Field", _ninput.uint16_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint32Field", _ninput.uint32_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint64Field", _ninput.uint64_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Nullable::NullableIntsStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
