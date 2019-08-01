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
::alien::FooStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::alien::FooStruct* dummy)
{
    ::alien::FooStruct _nout{};
    ::std::string n_string = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "string",
        (::std::string*)nullptr );
    _nout.string = n_string;
    return _nout;
}
::genium::optional<::alien::FooStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::alien::FooStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::alien::FooStruct>(convert_from_jni(_jenv, _jinput, (::alien::FooStruct*)nullptr))
        : ::genium::optional<::alien::FooStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/GenericTypesWithCompoundTypes$ExternalStruct", ::alien::FooStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::alien::FooStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::alien::FooStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring = _ninput.string;
    ::genium::jni::set_field_value(_jenv, _jresult, "string", jstring);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::alien::FooStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::GenericTypesWithBasicTypes::StructWithGenerics
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::GenericTypesWithBasicTypes::StructWithGenerics* dummy)
{
    ::smoke::GenericTypesWithBasicTypes::StructWithGenerics _nout{};
    ::std::vector< uint8_t > n_numbers_list = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "numbersList",
        "Ljava/util/List;"),
        (::std::vector< uint8_t >*)nullptr );
    _nout.numbers_list = n_numbers_list;
    ::std::unordered_map< uint8_t, ::std::string > n_numbers_map = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "numbersMap",
        "Ljava/util/Map;"),
        (::std::unordered_map< uint8_t, ::std::string >*)nullptr );
    _nout.numbers_map = n_numbers_map;
    ::std::unordered_set< uint8_t > n_numbers_set = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "numbersSet",
        "Ljava/util/Set;"),
        (::std::unordered_set< uint8_t >*)nullptr );
    _nout.numbers_set = n_numbers_set;
    return _nout;
}
::genium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>(convert_from_jni(_jenv, _jinput, (::smoke::GenericTypesWithBasicTypes::StructWithGenerics*)nullptr))
        : ::genium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/GenericTypesWithBasicTypes$StructWithGenerics", ::smoke::GenericTypesWithBasicTypes::StructWithGenerics)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::GenericTypesWithBasicTypes::StructWithGenerics& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jnumbers_list = convert_to_jni(_jenv, _ninput.numbers_list);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "numbersList",
        "Ljava/util/List;", jnumbers_list);
    auto jnumbers_map = convert_to_jni(_jenv, _ninput.numbers_map);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "numbersMap",
        "Ljava/util/Map;", jnumbers_map);
    auto jnumbers_set = convert_to_jni(_jenv, _ninput.numbers_set);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "numbersSet",
        "Ljava/util/Set;", jnumbers_set);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::GenericTypesWithCompoundTypes::BasicStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::GenericTypesWithCompoundTypes::BasicStruct* dummy)
{
    ::smoke::GenericTypesWithCompoundTypes::BasicStruct _nout{};
    double n_value = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "value",
        (double*)nullptr );
    _nout.value = n_value;
    return _nout;
}
::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>(convert_from_jni(_jenv, _jinput, (::smoke::GenericTypesWithCompoundTypes::BasicStruct*)nullptr))
        : ::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/GenericTypesWithCompoundTypes$BasicStruct", ::smoke::GenericTypesWithCompoundTypes::BasicStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::GenericTypesWithCompoundTypes::BasicStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::GenericTypesWithCompoundTypes::BasicStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jvalue = _ninput.value;
    ::genium::jni::set_field_value(_jenv, _jresult, "value", jvalue);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::GenericTypesWithCompoundTypes::BasicStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
