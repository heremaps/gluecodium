/*
 *
 */
#include "com_example_smoke_OuterStruct_InnerEnum__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::OuterStruct::InnerEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::OuterStruct::InnerEnum*)
{
    return ::smoke::OuterStruct::InnerEnum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
std::optional<::smoke::OuterStruct::InnerEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::OuterStruct::InnerEnum>*)
{
    return _jinput
        ? std::optional<::smoke::OuterStruct::InnerEnum>(convert_from_jni(_jenv, _jinput, (::smoke::OuterStruct::InnerEnum*)nullptr))
        : std::optional<::smoke::OuterStruct::InnerEnum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterStruct$InnerEnum", com_example_smoke_OuterStruct_00024InnerEnum, ::smoke::OuterStruct::InnerEnum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::OuterStruct::InnerEnum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::OuterStruct::InnerEnum::FOO):
            enumeratorName = "FOO";
            break;
        case(::smoke::OuterStruct::InnerEnum::BAR):
            enumeratorName = "BAR";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/OuterStruct$InnerEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::OuterStruct::InnerEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
