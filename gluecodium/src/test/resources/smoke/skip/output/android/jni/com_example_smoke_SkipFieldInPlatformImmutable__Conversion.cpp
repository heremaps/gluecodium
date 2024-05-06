/*

 *
 */

#include "com_example_smoke_SkipFieldInPlatformImmutable__Conversion.h"
#include "smoke/DummyStruct.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::SkipFieldInPlatformImmutable
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SkipFieldInPlatformImmutable>)
{
    
    int32_t n_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        TypeId<int32_t>{} );
    
    bool n_bool_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "boolField",
        TypeId<bool>{} );
    
    return ::smoke::SkipFieldInPlatformImmutable(std::move(n_int_field), ::smoke::DummyStruct{}, std::move(n_bool_field));
}

std::optional<::smoke::SkipFieldInPlatformImmutable>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::SkipFieldInPlatformImmutable>>)
{
    return _jinput
        ? std::optional<::smoke::SkipFieldInPlatformImmutable>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::SkipFieldInPlatformImmutable>{}))
        : std::optional<::smoke::SkipFieldInPlatformImmutable>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/SkipFieldInPlatformImmutable", com_example_smoke_SkipFieldInPlatformImmutable, ::smoke::SkipFieldInPlatformImmutable)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::SkipFieldInPlatformImmutable& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::SkipFieldInPlatformImmutable>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "intField", _ninput.int_field);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "boolField", _ninput.bool_field);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::SkipFieldInPlatformImmutable> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
