/*
 *
 */
#include "com_example_smoke_barListenerImplCppProxy.h"
#include "com_example_smoke_barListener__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_barListenerImpl_CppProxy::com_example_smoke_barListenerImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_barListenerImpl" ) {
}
void
com_example_smoke_barListenerImpl_CppProxy::FooMethod( const ::std::string& nBarParameter ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jBarParameter = convert_to_jni( jniEnv, nBarParameter );
    callJavaMethod<void>( "BarMethod", "(Ljava/lang/String;)V", jniEnv , jBarParameter);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->FatalError( "Unhandled exception" );
    }
}
}
}
