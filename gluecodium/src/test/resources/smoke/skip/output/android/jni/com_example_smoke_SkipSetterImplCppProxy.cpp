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

com_example_smoke_SkipSetter_CppProxy::com_example_smoke_SkipSetter_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_SkipSetter") {
}


::std::string
com_example_smoke_SkipSetter_CppProxy::get_foo(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getFoo", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );



}



void
com_example_smoke_SkipSetter_CppProxy::set_foo( const ::std::string& nvalue ) {

    

}


}
}
