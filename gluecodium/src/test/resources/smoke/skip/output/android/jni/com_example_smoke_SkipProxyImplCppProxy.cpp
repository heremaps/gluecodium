/*
 *
 */
#include "com_example_smoke_SkipProxyImplCppProxy.h"
#include "com_example_smoke_SkipProxy__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_SkipProxy_CppProxy::com_example_smoke_SkipProxy_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_SkipProxy" ) {
}
::std::string
com_example_smoke_SkipProxy_CppProxy::not_in_java( const ::std::string& ninput ) {
    return {};
}
bool
com_example_smoke_SkipProxy_CppProxy::not_in_swift( const bool ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jboolean jinput = ninput;
    auto _result = callJavaMethod<jboolean>( "notInSwift", "(Z)Z", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return _result;
}
float
com_example_smoke_SkipProxy_CppProxy::not_in_dart( const float ninput ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jfloat jinput = ninput;
    auto _result = callJavaMethod<jfloat>( "notInDart", "(F)F", jniEnv , jinput);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return _result;
}
::std::string
com_example_smoke_SkipProxy_CppProxy::get_skipped_in_java(  ) const {
    return {};
}
void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_java( const ::std::string& nvalue ) {
}
bool
com_example_smoke_SkipProxy_CppProxy::is_skipped_in_swift(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jboolean>( "isSkippedInSwift", "()Z", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return _result;
}
void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_swift( const bool nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jboolean jvalue = nvalue;
    callJavaMethod<void>( "setSkippedInSwift", "(Z)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
float
com_example_smoke_SkipProxy_CppProxy::get_skipped_in_dart(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jfloat>( "getSkippedInDart", "()F", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
    return _result;
}
void
com_example_smoke_SkipProxy_CppProxy::set_skipped_in_dart( const float nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jfloat jvalue = nvalue;
    callJavaMethod<void>( "setSkippedInDart", "(F)V", jniEnv , jvalue);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
::smoke::SkippedEverywhere
com_example_smoke_SkipProxy_CppProxy::get_skipped_everywhere(  ) const {
    return {};
}
void
com_example_smoke_SkipProxy_CppProxy::set_skipped_everywhere( const ::smoke::SkippedEverywhere& nvalue ) {
}
}
}
