#include "EnumConversion.h"
namespace genium
{
namespace jni
{
::smoke::Enums::SimpleEnum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum* dummy )
{
    return ::smoke::Enums::SimpleEnum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Enums$SimpleEnum" );
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
::smoke::Enums::InternalError
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::InternalError* dummy )
{
    return ::smoke::Enums::InternalError( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Enums$InternalError" );
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
::smoke::Enums::External_Enum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum* dummy )
{
    return ::smoke::Enums::External_Enum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Enums$ExternalEnum" );
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
::fire::SomeVeryExternalEnum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum* dummy )
{
    return ::fire::SomeVeryExternalEnum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Enums$VeryExternalEnum" );
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
::smoke::TCEnum
convert_from_jni( JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::TCEnum* dummy )
{
    return ::smoke::TCEnum( genium::jni::get_int_field(_jenv, _jinput, "value" ) );
}
JniReference<jobject>
convert_to_jni( JNIEnv* _jenv, const ::smoke::TCEnum _ninput )
{
    auto javaClass = find_class(_jenv, "com/example/smoke/TCEnum" );
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
}
}
