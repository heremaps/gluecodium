/*
 *
 */
#include "com_example_smoke_Enums_ExternalEnum__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::Enums::External_Enum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum*)
{
    return ::smoke::Enums::External_Enum(
        ::gluecodium::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
std::optional<::smoke::Enums::External_Enum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Enums::External_Enum>*)
{
    return _jinput
        ? std::optional<::smoke::Enums::External_Enum>(convert_from_jni(_jenv, _jinput, (::smoke::Enums::External_Enum*)nullptr))
        : std::optional<::smoke::Enums::External_Enum>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Enums$ExternalEnum", com_example_smoke_Enums_00024ExternalEnum, ::smoke::Enums::External_Enum)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Enums::External_Enum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::Enums::External_Enum::Foo_Value):
            enumeratorName = "FOO_VALUE";
            break;
        case(::smoke::Enums::External_Enum::Bar_Value):
            enumeratorName = "BAR_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/Enums$ExternalEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Enums::External_Enum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
