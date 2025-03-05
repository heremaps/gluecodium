/*

 *
 */

#include "com_example_namerules_NAME_RULES_KT_EXAMPLE_ERROR_CODE_KT__Conversion.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace jni
{

::namerules::NameRules::ExampleErrorCode
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::namerules::NameRules::ExampleErrorCode>)
{
    return ::namerules::NameRules::ExampleErrorCode(
        ::jni::get_field_value(_jenv, _jinput, "value", TypeId<int32_t>{}));
}

std::optional<::namerules::NameRules::ExampleErrorCode>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::namerules::NameRules::ExampleErrorCode>>)
{
    return _jinput
        ? std::optional<::namerules::NameRules::ExampleErrorCode>(convert_from_jni(_jenv, _jinput, TypeId<::namerules::NameRules::ExampleErrorCode>{}))
        : std::optional<::namerules::NameRules::ExampleErrorCode>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/namerules/NAME_RULES_KT$EXAMPLE_ERROR_CODE_KT", com_example_namerules_NAME_1RULES_1KT_00024EXAMPLE_1ERROR_1CODE_1KT, ::namerules::NameRules::ExampleErrorCode)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleErrorCode _ninput)
{
    auto& javaClass = CachedJavaClass<::namerules::NameRules::ExampleErrorCode>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::namerules::NameRules::ExampleErrorCode::NONE):
            enumeratorName = "NONE";
            break;
        case(::namerules::NameRules::ExampleErrorCode::FATAL):
            enumeratorName = "FATAL";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/namerules/NAME_RULES_KT$EXAMPLE_ERROR_CODE_KT;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::namerules::NameRules::ExampleErrorCode> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
