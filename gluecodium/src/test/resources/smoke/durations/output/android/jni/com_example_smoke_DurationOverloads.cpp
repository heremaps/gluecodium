/*
 *
 */
#include "com_example_smoke_DurationOverloads.h"
#include "com_example_smoke_DurationOverloads__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jstring
Java_com_example_smoke_DurationOverloads_durationFunction__Lcom_example_time_Duration_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::chrono::seconds input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::chrono::seconds*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationOverloads>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->duration_function(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jstring
Java_com_example_smoke_DurationOverloads_durationFunction__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput)
{
    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::string*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationOverloads>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->duration_function(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_DurationOverloads_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::DurationOverloads>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
