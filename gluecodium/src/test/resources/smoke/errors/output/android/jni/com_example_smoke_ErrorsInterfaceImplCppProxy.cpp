/*
 *
 */
#include "com_example_smoke_ErrorsInterfaceImplCppProxy.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
namespace gluecodium
{
namespace jni
{
ErrorsInterfaceImpl_CppProxy::ErrorsInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
::std::error_code ErrorsInterfaceImpl_CppProxy::method_with_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithErrors", "()V", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nEnumValue = convert_from_jni(
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
::std::error_code ErrorsInterfaceImpl_CppProxy::method_with_external_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithExternalErrors", "()V", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$ExternalErrors;" );
        auto nEnumValue = convert_from_jni(
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
::gluecodium::Return< ::std::string, ::std::error_code > ErrorsInterfaceImpl_CppProxy::method_with_errors_and_return_value(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "methodWithErrorsAndReturnValue", "()Ljava/lang/String;", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jEnumValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nEnumValue = convert_from_jni(
            jniEnv,
            jEnumValue,
            (::smoke::ErrorsInterface::InternalError*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nEnumValue};
    }
    else
    {
    return convert_from_jni( jniEnv, result, (::gluecodium::Return< ::std::string, ::std::error_code >::value_type*)nullptr );
    }
}
}
}
