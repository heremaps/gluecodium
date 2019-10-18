/*
 *
 */
#include "com_example_smoke_GenericTypesWithBasicTypes_StructWithGenerics__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::GenericTypesWithBasicTypes::StructWithGenerics
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::GenericTypesWithBasicTypes::StructWithGenerics* dummy)
{
    ::smoke::GenericTypesWithBasicTypes::StructWithGenerics _nout{};
    ::std::vector< uint8_t > n_numbers_list = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "numbersList", "Ljava/util/List;"),
        (::std::vector< uint8_t >*)nullptr );
    _nout.numbers_list = n_numbers_list;
    ::std::unordered_map< uint8_t, ::std::string > n_numbers_map = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "numbersMap", "Ljava/util/Map;"),
        (::std::unordered_map< uint8_t, ::std::string >*)nullptr );
    _nout.numbers_map = n_numbers_map;
    ::std::unordered_set< uint8_t > n_numbers_set = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "numbersSet", "Ljava/util/Set;"),
        (::std::unordered_set< uint8_t >*)nullptr );
    _nout.numbers_set = n_numbers_set;
    return _nout;
}
::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>(convert_from_jni(_jenv, _jinput, (::smoke::GenericTypesWithBasicTypes::StructWithGenerics*)nullptr))
        : ::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/GenericTypesWithBasicTypes$StructWithGenerics", ::smoke::GenericTypesWithBasicTypes::StructWithGenerics)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::GenericTypesWithBasicTypes::StructWithGenerics& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jnumbers_list = convert_to_jni(_jenv, _ninput.numbers_list);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "numbersList", "Ljava/util/List;", jnumbers_list);
    auto jnumbers_map = convert_to_jni(_jenv, _ninput.numbers_map);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "numbersMap", "Ljava/util/Map;", jnumbers_map);
    auto jnumbers_set = convert_to_jni(_jenv, _ninput.numbers_set);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "numbersSet", "Ljava/util/Set;", jnumbers_set);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
