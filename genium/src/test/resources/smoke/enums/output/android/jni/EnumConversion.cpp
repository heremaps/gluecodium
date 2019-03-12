#include "EnumConversion.h"
#include "JniClassCache.h"
namespace genium
{
namespace jni
{
::smoke::Enums::SimpleEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum* dummy)
{
    return ::smoke::Enums::SimpleEnum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::smoke::Enums::SimpleEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::SimpleEnum>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Enums::SimpleEnum>(convert_from_jni(_jenv, _jinput, (::smoke::Enums::SimpleEnum*)nullptr))
        : std::shared_ptr<::smoke::Enums::SimpleEnum>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Enums::SimpleEnum, "com/example/smoke/Enums$SimpleEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Enums::SimpleEnum>::java_class;
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::smoke::Enums::SimpleEnum::FIRST):
            enumeratorName = "FIRST";
            break;
        case(::smoke::Enums::SimpleEnum::SECOND):
            enumeratorName = "SECOND";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/Enums$SimpleEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::SimpleEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Enums::InternalError
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::InternalError* dummy)
{
    return ::smoke::Enums::InternalError(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::smoke::Enums::InternalError>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::InternalError>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Enums::InternalError>(convert_from_jni(_jenv, _jinput, (::smoke::Enums::InternalError*)nullptr))
        : std::shared_ptr<::smoke::Enums::InternalError>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Enums::InternalError, "com/example/smoke/Enums$InternalError")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Enums::InternalError>::java_class;
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::smoke::Enums::InternalError::ERROR_NONE):
            enumeratorName = "ERROR_NONE";
            break;
        case(::smoke::Enums::InternalError::ERROR_FATAL):
            enumeratorName = "ERROR_FATAL";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/Enums$InternalError;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::InternalError> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Enums::External_Enum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum* dummy)
{
    return ::smoke::Enums::External_Enum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::smoke::Enums::External_Enum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::External_Enum>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Enums::External_Enum>(convert_from_jni(_jenv, _jinput, (::smoke::Enums::External_Enum*)nullptr))
        : std::shared_ptr<::smoke::Enums::External_Enum>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::Enums::External_Enum, "com/example/smoke/Enums$ExternalEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Enums::External_Enum>::java_class;
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::smoke::Enums::External_Enum::Foo_Value):
            enumeratorName = "FOO_VALUE";
            break;
        case(::smoke::Enums::External_Enum::Bar_Value):
            enumeratorName = "BAR_VALUE";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/Enums$ExternalEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::External_Enum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::SomeVeryExternalEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum* dummy)
{
    return ::fire::SomeVeryExternalEnum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::fire::SomeVeryExternalEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::SomeVeryExternalEnum>* dummy)
{
    return _jinput
        ? std::make_shared<::fire::SomeVeryExternalEnum>(convert_from_jni(_jenv, _jinput, (::fire::SomeVeryExternalEnum*)nullptr))
        : std::shared_ptr<::fire::SomeVeryExternalEnum>{};
}
REGISTER_JNI_CLASS_CACHE(::fire::SomeVeryExternalEnum, "com/example/smoke/Enums$VeryExternalEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::SomeVeryExternalEnum>::java_class;
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::fire::SomeVeryExternalEnum::FOO):
            enumeratorName = "FOO";
            break;
        case(::fire::SomeVeryExternalEnum::BAR):
            enumeratorName = "BAR";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/Enums$VeryExternalEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::SomeVeryExternalEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::TCEnum
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::TCEnum* dummy)
{
    return ::smoke::TCEnum(genium::jni::get_int_field(_jenv, _jinput, "value"));
}
std::shared_ptr<::smoke::TCEnum>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::TCEnum>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::TCEnum>(convert_from_jni(_jenv, _jinput, (::smoke::TCEnum*)nullptr))
        : std::shared_ptr<::smoke::TCEnum>{};
}
REGISTER_JNI_CLASS_CACHE(::smoke::TCEnum, "com/example/smoke/TCEnum")
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::TCEnum _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::TCEnum>::java_class;
    ::std::string enumeratorName;
    switch(_ninput) {
        case(::smoke::TCEnum::FIRST):
            enumeratorName = "FIRST";
            break;
        case(::smoke::TCEnum::SECOND):
            enumeratorName = "SECOND";
            break;
    }
    jfieldID fieldID = _jenv->GetStaticFieldID(javaClass.get(), enumeratorName.c_str(), "Lcom/example/smoke/TCEnum;");
    return make_local_ref(_jenv, _jenv->GetStaticObjectField(javaClass.get(), fieldID));
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::TCEnum> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}