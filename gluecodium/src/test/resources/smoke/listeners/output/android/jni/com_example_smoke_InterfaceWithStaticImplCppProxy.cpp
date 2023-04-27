/*
 *
 */
#include "com_example_smoke_InterfaceWithStaticImplCppProxy.h"
#include "com_example_smoke_InterfaceWithStatic__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_InterfaceWithStatic_CppProxy::com_example_smoke_InterfaceWithStatic_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_InterfaceWithStatic" ) {
}
::std::string
com_example_smoke_InterfaceWithStatic_CppProxy::regular_function(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "regularFunction", "()Ljava/lang/String;", jniEnv  );
    checkExceptionAndReportIfAny(jniEnv);
    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );
}
::std::string
com_example_smoke_InterfaceWithStatic_CppProxy::get_regular_property(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getRegularProperty", "()Ljava/lang/String;", jniEnv  );
    checkExceptionAndReportIfAny(jniEnv);
    return convert_from_jni( jniEnv, _result, (::std::string*)nullptr );
}
void
com_example_smoke_InterfaceWithStatic_CppProxy::set_regular_property( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setRegularProperty", "(Ljava/lang/String;)V", jniEnv , jvalue);
    checkExceptionAndReportIfAny(jniEnv);
}
}
}