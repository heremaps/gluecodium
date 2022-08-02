/*
 *
 */
#include "com_example_smoke_Dates.h"
#include "com_example_smoke_Dates__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
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
    auto _result = (*pInstanceSharedPointer)->date_method(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_Dates_nullableDateMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    std::optional< ::std::chrono::system_clock::time_point > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::std::chrono::system_clock::time_point >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->nullable_date_method(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
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
    auto _result = (*pInstanceSharedPointer)->get_date_property();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
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
jobject
Java_com_example_smoke_Dates_getDateSet(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->get_date_set();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
void
Java_com_example_smoke_Dates_setDateSet(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Dates>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_date_set(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Dates_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Dates>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
