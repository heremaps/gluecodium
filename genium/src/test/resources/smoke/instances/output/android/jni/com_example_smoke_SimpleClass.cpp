/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/SimpleClass.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_SimpleClass.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jstring
Java_com_example_smoke_SimpleClass_getStringValue(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_string_value();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_SimpleClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*> (_jpointerRef);
}
}
