/*
 *
 */
#include "EnumConversion.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::FreeEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::FreeEnum* dummy)
{
    return ::smoke::FreeEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::gluecodium::optional<::smoke::FreeEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::FreeEnum>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::FreeEnum>(convert_from_jni(_jenv, _jinput, (::smoke::FreeEnum*)nullptr))
        : ::gluecodium::optional<::smoke::FreeEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/FreeEnum", ::smoke::FreeEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::FreeEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::FreeEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::FreeEnum::FOO):
            enumeratorName = "FOO";
            break;
        case(::smoke::FreeEnum::BAR):
            enumeratorName = "BAR";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/FreeEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::FreeEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum* dummy)
{
    return ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>(convert_from_jni(_jenv, _jinput, (::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum*)nullptr))
        : ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFourEnum", ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum::NONE):
            enumeratorName = "NONE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/LevelOne$LevelTwo$LevelThree$LevelFourEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFourEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::UnusedTopLevelEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::UnusedTopLevelEnum* dummy)
{
    return ::smoke::UnusedTopLevelEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::gluecodium::optional<::smoke::UnusedTopLevelEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::UnusedTopLevelEnum>* dummy)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::UnusedTopLevelEnum>(convert_from_jni(_jenv, _jinput, (::smoke::UnusedTopLevelEnum*)nullptr))
        : ::gluecodium::optional<::smoke::UnusedTopLevelEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/UnusedTopLevelEnum", ::smoke::UnusedTopLevelEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::UnusedTopLevelEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::UnusedTopLevelEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::UnusedTopLevelEnum::DOESNT_WORK):
            enumeratorName = "DOESNT_WORK";
            break;
        case(::smoke::UnusedTopLevelEnum::CRASHED_ANYWAY):
            enumeratorName = "CRASHED_ANYWAY";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/UnusedTopLevelEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::UnusedTopLevelEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
