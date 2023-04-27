/*
 *
 */
#include "com_example_smoke_EnableTagsInJavaImplCppProxy.h"
#include "com_example_smoke_EnableTagsInJava__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_EnableTagsInJava_CppProxy::com_example_smoke_EnableTagsInJava_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_EnableTagsInJava" ) {
}
void
com_example_smoke_EnableTagsInJava_CppProxy::enable_tagged(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "enableTagged", "()V", jniEnv  );
    checkExceptionAndReportIfAny(jniEnv);
}
void
com_example_smoke_EnableTagsInJava_CppProxy::dont_enable_tagged(  ) {
}
void
com_example_smoke_EnableTagsInJava_CppProxy::enable_tagged_list(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "enableTaggedList", "()V", jniEnv  );
    checkExceptionAndReportIfAny(jniEnv);
}
}
}