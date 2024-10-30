/*

 *
 */

#include "com_example_smoke_Structs_ImmutableStructWithCppAccessors__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::ImmutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::ImmutableStructWithCppAccessors>)
{
    
    int32_t n_trivial_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "trivialIntField",
        TypeId<int32_t>{} );
    
    double n_trivial_double_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "trivialDoubleField",
        TypeId<double>{} );
    
    ::std::string n_nontrivial_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "nontrivialStringField",
        TypeId<::std::string>{} );
    
    ::smoke::Structs::Point n_nontrivial_point_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "nontrivialPointField", "Lcom/example/smoke/Structs$Point;"),
        TypeId<::smoke::Structs::Point>{} );
    
    std::optional< ::smoke::Structs::Point > n_nontrivial_optional_point = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "nontrivialOptionalPoint", "Lcom/example/smoke/Structs$Point;"),
        TypeId<std::optional< ::smoke::Structs::Point >>{} );
    
    return ::smoke::Structs::ImmutableStructWithCppAccessors(std::move(n_trivial_int_field), std::move(n_trivial_double_field), std::move(n_nontrivial_string_field), std::move(n_nontrivial_point_field), std::move(n_nontrivial_optional_point));
}

std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::ImmutableStructWithCppAccessors>{}))
        : std::optional<::smoke::Structs::ImmutableStructWithCppAccessors>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ImmutableStructWithCppAccessors", com_example_smoke_Structs_00024ImmutableStructWithCppAccessors, ::smoke::Structs::ImmutableStructWithCppAccessors)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ImmutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ImmutableStructWithCppAccessors>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "trivialIntField", _ninput.get_trivial_int_field());

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "trivialDoubleField", _ninput.get_trivial_double_field());

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "nontrivialStringField", _ninput.get_nontrivial_string_field());

    auto jnontrivial_point_field = convert_to_jni(_jenv, _ninput.get_nontrivial_point_field());
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "nontrivialPointField", "Lcom/example/smoke/Structs$Point;", jnontrivial_point_field);

    auto jnontrivial_optional_point = convert_to_jni(_jenv, _ninput.get_nontrivial_optional_point());
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "nontrivialOptionalPoint", "Lcom/example/smoke/Structs$Point;", jnontrivial_optional_point);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::ImmutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
