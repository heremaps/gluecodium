/*
 *
 */
#include "com_example_smoke_SkipTagsInJavaImplCppProxy.h"
#include "com_example_smoke_SkipTagsInJava__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_SkipTagsInJava_CppProxy::com_example_smoke_SkipTagsInJava_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_SkipTagsInJava" ) {
}
void
com_example_smoke_SkipTagsInJava_CppProxy::skip_tagged(  ) {
}
void
com_example_smoke_SkipTagsInJava_CppProxy::dont_skip_tagged(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "dontSkipTagged", "()V", jniEnv  );
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_SkipTagsInJava_CppProxy::skip_tagged_list(  ) {
}
}
}
