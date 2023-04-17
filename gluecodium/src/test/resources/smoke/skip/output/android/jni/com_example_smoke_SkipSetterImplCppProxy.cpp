/*
 *
 */
#include "com_example_smoke_SkipSetterImplCppProxy.h"
#include "com_example_smoke_SkipSetter__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_SkipSetter_CppProxy::com_example_smoke_SkipSetter_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_SkipSetter" ) {
}
::std::string
com_example_smoke_SkipSetter_CppProxy::get_foo(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getFoo", "()Ljava/lang/String;", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );
}
void
com_example_smoke_SkipSetter_CppProxy::set_foo( const ::std::string& nvalue ) {
}
}
}
