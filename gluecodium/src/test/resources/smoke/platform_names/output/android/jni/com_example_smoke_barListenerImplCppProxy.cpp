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

com_example_smoke_barListener_CppProxy::com_example_smoke_barListener_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_barListener") {
}

void
com_example_smoke_barListener_CppProxy::FooMethod( const ::std::string& nBarParameter ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jBarParameter = convert_to_jni( jniEnv, nBarParameter );
    callJavaMethod<void>( "BarMethod", "(Ljava/lang/String;)V", jniEnv , jBarParameter);

    checkExceptionAndReportIfAny(jniEnv);



}

}
}
