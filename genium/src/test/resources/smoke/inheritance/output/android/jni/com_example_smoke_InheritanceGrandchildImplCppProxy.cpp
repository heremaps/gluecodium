#include "com_example_smoke_InheritanceGrandchildImplCppProxy.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
namespace smoke {
using namespace ::genium::jni;
InheritanceGrandchildCppProxy::InheritanceGrandchildCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )
    : CppProxyBase( _jenv, _jobj, _jHashCode ) {
}
void InheritanceGrandchildCppProxy::root_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "rootMethod", "()V", jniEnv  );
}
::std::string InheritanceGrandchildCppProxy::get_root_attribute(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "getRootAttribute", "()Ljava/lang/String;", jniEnv  );
}
void InheritanceGrandchildCppProxy::set_root_attribute( const ::std::string& nvalue ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jvalue = convert_to_jni( jniEnv, nvalue );
    callJavaMethod( "setRootAttribute", "(Ljava/lang/String;)V", jniEnv , jvalue);
}
void InheritanceGrandchildCppProxy::child_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "childMethod", "()V", jniEnv  );
}
void InheritanceGrandchildCppProxy::grandchild_method(  ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    callJavaMethod( "grandchildMethod", "()V", jniEnv  );
}
}