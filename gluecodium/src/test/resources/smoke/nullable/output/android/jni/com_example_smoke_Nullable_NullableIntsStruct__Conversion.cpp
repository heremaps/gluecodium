/*
 *
 */
#include "com_example_smoke_Nullable_NullableIntsStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Nullable::NullableIntsStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Nullable::NullableIntsStruct* dummy)
{
    ::smoke::Nullable::NullableIntsStruct _nout{};
    ::gluecodium::optional< int8_t > n_int8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (::gluecodium::optional< int8_t >*)nullptr );
    _nout.int8_field = n_int8_field;
    ::gluecodium::optional< int16_t > n_int16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (::gluecodium::optional< int16_t >*)nullptr );
    _nout.int16_field = n_int16_field;
    ::gluecodium::optional< int32_t > n_int32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (::gluecodium::optional< int32_t >*)nullptr );
    _nout.int32_field = n_int32_field;
    ::gluecodium::optional< int64_t > n_int64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (::gluecodium::optional< int64_t >*)nullptr );
    _nout.int64_field = n_int64_field;
    ::gluecodium::optional< uint8_t > n_uint8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (::gluecodium::optional< uint8_t >*)nullptr );
    _nout.uint8_field = n_uint8_field;
    ::gluecodium::optional< uint16_t > n_uint16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (::gluecodium::optional< uint16_t >*)nullptr );
    _nout.uint16_field = n_uint16_field;
    ::gluecodium::optional< uint32_t > n_uint32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (::gluecodium::optional< uint32_t >*)nullptr );
    _nout.uint32_field = n_uint32_field;
    ::gluecodium::optional< uint64_t > n_uint64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (::gluecodium::optional< uint64_t >*)nullptr );
    _nout.uint64_field = n_uint64_field;
    return _nout;
}
::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Nullable::NullableIntsStruct*)nullptr))
        : ::gluecodium::optional<::smoke::Nullable::NullableIntsStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Nullable$NullableIntsStruct", ::smoke::Nullable::NullableIntsStruct)
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
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Nullable::NullableIntsStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
