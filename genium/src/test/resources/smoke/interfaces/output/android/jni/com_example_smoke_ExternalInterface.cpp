/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "foo/Bar.h"
#include "com_example_smoke_ExternalInterface.h"
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
void
Java_com_example_smoke_ExternalInterface_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)
{
    int8_t someParameter = jsomeParameter;
    auto pointerAsLong = genium::jni::get_field_value(
            _jenv,
            genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*> (pointerAsLong);
    (*pInstanceSharedPointer)->some_Method(someParameter);
}
jstring
Java_com_example_smoke_ExternalInterface_getSomeAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pointerAsLong = genium::jni::get_field_value(
            _jenv,
            genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*> (pointerAsLong);
    auto result = (*pInstanceSharedPointer)->get_Me();
    return genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_ExternalInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*> (_jpointerRef);
}
}
