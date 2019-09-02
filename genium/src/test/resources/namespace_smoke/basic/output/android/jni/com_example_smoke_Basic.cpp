/*
 *

 */
#include "root/space/smoke/Basic.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Basic.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jstring
Java_com_example_smoke_Basic_basicMethod(JNIEnv* _jenv, jobject _jinstance, jstring jinputString)
{
    ::std::string inputString = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinputString),
            (::std::string*)nullptr);
    auto result = ::root::space::smoke::Basic::basic_method(inputString);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Basic_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::root::space::smoke::Basic>*> (_jpointerRef);
}
}
