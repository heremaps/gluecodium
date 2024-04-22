/*

 *
 */

#include "com_example_smoke_Lambdas_ProducerImplCppProxy.h"
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_Lambdas_00024Producer_CppProxy::com_example_smoke_Lambdas_00024Producer_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_Lambdas_00024Producer") {
}

::std::string
com_example_smoke_Lambdas_00024Producer_CppProxy::operator()(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "apply", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );



}

}
}
