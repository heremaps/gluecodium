/*

 *
 */

#include "java_util_SimpleTimeZone__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::kotlin_smoke::TimeZone
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::TimeZone>)
{
    ::kotlin_smoke::TimeZone _nout{};
    auto n_raw_offset = call_java_method<jint>(_jenv, _jinput, "getRawOffset", "()I");
    _nout.raw_offset = n_raw_offset;
    return _nout;
}

std::optional<::kotlin_smoke::TimeZone>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::TimeZone>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::TimeZone>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::TimeZone>{}))
        : std::optional<::kotlin_smoke::TimeZone>{};
}

REGISTER_JNI_CLASS_CACHE("java/util/SimpleTimeZone", java_util_SimpleTimeZone, ::kotlin_smoke::TimeZone)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::TimeZone& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::TimeZone>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    call_java_method<void>(_jenv, _jresult, "setRawOffset", "(I)V", _ninput.raw_offset);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::TimeZone> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
