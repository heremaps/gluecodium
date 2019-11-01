/*
 *
 */
#include "com_example_smoke_Lambdas_ConfuserImplCppProxy.h"
#include "com_example_smoke_Lambdas_Confuser__Conversion.h"
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
Lambdas_00024ConfuserImpl_CppProxy::Lambdas_00024ConfuserImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
::smoke::Lambdas::Producer Lambdas_00024ConfuserImpl_CppProxy::operator()( const ::std::string& np0 ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jp0 = convert_to_jni( jniEnv, np0 );
    auto result = callJavaMethod<jobject>( "confuse", "(Ljava/lang/String;)Lcom/example/smoke/Lambdas$Producer;", jniEnv , jp0);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
    return convert_from_jni( jniEnv, result, (::smoke::Lambdas::Producer*)nullptr );
}
}
}
