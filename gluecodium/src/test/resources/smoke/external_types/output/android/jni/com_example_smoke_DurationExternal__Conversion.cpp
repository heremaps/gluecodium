/*

 *
 */

#include "com_example_smoke_DurationExternal__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

std::chrono::duration<uint64_t, std::ratio<1,1000>>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::chrono::duration<uint64_t, std::ratio<1,1000>>>)
{
    
    uint64_t n_value = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "value",
        TypeId<uint64_t>{} );
    
    return std::chrono::duration<uint64_t, std::ratio<1,1000>>(std::move(n_value));
}

std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>>)
{
    return _jinput
        ? std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>(convert_from_jni(_jenv, _jinput, TypeId<std::chrono::duration<uint64_t, std::ratio<1,1000>>>{}))
        : std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/smoke/DurationExternal", com_example_smoke_DurationExternal, std::chrono::duration<uint64_t, std::ratio<1,1000>>)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::chrono::duration<uint64_t, std::ratio<1,1000>>& _ninput)
{
    auto& javaClass = CachedJavaClass<std::chrono::duration<uint64_t, std::ratio<1,1000>>>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "value", _ninput.count());
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
