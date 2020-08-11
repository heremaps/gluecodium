/*
 *
 */
#include "java_lang_String__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
namespace
{
struct Dummycom_here_android_test_SeasonConverterType {};
}
REGISTER_JNI_CLASS_CACHE("com/here/android/test/SeasonConverter", com_here_android_test_SeasonConverter, Dummycom_here_android_test_SeasonConverterType)
::smoke::Season
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, ::smoke::Season*)
{
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_SeasonConverterType>::java_class;
    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Ljava/lang/String;)Lcom/example/smoke/Season;");
    if (convertMethodId == NULL) {
        throw_runtime_exception(_jenv, "Static method 'convertToInternal(Ljava/lang/String;)Lcom/example/smoke/Season;' not found.");
        return {};
    }
    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    return ::smoke::Season(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::gluecodium::optional<::smoke::Season>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Season>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::Season>(convert_from_jni(_jenv, _jinput, (::smoke::Season*)nullptr))
        : ::gluecodium::optional<::smoke::Season>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Season", com_example_smoke_Season, ::smoke::Season)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Season _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Season>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::Season::WINTER):
            enumeratorName = "WINTER";
            break;
        case(::smoke::Season::SPRING):
            enumeratorName = "SPRING";
            break;
        case(::smoke::Season::SUMMER):
            enumeratorName = "SUMMER";
            break;
        case(::smoke::Season::AUTUMN):
            enumeratorName = "AUTUMN";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/Season;");
    auto _jresult = make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_SeasonConverterType>::java_class;
    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/smoke/Season;)Ljava/lang/String;");
    if (convertMethodId == NULL) {
        throw_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/smoke/Season;)Ljava/lang/String;' not found.");
        return {};
    }
    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Season> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
