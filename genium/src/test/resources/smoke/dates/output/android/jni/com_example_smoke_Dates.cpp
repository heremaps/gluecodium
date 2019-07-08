/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/Dates.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Dates.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_Dates_dateMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::chrono::system_clock::time_point input = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jinput),
            (::std::chrono::system_clock::time_point*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->date_method(input);
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Dates_getDateAttribute(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_date_attribute();
    return ::genium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Dates_setDateAttribute(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::chrono::system_clock::time_point value = ::genium::jni::convert_from_jni(_jenv,
            ::genium::jni::make_non_releasing_ref(jvalue),
            (::std::chrono::system_clock::time_point*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_date_attribute(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Dates_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (_jpointerRef);
}
}
