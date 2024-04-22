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

com_example_smoke_OuterStruct_00024InnerLambda_CppProxy::com_example_smoke_OuterStruct_00024InnerLambda_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_OuterStruct_00024InnerLambda") {
}

void
com_example_smoke_OuterStruct_00024InnerLambda_CppProxy::operator()(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "apply", "()V", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);



}

}
}
