#include "android/jni/com_example_smoke_InheritanceChildImplCppProxy.h"
#include "android/jni/InstanceConversion.h"
#include "android/jni/StructConversion.h"
#include "android/jni/ArrayConversionUtils.h"
#include "android/jni/EnumConversion.h"

namespace smoke {

using namespace ::here::internal;
InheritanceChildCppProxy::InheritanceChildCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )
    : CppProxyBase( _jenv, _jobj, _jHashCode ) {
}

void InheritanceChildCppProxy::root_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "rootMethod", "()V", jniEnv  );
}

::std::string InheritanceChildCppProxy::get_root_attribute(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "getRootAttribute", "()Ljava/lang/String;", jniEnv  );
}

void InheritanceChildCppProxy::set_root_attribute( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = ::here::internal::convert_to_jni( jniEnv, nvalue );
    callJavaMethod( "setRootAttribute", "(Ljava/lang/String;)V", jniEnv , jvalue);
}

void InheritanceChildCppProxy::child_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "childMethod", "()V", jniEnv  );
}

}
