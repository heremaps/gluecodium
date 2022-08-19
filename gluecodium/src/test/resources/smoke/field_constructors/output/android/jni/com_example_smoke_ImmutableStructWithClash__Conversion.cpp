/*
 *
 */
#include "com_example_smoke_ImmutableStructWithClash__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::ImmutableStructWithClash
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ImmutableStructWithClash*)
{
    ::std::string n_string_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    int32_t n_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        (int32_t*)nullptr );
    bool n_bool_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        (bool*)nullptr );
    return ::smoke::ImmutableStructWithClash(std::move(n_bool_field), std::move(n_int_field), std::move(n_string_field));
}
::gluecodium::optional<::smoke::ImmutableStructWithClash>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::ImmutableStructWithClash>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::ImmutableStructWithClash>(convert_from_jni(_jenv, _jinput, (::smoke::ImmutableStructWithClash*)nullptr))
        : ::gluecodium::optional<::smoke::ImmutableStructWithClash>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/ImmutableStructWithClash", com_example_smoke_ImmutableStructWithClash, ::smoke::ImmutableStructWithClash)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ImmutableStructWithClash& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::ImmutableStructWithClash>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "stringField", _ninput.string_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "intField", _ninput.int_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "boolField", _ninput.bool_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::ImmutableStructWithClash> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
