#include "com_example_smoke_InheritanceChildImplCppProxy.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
namespace smoke {
using namespace ::genium::jni;
InheritanceChildCppProxy::InheritanceChildCppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
void InheritanceChildCppProxy::root_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "rootMethod", "()V", jniEnv  );
}
::std::string InheritanceChildCppProxy::get_root_attribute(  ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto result = callJavaMethod<jstring>( "getRootAttribute", "()Ljava/lang/String;", jniEnv  );
    return ::genium::jni::convert_from_jni( jniEnv, result, (::std::string*)nullptr );
}
void InheritanceChildCppProxy::set_root_attribute( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod<void>( "setRootAttribute", "(Ljava/lang/String;)V", jniEnv , jvalue);
}
void InheritanceChildCppProxy::child_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod<void>( "childMethod", "()V", jniEnv  );
}
}
