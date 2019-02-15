#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
namespace genium
{
namespace jni
{
::smoke::Nullable::SomeStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Nullable::SomeStruct* dummy)
{
    ::smoke::Nullable::SomeStruct _nout{};
    ::std::string n_string_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_field = n_string_field;
    return _nout;
}
std::shared_ptr<::smoke::Nullable::SomeStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Nullable::SomeStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Nullable::SomeStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Nullable::SomeStruct*)nullptr))
        : std::shared_ptr<::smoke::Nullable::SomeStruct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Nullable::SomeStruct, "com/example/smoke/Nullable$SomeStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Nullable::SomeStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Nullable::SomeStruct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jstring_field = _ninput.string_field;
    genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Nullable::SomeStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Nullable::NullableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Nullable::NullableStruct* dummy)
{
    ::smoke::Nullable::NullableStruct _nout{};
    ::std::shared_ptr< ::std::string > n_string_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::shared_ptr< ::std::string >*)nullptr );
    _nout.string_field = n_string_field;
    ::std::shared_ptr< bool > n_bool_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        (::std::shared_ptr< bool >*)nullptr );
    _nout.bool_field = n_bool_field;
    ::std::shared_ptr< double > n_double_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        (::std::shared_ptr< double >*)nullptr );
    _nout.double_field = n_double_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeStruct > n_struct_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "structField",
        "Lcom/example/smoke/Nullable$SomeStruct;"),
        (::std::shared_ptr< ::smoke::Nullable::SomeStruct >*)nullptr );
    _nout.struct_field = n_struct_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeEnum > n_enum_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "enumField",
        "Lcom/example/smoke/Nullable$SomeEnum;"),
        (::std::shared_ptr< ::smoke::Nullable::SomeEnum >*)nullptr );
    _nout.enum_field = n_enum_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeArray > n_array_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "arrayField",
        "Ljava/util/List;"),
        (::std::shared_ptr< ::smoke::Nullable::SomeArray >*)nullptr );
    _nout.array_field = n_array_field;
    ::std::shared_ptr< ::std::vector< ::std::string > > n_inline_array_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "inlineArrayField",
        "Ljava/util/List;"),
        (::std::shared_ptr< ::std::vector< ::std::string > >*)nullptr );
    _nout.inline_array_field = n_inline_array_field;
    ::std::shared_ptr< ::smoke::Nullable::SomeMap > n_map_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "mapField",
        "Ljava/util/Map;"),
        (::std::shared_ptr< ::smoke::Nullable::SomeMap >*)nullptr );
    _nout.map_field = n_map_field;
    return _nout;
}
std::shared_ptr<::smoke::Nullable::NullableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Nullable::NullableStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Nullable::NullableStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Nullable::NullableStruct*)nullptr))
        : std::shared_ptr<::smoke::Nullable::NullableStruct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Nullable::NullableStruct, "com/example/smoke/Nullable$NullableStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Nullable::NullableStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Nullable::NullableStruct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jstring_field = _ninput.string_field;
    genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    auto jbool_field = _ninput.bool_field;
    genium::jni::set_field_value(_jenv, _jresult, "boolField", jbool_field);
    auto jdouble_field = _ninput.double_field;
    genium::jni::set_field_value(_jenv, _jresult, "doubleField", jdouble_field);
    auto jstruct_field = convert_to_jni(_jenv, _ninput.struct_field);
    genium::jni::set_object_field_value(_jenv, _jresult, "structField",
        "Lcom/example/smoke/Nullable$SomeStruct;", jstruct_field);
    auto jenum_field = convert_to_jni(_jenv, _ninput.enum_field);
    genium::jni::set_object_field_value(_jenv, _jresult, "enumField",
        "Lcom/example/smoke/Nullable$SomeEnum;", jenum_field);
    auto jarray_field = convert_to_jni(_jenv, _ninput.array_field);
    genium::jni::set_object_field_value(_jenv, _jresult, "arrayField",
        "Ljava/util/List;", jarray_field);
    auto jinline_array_field = convert_to_jni(_jenv, _ninput.inline_array_field);
    genium::jni::set_object_field_value(_jenv, _jresult, "inlineArrayField",
        "Ljava/util/List;", jinline_array_field);
    auto jmap_field = convert_to_jni(_jenv, _ninput.map_field);
    genium::jni::set_object_field_value(_jenv, _jresult, "mapField",
        "Ljava/util/Map;", jmap_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Nullable::NullableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Nullable::NullableIntsStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Nullable::NullableIntsStruct* dummy)
{
    ::smoke::Nullable::NullableIntsStruct _nout{};
    ::std::shared_ptr< int8_t > n_int8_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (::std::shared_ptr< int8_t >*)nullptr );
    _nout.int8_field = n_int8_field;
    ::std::shared_ptr< int16_t > n_int16_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (::std::shared_ptr< int16_t >*)nullptr );
    _nout.int16_field = n_int16_field;
    ::std::shared_ptr< int32_t > n_int32_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (::std::shared_ptr< int32_t >*)nullptr );
    _nout.int32_field = n_int32_field;
    ::std::shared_ptr< int64_t > n_int64_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (::std::shared_ptr< int64_t >*)nullptr );
    _nout.int64_field = n_int64_field;
    ::std::shared_ptr< uint8_t > n_uint8_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (::std::shared_ptr< uint8_t >*)nullptr );
    _nout.uint8_field = n_uint8_field;
    ::std::shared_ptr< uint16_t > n_uint16_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (::std::shared_ptr< uint16_t >*)nullptr );
    _nout.uint16_field = n_uint16_field;
    ::std::shared_ptr< uint32_t > n_uint32_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (::std::shared_ptr< uint32_t >*)nullptr );
    _nout.uint32_field = n_uint32_field;
    ::std::shared_ptr< uint64_t > n_uint64_field = genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (::std::shared_ptr< uint64_t >*)nullptr );
    _nout.uint64_field = n_uint64_field;
    return _nout;
}
std::shared_ptr<::smoke::Nullable::NullableIntsStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Nullable::NullableIntsStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Nullable::NullableIntsStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Nullable::NullableIntsStruct*)nullptr))
        : std::shared_ptr<::smoke::Nullable::NullableIntsStruct>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Nullable::NullableIntsStruct, "com/example/smoke/Nullable$NullableIntsStruct")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Nullable::NullableIntsStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Nullable::NullableIntsStruct>::java_class;
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jint8_field = _ninput.int8_field;
    genium::jni::set_field_value(_jenv, _jresult, "int8Field", jint8_field);
    auto jint16_field = _ninput.int16_field;
    genium::jni::set_field_value(_jenv, _jresult, "int16Field", jint16_field);
    auto jint32_field = _ninput.int32_field;
    genium::jni::set_field_value(_jenv, _jresult, "int32Field", jint32_field);
    auto jint64_field = _ninput.int64_field;
    genium::jni::set_field_value(_jenv, _jresult, "int64Field", jint64_field);
    auto juint8_field = _ninput.uint8_field;
    genium::jni::set_field_value(_jenv, _jresult, "uint8Field", juint8_field);
    auto juint16_field = _ninput.uint16_field;
    genium::jni::set_field_value(_jenv, _jresult, "uint16Field", juint16_field);
    auto juint32_field = _ninput.uint32_field;
    genium::jni::set_field_value(_jenv, _jresult, "uint32Field", juint32_field);
    auto juint64_field = _ninput.uint64_field;
    genium::jni::set_field_value(_jenv, _jresult, "uint64Field", juint64_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Nullable::NullableIntsStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
