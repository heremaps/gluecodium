/*

 *
 */

#include "java_time_Month__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::kotlin_smoke::Month
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::Month>)
{
    auto ordinal = call_java_method<jint>(_jenv, _jinput, "ordinal", "()I");
    switch(ordinal) {
        case 0:
            return ::kotlin_smoke::Month::JANUARY;
        case 1:
            return ::kotlin_smoke::Month::FEBRUARY;
        case 2:
            return ::kotlin_smoke::Month::MARCH;
        default:
            return {};
    }
}

std::optional<::kotlin_smoke::Month>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::Month>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::Month>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::Month>{}))
        : std::optional<::kotlin_smoke::Month>{};
}

REGISTER_JNI_CLASS_CACHE("java/time/Month", java_time_Month, ::kotlin_smoke::Month)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::Month _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::Month>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::kotlin_smoke::Month::JANUARY):
            enumeratorName = "JANUARY";
            break;
        case(::kotlin_smoke::Month::FEBRUARY):
            enumeratorName = "FEBRUARY";
            break;
        case(::kotlin_smoke::Month::MARCH):
            enumeratorName = "MARCH";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Ljava/time/Month;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::Month> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
