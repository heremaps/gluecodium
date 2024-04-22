/*

 *
 */

#include "com_example_smoke_Lambdas_IndexerImplCppProxy.h"
#include "com_example_smoke_Lambdas_Indexer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_Lambdas_00024Indexer_CppProxy::com_example_smoke_Lambdas_00024Indexer_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_Lambdas_00024Indexer") {
}

int32_t
com_example_smoke_Lambdas_00024Indexer_CppProxy::operator()( const ::std::string& np0, const float nindex ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jp0 = convert_to_jni( jniEnv, np0 );
    jfloat jindex = nindex;
    auto _result = callJavaMethod<jint>( "apply", "(Ljava/lang/String;F)I", jniEnv , jp0, jindex);

    checkExceptionAndReportIfAny(jniEnv);

    return _result;



}

}
}
