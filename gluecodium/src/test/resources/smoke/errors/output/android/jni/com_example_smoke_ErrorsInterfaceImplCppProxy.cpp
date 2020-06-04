/*
 *
 */
#include "com_example_smoke_ErrorsInterfaceImplCppProxy.h"
#include "com_example_smoke_ErrorsInterface_ExternalErrors__Conversion.h"
#include "com_example_smoke_ErrorsInterface_InternalError__Conversion.h"
#include "com_example_smoke_ErrorsInterface__Conversion.h"
#include "com_example_smoke_Payload__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_ErrorsInterfaceImpl_CppProxy::com_example_smoke_ErrorsInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_ErrorsInterfaceImpl" ) {
}
::std::error_code
com_example_smoke_ErrorsInterfaceImpl_CppProxy::method_with_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithErrors", "()V", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jErrorValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nErrorValue = convert_from_jni(
            jniEnv,
            jErrorValue,
            (::smoke::ErrorsInterface::InternalError*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nErrorValue};
    }
    else
    {
        return ::std::error_code{};
    }
}
::std::error_code
com_example_smoke_ErrorsInterfaceImpl_CppProxy::method_with_external_errors(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithExternalErrors", "()V", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jErrorValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$ExternalErrors;" );
        auto nErrorValue = convert_from_jni(
            jniEnv,
            jErrorValue,
            (::smoke::ErrorsInterface::ExternalErrors*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nErrorValue};
    }
    else
    {
        return ::std::error_code{};
    }
}
::gluecodium::Return< ::std::string, ::std::error_code >
com_example_smoke_ErrorsInterfaceImpl_CppProxy::method_with_errors_and_return_value(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "methodWithErrorsAndReturnValue", "()Ljava/lang/String;", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jErrorValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/ErrorsInterface$InternalError;" );
        auto nErrorValue = convert_from_jni(
            jniEnv,
            jErrorValue,
            (::smoke::ErrorsInterface::InternalError*)nullptr );
        jniEnv->ExceptionClear( );
        return ::std::error_code{nErrorValue};
    }
    else
    {
    return convert_from_jni( jniEnv, result, (::gluecodium::Return< ::std::string, ::std::error_code >::value_type*)nullptr );
    }
}
::gluecodium::Return< void, ::smoke::Payload >
com_example_smoke_ErrorsInterfaceImpl_CppProxy::method_with_payload_error(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "methodWithPayloadError", "()V", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jErrorValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/Payload;" );
        auto nErrorValue = convert_from_jni(
            jniEnv,
            jErrorValue,
            (::smoke::Payload*)nullptr );
        jniEnv->ExceptionClear( );
        return ::smoke::Payload{nErrorValue};
    }
    else
    {
        return {true};
    }
}
::gluecodium::Return< ::std::string, ::smoke::Payload >
com_example_smoke_ErrorsInterfaceImpl_CppProxy::method_with_payload_error_and_return_value(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "methodWithPayloadErrorAndReturnValue", "()Ljava/lang/String;", jniEnv  );
    auto jException = make_local_ref<jobject>(jniEnv, jniEnv->ExceptionOccurred( ));
    if ( jException )
    {
        auto jErrorValue = get_object_field_value(
            jniEnv,
            jException,
            "error",
            "Lcom/example/smoke/Payload;" );
        auto nErrorValue = convert_from_jni(
            jniEnv,
            jErrorValue,
            (::smoke::Payload*)nullptr );
        jniEnv->ExceptionClear( );
        return ::smoke::Payload{nErrorValue};
    }
    else
    {
    return convert_from_jni( jniEnv, result, (::gluecodium::Return< ::std::string, ::smoke::Payload >::value_type*)nullptr );
    }
}
}
}
