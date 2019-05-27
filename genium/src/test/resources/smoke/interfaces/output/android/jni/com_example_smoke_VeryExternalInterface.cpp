/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "foo/Bar.h"
#include "com_example_smoke_VeryExternalInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
void
Java_com_example_smoke_VeryExternalInterface_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)
{
    int8_t someParameter = jsomeParameter;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->some_Method(someParameter);
}
jstring
Java_com_example_smoke_VeryExternalInterface_getSomeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_Me();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_VeryExternalInterface_setSomeAttribute(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)
{
    ::std::string value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_Me(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_VeryExternalInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::fire::Baz>*> (_jpointerRef);
}
}
