/*

 *
 */

#include "com_example_smoke_SkipFieldInPlatform__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::SkipFieldInPlatform
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SkipFieldInPlatform>)
{
    ::smoke::SkipFieldInPlatform _nout{};
    int32_t n_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        TypeId<int32_t>{} );
    _nout.int_field = n_int_field;
    bool n_bool_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        TypeId<bool>{} );
    _nout.bool_field = n_bool_field;
    return _nout;
}

std::optional<::smoke::SkipFieldInPlatform>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::SkipFieldInPlatform>>)
{
    return _jinput
        ? std::optional<::smoke::SkipFieldInPlatform>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::SkipFieldInPlatform>{}))
        : std::optional<::smoke::SkipFieldInPlatform>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/SkipFieldInPlatform", com_example_smoke_SkipFieldInPlatform, ::smoke::SkipFieldInPlatform)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::SkipFieldInPlatform& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::SkipFieldInPlatform>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "intField", _ninput.int_field);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "boolField", _ninput.bool_field);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::SkipFieldInPlatform> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
