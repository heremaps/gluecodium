/*
 *
 */
#include "com_example_smoke_EnableIfField__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::EnableIfField
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::EnableIfField*)
{
    ::smoke::EnableIfField _nout{};
    int32_t n_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        (int32_t*)nullptr );
    _nout.int_field = n_int_field;
    bool n_bool_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        (bool*)nullptr );
    _nout.bool_field = n_bool_field;
    return _nout;
}
std::optional<::smoke::EnableIfField>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::EnableIfField>*)
{
    return _jinput
        ? std::optional<::smoke::EnableIfField>(convert_from_jni(_jenv, _jinput, (::smoke::EnableIfField*)nullptr))
        : std::optional<::smoke::EnableIfField>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/EnableIfField", com_example_smoke_EnableIfField, ::smoke::EnableIfField)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::EnableIfField& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::EnableIfField>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "intField", _ninput.int_field);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "boolField", _ninput.bool_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::EnableIfField> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
