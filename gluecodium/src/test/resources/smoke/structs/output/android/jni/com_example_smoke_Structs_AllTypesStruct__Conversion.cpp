/*

 *
 */

#include "com_example_smoke_Structs_AllTypesStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::AllTypesStruct>)
{
    
    int8_t n_int8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        TypeId<int8_t>{} );
    
    uint8_t n_uint8_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        TypeId<uint8_t>{} );
    
    int16_t n_int16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        TypeId<int16_t>{} );
    
    uint16_t n_uint16_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        TypeId<uint16_t>{} );
    
    int32_t n_int32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        TypeId<int32_t>{} );
    
    uint32_t n_uint32_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        TypeId<uint32_t>{} );
    
    int64_t n_int64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        TypeId<int64_t>{} );
    
    uint64_t n_uint64_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        TypeId<uint64_t>{} );
    
    float n_float_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "floatField",
        TypeId<float>{} );
    
    double n_double_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        TypeId<double>{} );
    
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        TypeId<::std::string>{} );
    
    bool n_boolean_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "booleanField",
        TypeId<bool>{} );
    
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "bytesField",
        TypeId<::std::shared_ptr< ::std::vector< uint8_t > >>{} );
    
    ::smoke::Structs::Point n_point_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "pointField", "Lcom/example/smoke/Structs$Point;"),
        TypeId<::smoke::Structs::Point>{} );
    
    return ::smoke::Structs::AllTypesStruct(std::move(n_int8_field), std::move(n_uint8_field), std::move(n_int16_field), std::move(n_uint16_field), std::move(n_int32_field), std::move(n_uint32_field), std::move(n_int64_field), std::move(n_uint64_field), std::move(n_float_field), std::move(n_double_field), std::move(n_string_field), std::move(n_boolean_field), std::move(n_bytes_field), std::move(n_point_field));
}

std::optional<::smoke::Structs::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::AllTypesStruct>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::AllTypesStruct>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::AllTypesStruct>{}))
        : std::optional<::smoke::Structs::AllTypesStruct>{};
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
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
