/*
 *
 */
#include "com_example_smoke_Enums_SimpleEnum__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Enums::SimpleEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum*)
{
    return ::smoke::Enums::SimpleEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
std::optional<::smoke::Enums::SimpleEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Enums::SimpleEnum>*)
{
    return _jinput
        ? std::optional<::smoke::Enums::SimpleEnum>(convert_from_jni(_jenv, _jinput, (::smoke::Enums::SimpleEnum*)nullptr))
        : std::optional<::smoke::Enums::SimpleEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Enums$SimpleEnum", com_example_smoke_Enums_00024SimpleEnum, ::smoke::Enums::SimpleEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Enums::SimpleEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::Enums::SimpleEnum::FIRST):
            enumeratorName = "FIRST";
            break;
        case(::smoke::Enums::SimpleEnum::SECOND):
            enumeratorName = "SECOND";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/Enums$SimpleEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Enums::SimpleEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
