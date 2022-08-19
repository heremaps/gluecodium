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
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ImmutableStructWithCppAccessors*)
{
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    return ::smoke::Structs::ImmutableStructWithCppAccessors(std::move(n_string_field));
}
::gluecodium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::ImmutableStructWithCppAccessors*)nullptr))
        : ::gluecodium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ImmutableStructWithCppAccessors", com_example_smoke_Structs_00024ImmutableStructWithCppAccessors, ::smoke::Structs::ImmutableStructWithCppAccessors)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ImmutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ImmutableStructWithCppAccessors>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.get_string_field());
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::ImmutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
