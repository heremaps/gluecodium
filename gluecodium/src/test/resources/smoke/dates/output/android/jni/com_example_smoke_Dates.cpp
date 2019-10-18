/*
 *
 */
#include "com_example_smoke_Dates.h"
#include "com_example_smoke_Dates__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
jobject
Java_com_example_smoke_Dates_dateMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::chrono::system_clock::time_point input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::chrono::system_clock::time_point*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->date_method(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_Dates_getDateProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_date_property();
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_Dates_setDateProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::chrono::system_clock::time_point value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::chrono::system_clock::time_point*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_date_property(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Dates_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (_jpointerRef);
}
}
