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

com_example_smoke_SkipTagsInJava_CppProxy::com_example_smoke_SkipTagsInJava_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_SkipTagsInJava") {
}

void
com_example_smoke_SkipTagsInJava_CppProxy::skip_tagged(  ) {

    

}

void
com_example_smoke_SkipTagsInJava_CppProxy::dont_skip_tagged(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "dontSkipTagged", "()V", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);



}

void
com_example_smoke_SkipTagsInJava_CppProxy::skip_tagged_list(  ) {

    

}

}
}
