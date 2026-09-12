/*

 *
 */

#include "com_example_smoke_ChildInterfaceImplCppProxy.h"
#include "com_example_smoke_ChildInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_ChildInterface_CppProxy::com_example_smoke_ChildInterface_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_ChildInterface") {
}

void
com_example_smoke_ChildInterface_CppProxy::root_method(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "rootMethod", "()V", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);



}


::std::string
com_example_smoke_ChildInterface_CppProxy::get_root_property(  ) const {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto _result = callJavaMethod<jstring>( "getRootProperty", "()Ljava/lang/String;", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);

    return convert_from_jni( jniEnv, _result, TypeId<::std::string>{});



}



void
com_example_smoke_ChildInterface_CppProxy::set_root_property( const ::std::string& nvalue ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setRootProperty", "(Ljava/lang/String;)V", jniEnv , jvalue);

    checkExceptionAndReportIfAny(jniEnv);



}


void
com_example_smoke_ChildInterface_CppProxy::child_method(  ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "childMethod", "()V", jniEnv  );

    checkExceptionAndReportIfAny(jniEnv);



}

}
}
