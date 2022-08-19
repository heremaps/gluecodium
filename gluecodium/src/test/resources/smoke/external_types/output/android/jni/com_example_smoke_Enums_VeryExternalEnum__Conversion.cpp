/*
 *
 */
#include "com_example_smoke_Enums_VeryExternalEnum__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::fire::SomeVeryExternalEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum*)
{
    return ::fire::SomeVeryExternalEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
std::optional<::fire::SomeVeryExternalEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::fire::SomeVeryExternalEnum>*)
{
    return _jinput
        ? std::optional<::fire::SomeVeryExternalEnum>(convert_from_jni(_jenv, _jinput, (::fire::SomeVeryExternalEnum*)nullptr))
        : std::optional<::fire::SomeVeryExternalEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Enums$VeryExternalEnum", com_example_smoke_Enums_00024VeryExternalEnum, ::fire::SomeVeryExternalEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::SomeVeryExternalEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::fire::SomeVeryExternalEnum::FOO):
            enumeratorName = "FOO";
            break;
        case(::fire::SomeVeryExternalEnum::BAR):
            enumeratorName = "BAR";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/Enums$VeryExternalEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::fire::SomeVeryExternalEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
