/*

 *
 */

#include "com_example_smoke_Nullable_NullableStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Nullable::NullableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Nullable::NullableStruct>)
{
    ::smoke::Nullable::NullableStruct _nout{};
    ::gluecodium::optional< ::std::string > n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        TypeId<::gluecodium::optional< ::std::string >>{} );
    _nout.string_field = n_string_field;
    ::gluecodium::optional< bool > n_bool_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        TypeId<::gluecodium::optional< bool >>{} );
    _nout.bool_field = n_bool_field;
    ::gluecodium::optional< double > n_double_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        TypeId<::gluecodium::optional< double >>{} );
    _nout.double_field = n_double_field;
    ::gluecodium::optional< ::smoke::Nullable::SomeStruct > n_struct_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "structField", "Lcom/example/smoke/Nullable$SomeStruct;"),
        TypeId<::gluecodium::optional< ::smoke::Nullable::SomeStruct >>{} );
    _nout.struct_field = n_struct_field;
    ::gluecodium::optional< ::smoke::Nullable::SomeEnum > n_enum_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "enumField", "Lcom/example/smoke/Nullable$SomeEnum;"),
        TypeId<::gluecodium::optional< ::smoke::Nullable::SomeEnum >>{} );
    _nout.enum_field = n_enum_field;
    ::gluecodium::optional< ::smoke::Nullable::SomeArray > n_array_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "arrayField", "Ljava/util/List;"),
        TypeId<::gluecodium::optional< ::smoke::Nullable::SomeArray >>{} );
    _nout.array_field = n_array_field;
    ::gluecodium::optional< ::std::vector< ::std::string > > n_inline_array_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "inlineArrayField", "Ljava/util/List;"),
        TypeId<::gluecodium::optional< ::std::vector< ::std::string > >>{} );
    _nout.inline_array_field = n_inline_array_field;
    ::gluecodium::optional< ::smoke::Nullable::SomeMap > n_map_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "mapField", "Ljava/util/Map;"),
        TypeId<::gluecodium::optional< ::smoke::Nullable::SomeMap >>{} );
    _nout.map_field = n_map_field;
    ::std::shared_ptr< ::smoke::SomeInterface > n_instance_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "instanceField", "Lcom/example/smoke/SomeInterface;"),
        TypeId<::std::shared_ptr< ::smoke::SomeInterface >>{} );
    _nout.instance_field = n_instance_field;
    return _nout;
}

::gluecodium::optional<::smoke::Nullable::NullableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::Nullable::NullableStruct>>)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Nullable::NullableStruct>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Nullable::NullableStruct>{}))
        : ::gluecodium::optional<::smoke::Nullable::NullableStruct>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Nullable$NullableStruct", com_example_smoke_Nullable_00024NullableStruct, ::smoke::Nullable::NullableStruct)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Nullable::NullableStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Nullable::NullableStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.string_field);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "boolField", _ninput.bool_field);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "doubleField", _ninput.double_field);

    auto jstruct_field = convert_to_jni(_jenv, _ninput.struct_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "structField", "Lcom/example/smoke/Nullable$SomeStruct;", jstruct_field);

    auto jenum_field = convert_to_jni(_jenv, _ninput.enum_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "enumField", "Lcom/example/smoke/Nullable$SomeEnum;", jenum_field);

    auto jarray_field = convert_to_jni(_jenv, _ninput.array_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "arrayField", "Ljava/util/List;", jarray_field);

    auto jinline_array_field = convert_to_jni(_jenv, _ninput.inline_array_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "inlineArrayField", "Ljava/util/List;", jinline_array_field);

    auto jmap_field = convert_to_jni(_jenv, _ninput.map_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "mapField", "Ljava/util/Map;", jmap_field);

    auto jinstance_field = convert_to_jni(_jenv, _ninput.instance_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "instanceField", "Lcom/example/smoke/SomeInterface;", jinstance_field);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Nullable::NullableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
