/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "root/space/smoke/Basic.h"
#include "com_example_smoke_Basic.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniReference.h"
extern "C" {
jstring
Java_com_example_smoke_Basic_basicMethod(JNIEnv* _jenv, jobject _jinstance, jstring jinputString)
{
    ::std::string inputString = genium::jni::convert_from_jni( _jenv, genium::jni::make_local_ref(_jenv, jinputString), (::std::string*)nullptr );
    auto result = ::root::space::smoke::Basic::basic_method(inputString);
    return genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Basic_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::root::space::smoke::Basic>*> (_jpointerRef);
}
}