#include "EnumConversion.h"

namespace genium {
namespace jni {
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::smoke::ExternalInterface::some_Enum& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::smoke::ExternalInterface::some_Enum( enumValue );
    }
    jobject convert_to_jni( JNIEnv* _jenv, const ::smoke::ExternalInterface::some_Enum _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/ExternalInterface$SomeEnum" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::smoke::ExternalInterface::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/ExternalInterface$SomeEnum;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }
    void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, ::fire::Baz::some_Enum& _nout )    {
        jclass javaClass = _jenv->GetObjectClass(_jinput);
        jint enumValue = genium::jni::get_int_field(_jenv,javaClass, _jinput, "value" );
        _nout = ::fire::Baz::some_Enum( enumValue );
    }
    jobject convert_to_jni( JNIEnv* _jenv, const ::fire::Baz::some_Enum _ninput )    {
        auto javaClass = _jenv->FindClass( "com/example/smoke/VeryExternalInterface$SomeEnum" );
        ::std::string enumeratorName;
        switch(_ninput) {
            case(::fire::Baz::some_Enum::some_Value):
            enumeratorName = "SOME_VALUE";
            break;
    }
        jfieldID fieldID = _jenv->GetStaticFieldID(javaClass , enumeratorName.c_str(), "Lcom/example/smoke/VeryExternalInterface$SomeEnum;");
        jobject jResult = _jenv->GetStaticObjectField(javaClass, fieldID);
        _jenv->DeleteLocalRef( javaClass );
        return jResult;
    }
}
}
