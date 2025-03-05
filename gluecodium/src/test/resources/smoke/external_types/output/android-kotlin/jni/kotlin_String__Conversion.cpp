/*

 *
 */

#include "kotlin_String__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{
namespace
{
struct Dummycom_here_android_test_SeasonConverterType final {};
}

REGISTER_JNI_CLASS_CACHE("com/here/android/test/SeasonConverter", com_here_android_test_SeasonConverter, Dummycom_here_android_test_SeasonConverterType)

::kotlin_smoke::Season
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput_ext, TypeId<::kotlin_smoke::Season>)
{
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_SeasonConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertToInternal", "(Ljava/lang/String;)Lcom/example/kotlinsmoke/Season;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertToInternal(Ljava/lang/String;)Lcom/example/kotlinsmoke/Season;' not found.");
        return {};
    }

    auto _jinput = make_local_ref(
        _jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jinput_ext.get()));
    return ::kotlin_smoke::Season(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", TypeId<int32_t>{}));
}

std::optional<::kotlin_smoke::Season>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::Season>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::Season>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::Season>{}))
        : std::optional<::kotlin_smoke::Season>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/Season", com_example_kotlinsmoke_Season, ::kotlin_smoke::Season)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::Season _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::Season>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::kotlin_smoke::Season::WINTER):
            enumeratorName = "WINTER";
            break;
        case(::kotlin_smoke::Season::SPRING):
            enumeratorName = "SPRING";
            break;
        case(::kotlin_smoke::Season::SUMMER):
            enumeratorName = "SUMMER";
            break;
        case(::kotlin_smoke::Season::AUTUMN):
            enumeratorName = "AUTUMN";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/kotlinsmoke/Season;");
    auto _jresult = make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
    auto& converterClass = CachedJavaClass<Dummycom_here_android_test_SeasonConverterType>::java_class;

    auto convertMethodId = _jenv->GetStaticMethodID(
        converterClass.get(), "convertFromInternal", "(Lcom/example/kotlinsmoke/Season;)Ljava/lang/String;");
    if (convertMethodId == NULL) {
        throw_new_runtime_exception(_jenv, "Static method 'convertFromInternal(Lcom/example/kotlinsmoke/Season;)Ljava/lang/String;' not found.");
        return {};
    }

    _jresult = make_local_ref(_jenv, _jenv->CallStaticObjectMethod(converterClass.get(), convertMethodId, _jresult.get()));
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::Season> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
