/*
 *
 */
#include "com_example_smoke_OuterStruct_InnerLambdaImplCppProxy.h"
#include "com_example_smoke_OuterStruct_InnerLambda__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_OuterStruct_00024InnerLambda_CppProxy::com_example_smoke_OuterStruct_00024InnerLambda_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_OuterStruct_00024InnerLambda" ) {
}
void
com_example_smoke_OuterStruct_00024InnerLambda_CppProxy::operator()(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "apply", "()V", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
}
}
