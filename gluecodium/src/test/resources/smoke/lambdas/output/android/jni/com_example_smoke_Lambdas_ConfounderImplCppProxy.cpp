/*
 *
 */
#include "com_example_smoke_Lambdas_ConfounderImplCppProxy.h"
#include "com_example_smoke_Lambdas_Confounder__Conversion.h"
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_Lambdas_00024Confounder_CppProxy::com_example_smoke_Lambdas_00024Confounder_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_Lambdas_00024Confounder" ) {
}
::smoke::Lambdas::Producer
com_example_smoke_Lambdas_00024Confounder_CppProxy::operator()( const ::std::string& np0 ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jp0 = convert_to_jni( jniEnv, np0 );
    auto _result = callJavaMethod<jobject>( "confuse", "(Ljava/lang/String;)Lcom/example/smoke/Lambdas$Producer;", jniEnv , jp0);
    checkExceptionAndReportIfAny(jniEnv);
    return com_example_smoke_Lambdas_00024Producer_convert_from_jni( jniEnv, _result, (::smoke::Lambdas::Producer*)nullptr );
}
}
}