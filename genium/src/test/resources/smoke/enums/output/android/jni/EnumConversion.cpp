#include "EnumConversion.h"

namespace genium {
namespace jni {

    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::SimpleEnum& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::smoke::Enums::SimpleEnum( enumValue );
    }

    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/Enums$SimpleEnum" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::smoke::Enums::SimpleEnum::FIRST):
            enumeratorName = "FIRST";
            break;
        case(::smoke::Enums::SimpleEnum::SECOND):
            enumeratorName = "SECOND";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/Enums$SimpleEnum;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }

    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::Enums::InternalError& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::smoke::Enums::InternalError( enumValue );
    }

    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/Enums$InternalError" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::smoke::Enums::InternalError::ERROR_NONE):
            enumeratorName = "ERROR_NONE";
            break;
        case(::smoke::Enums::InternalError::ERROR_FATAL):
            enumeratorName = "ERROR_FATAL";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/Enums$InternalError;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }

    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::SomeVeryExternalEnum& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::fire::SomeVeryExternalEnum( enumValue );
    }

    jobject convert_to_jni( JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/Enums$ExternalEnum" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::fire::SomeVeryExternalEnum::Foo_Value):
            enumeratorName = "FOO_VALUE";
            break;
        case(::fire::SomeVeryExternalEnum::Bar_Value):
            enumeratorName = "BAR_VALUE";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/Enums$ExternalEnum;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }

    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::TCEnum& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::smoke::TCEnum( enumValue );
    }

    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::TCEnum _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/TCEnum" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::smoke::TCEnum::FIRST):
            enumeratorName = "FIRST";
            break;
        case(::smoke::TCEnum::SECOND):
            enumeratorName = "SECOND";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/TCEnum;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }
}
}
