/*
 *
 */
#include "com_example_smoke_Structs_AllTypesStruct__Conversion.h"
#include "com_example_smoke_Structs_Point__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Structs::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct*)
{
    int8_t n_int8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (int8_t*)nullptr );
    uint8_t n_uint8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (uint8_t*)nullptr );
    int16_t n_int16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (int16_t*)nullptr );
    uint16_t n_uint16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (uint16_t*)nullptr );
    int32_t n_int32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (int32_t*)nullptr );
    uint32_t n_uint32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (uint32_t*)nullptr );
    int64_t n_int64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (int64_t*)nullptr );
    uint64_t n_uint64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (uint64_t*)nullptr );
    float n_float_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "floatField",
        (float*)nullptr );
    double n_double_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        (double*)nullptr );
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    bool n_boolean_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "booleanField",
        (bool*)nullptr );
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "bytesField",
        (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
    ::smoke::Structs::Point n_point_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "pointField", "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    return ::smoke::Structs::AllTypesStruct(std::move(n_int8_field), std::move(n_uint8_field), std::move(n_int16_field), std::move(n_uint16_field), std::move(n_int32_field), std::move(n_uint32_field), std::move(n_int64_field), std::move(n_uint64_field), std::move(n_float_field), std::move(n_double_field), std::move(n_string_field), std::move(n_boolean_field), std::move(n_bytes_field), std::move(n_point_field));
}
::gluecodium::optional<::smoke::Structs::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::AllTypesStruct>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Structs::AllTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::AllTypesStruct*)nullptr))
        : ::gluecodium::optional<::smoke::Structs::AllTypesStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$AllTypesStruct", com_example_smoke_Structs_00024AllTypesStruct, ::smoke::Structs::AllTypesStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::AllTypesStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int8Field", _ninput.int8_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint8Field", _ninput.uint8_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int16Field", _ninput.int16_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint16Field", _ninput.uint16_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int32Field", _ninput.int32_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint32Field", _ninput.uint32_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "int64Field", _ninput.int64_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "uint64Field", _ninput.uint64_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "floatField", _ninput.float_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "doubleField", _ninput.double_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.string_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "booleanField", _ninput.boolean_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "bytesField", _ninput.bytes_field);
    auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "pointField", "Lcom/example/smoke/Structs$Point;", jpoint_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
