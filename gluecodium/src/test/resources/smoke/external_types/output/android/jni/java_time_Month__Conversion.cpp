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
::smoke::Month
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Month*)
{
    auto ordinal = call_java_method<jint>(_jenv, _jinput, "ordinal", "()I");
    switch(ordinal) {
        case 0:
            return ::smoke::Month::JANUARY;
        case 1:
            return ::smoke::Month::FEBRUARY;
        case 2:
            return ::smoke::Month::MARCH;
        default:
            return {};
    }
}
std::optional<::smoke::Month>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Month>*)
{
    return _jinput
        ? std::optional<::smoke::Month>(convert_from_jni(_jenv, _jinput, (::smoke::Month*)nullptr))
        : std::optional<::smoke::Month>{};
}
REGISTER_JNI_CLASS_CACHE("java/time/Month", java_time_Month, ::smoke::Month)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Month _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Month>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::Month::JANUARY):
            enumeratorName = "JANUARY";
            break;
        case(::smoke::Month::FEBRUARY):
            enumeratorName = "FEBRUARY";
            break;
        case(::smoke::Month::MARCH):
            enumeratorName = "MARCH";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Ljava/time/Month;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Month> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
