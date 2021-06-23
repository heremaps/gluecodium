/*
 *
 */
#include "com_example_smoke_DatesSteady.h"
#include "com_example_smoke_DatesSteady__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_DatesSteady_dateMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::DatesSteady::MonotonicDate input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::smoke::DatesSteady::MonotonicDate*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DatesSteady>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->date_method(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_DatesSteady_nullableDateMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DatesSteady>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->nullable_date_method(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_DatesSteady_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::DatesSteady>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
