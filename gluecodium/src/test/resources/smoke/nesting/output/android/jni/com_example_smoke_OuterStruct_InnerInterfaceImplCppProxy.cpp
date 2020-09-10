/*
 *
 */
#include "com_example_smoke_OuterStruct_InnerInterfaceImplCppProxy.h"
#include "com_example_smoke_OuterStruct_InnerInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_OuterStruct_00024InnerInterfaceImpl_CppProxy::com_example_smoke_OuterStruct_00024InnerInterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_OuterStruct_00024InnerInterfaceImpl" ) {
}
void
com_example_smoke_OuterStruct_00024InnerInterfaceImpl_CppProxy::bar_baz(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "barBaz", "()V", jniEnv  );
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
