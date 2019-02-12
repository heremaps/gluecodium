#include "EnumConversion.h"
#include "JniClassCache.h"
namespace genium
{
namespace jni
{
::smoke::ExternalInterface::some_Enum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ExternalInterface::some_Enum* dummy)
{
    return ::smoke::ExternalInterface::some_Enum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::smoke::ExternalInterface::some_Enum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::ExternalInterface::some_Enum>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::ExternalInterface::some_Enum>(convert_from_jni(_jenv, _jinput, (::smoke::ExternalInterface::some_Enum*)nullptr))
        : std::shared_ptr<::smoke::ExternalInterface::some_Enum>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::ExternalInterface::some_Enum, "com/example/smoke/ExternalInterface$SomeEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Enum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::ExternalInterface::some_Enum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::smoke::ExternalInterface::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/ExternalInterface$SomeEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ExternalInterface::some_Enum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::Baz::some_Enum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::Baz::some_Enum* dummy)
{
    return ::fire::Baz::some_Enum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::fire::Baz::some_Enum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::Baz::some_Enum>* dummy)
{
    return _jinput
        ? std::make_shared<::fire::Baz::some_Enum>(convert_from_jni(_jenv, _jinput, (::fire::Baz::some_Enum*)nullptr))
        : std::shared_ptr<::fire::Baz::some_Enum>{};
}
REGISTER_JNI_CLASS_CACHE(::fire::Baz::some_Enum, "com/example/smoke/VeryExternalInterface$SomeEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::Baz::some_Enum _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::Baz::some_Enum>::java_class;
    const char* enumeratorName = nullptr;
    switch(_ninput) {
        case(::fire::Baz::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName, "Lcom/example/smoke/VeryExternalInterface$SomeEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::Baz::some_Enum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
