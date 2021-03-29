/*
 *
 */
#include "com_example_smoke_Lambdas_IndexerImplCppProxy.h"
#include "com_example_smoke_Lambdas_Indexer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_Lambdas_00024Indexer_CppProxy::com_example_smoke_Lambdas_00024Indexer_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_Lambdas_00024Indexer" ) {
}
int32_t
com_example_smoke_Lambdas_00024Indexer_CppProxy::operator()( const ::std::string& np0, const float nindex ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jp0 = convert_to_jni( jniEnv, np0 );
    jfloat jindex = nindex;
    auto result = callJavaMethod<jint>( "apply", "(Ljava/lang/String;F)I", jniEnv , jp0, jindex);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return result;
}
}
}
