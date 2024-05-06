/*

 *
 */

#include "com_example_smoke_Structs_ExternalStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::ExternalStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::ExternalStruct>)
{
    ::smoke::Structs::ExternalStruct _nout{};
    ::std::string n_stringField = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        TypeId<::std::string>{} );
    _nout.stringField = n_stringField;
    ::std::string n_externalStringField = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "externalStringField",
        TypeId<::std::string>{} );
    _nout.set_some_string(n_externalStringField);
    ::std::vector< int8_t > n_externalArrayField = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "externalArrayField", "Ljava/util/List;"),
        TypeId<::std::vector< int8_t >>{} );
    _nout.set_some_array(n_externalArrayField);
    ::fire::SomeVeryExternalStruct n_externalStructField = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "externalStructField", "Lcom/example/smoke/Structs$AnotherExternalStruct;"),
        TypeId<::fire::SomeVeryExternalStruct>{} );
    _nout.set_some_struct(n_externalStructField);
    return _nout;
}

std::optional<::smoke::Structs::ExternalStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::ExternalStruct>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::ExternalStruct>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::ExternalStruct>{}))
        : std::optional<::smoke::Structs::ExternalStruct>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ExternalStruct", com_example_smoke_Structs_00024ExternalStruct, ::smoke::Structs::ExternalStruct)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ExternalStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.stringField);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "externalStringField", _ninput.get_some_string());

    auto jexternalArrayField = convert_to_jni(_jenv, _ninput.get_some_array());
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "externalArrayField", "Ljava/util/List;", jexternalArrayField);

    auto jexternalStructField = convert_to_jni(_jenv, _ninput.get_some_struct());
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "externalStructField", "Lcom/example/smoke/Structs$AnotherExternalStruct;", jexternalStructField);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::ExternalStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
