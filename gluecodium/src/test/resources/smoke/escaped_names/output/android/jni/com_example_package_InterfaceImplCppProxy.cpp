/*
 *
 */
#include "com_example_package_InterfaceImplCppProxy.h"
#include "com_example_package_Interface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_package_InterfaceImpl_CppProxy::com_example_package_InterfaceImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode ) {
}
}
}
