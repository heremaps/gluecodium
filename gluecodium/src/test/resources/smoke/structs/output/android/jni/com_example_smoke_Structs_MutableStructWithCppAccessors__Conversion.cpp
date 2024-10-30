/*

 *
 */

#include "com_example_smoke_Structs_MutableStructWithCppAccessors__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Structs::MutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::MutableStructWithCppAccessors>)
{
    ::smoke::Structs::MutableStructWithCppAccessors _nout{};
    int32_t n_trivial_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "trivialIntField",
        TypeId<int32_t>{} );
    _nout.set_trivial_int_field(n_trivial_int_field);
    double n_trivial_double_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "trivialDoubleField",
        TypeId<double>{} );
    _nout.set_trivial_double_field(n_trivial_double_field);
    ::std::string n_nontrivial_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "nontrivialStringField",
        TypeId<::std::string>{} );
    _nout.set_nontrivial_string_field(n_nontrivial_string_field);
    ::smoke::Structs::Point n_nontrivial_point_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "nontrivialPointField", "Lcom/example/smoke/Structs$Point;"),
        TypeId<::smoke::Structs::Point>{} );
    _nout.set_nontrivial_point_field(n_nontrivial_point_field);
    std::optional< ::smoke::Structs::Point > n_nontrivial_optional_point = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "nontrivialOptionalPoint", "Lcom/example/smoke/Structs$Point;"),
        TypeId<std::optional< ::smoke::Structs::Point >>{} );
    _nout.set_nontrivial_optional_point(n_nontrivial_optional_point);
    return _nout;
}

std::optional<::smoke::Structs::MutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Structs::MutableStructWithCppAccessors>>)
{
    return _jinput
        ? std::optional<::smoke::Structs::MutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Structs::MutableStructWithCppAccessors>{}))
        : std::optional<::smoke::Structs::MutableStructWithCppAccessors>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$MutableStructWithCppAccessors", com_example_smoke_Structs_00024MutableStructWithCppAccessors, ::smoke::Structs::MutableStructWithCppAccessors)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::MutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::MutableStructWithCppAccessors>::java_class;
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
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Structs::MutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
