#include "com_example_smoke_ErrorsInterfaceImplCppProxy.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
namespace smoke {
using namespace ::genium::jni;
ErrorsInterfaceCppProxy::ErrorsInterfaceCppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
::std::error_code ErrorsInterfaceCppProxy::method_with_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithErrors", "()V", jniEnv  );
    auto jException = ::genium::jni::make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = ::genium::jni::get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nEnumValue = ::genium::jni::convert_from_jni(
            jniEnv,
            jEnumValue,
            (::smoke::ErrorsInterface::InternalError*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nEnumValue};
    }
    else
    {
        return ::std::error_code{};
    }
}
::std::error_code ErrorsInterfaceCppProxy::method_with_external_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithExternalErrors", "()V", jniEnv  );
    auto jException = ::genium::jni::make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = ::genium::jni::get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$ExternalErrors;" );
        auto nEnumValue = ::genium::jni::convert_from_jni(
            jniEnv,
            jEnumValue,
            (::smoke::ErrorsInterface::ExternalErrors*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nEnumValue};
    }
    else
    {
        return ::std::error_code{};
    }
}
::genium::Return< ::std::string, ::std::error_code > ErrorsInterfaceCppProxy::method_with_errors_and_return_value(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "methodWithErrorsAndReturnValue", "()Ljava/lang/String;", jniEnv  );
    auto jException = ::genium::jni::make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = ::genium::jni::get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nEnumValue = ::genium::jni::convert_from_jni(
            jniEnv,
            jEnumValue,
            (::smoke::ErrorsInterface::InternalError*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nEnumValue};
    }
    else
    {
    return ::genium::jni::convert_from_jni( jniEnv, result, (::genium::Return< ::std::string, ::std::error_code >::value_type*)nullptr );
    }
}
}
