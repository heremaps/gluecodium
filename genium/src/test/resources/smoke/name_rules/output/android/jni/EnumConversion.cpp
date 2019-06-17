#include "EnumConversion.h"
#include "JniClassCache.h"
namespace jni
{
::namerules::NameRules::ExampleError
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::namerules::NameRules::ExampleError* dummy)
{
    return ::namerules::NameRules::ExampleError(
        ::jni::get_field_value(_jenv, _jinput, "value", (int32_t*)nullptr));
}
::optional<::namerules::NameRules::ExampleError>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::optional<::namerules::NameRules::ExampleError>* dummy)
{
    return _jinput
        ? ::optional<::namerules::NameRules::ExampleError>(convert_from_jni(_jenv, _jinput, (::namerules::NameRules::ExampleError*)nullptr))
        : ::optional<::namerules::NameRules::ExampleError>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/namerules/NAME_RULES_DROID$EXAMPLE_ERROR_DROID", ::namerules::NameRules::ExampleError)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleError _ninput)
{
    auto& javaClass = CachedJavaClass<::namerules::NameRules::ExampleError>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::namerules::NameRules::ExampleError::NONE):
            enumeratorName = "NONE";
            break;
        case(::namerules::NameRules::ExampleError::FATAL):
            enumeratorName = "FATAL";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/namerules/NAME_RULES_DROID$EXAMPLE_ERROR_DROID;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::optional<::namerules::NameRules::ExampleError> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}