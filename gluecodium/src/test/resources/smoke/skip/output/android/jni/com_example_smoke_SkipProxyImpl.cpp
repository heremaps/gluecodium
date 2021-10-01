/*
 *
 */
#include "com_example_smoke_SkipProxyImpl.h"
#include "com_example_smoke_SkipProxy__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jboolean
Java_com_example_smoke_SkipProxyImpl_notInSwift(JNIEnv* _jenv, jobject _jinstance, jboolean jinput)
{
    bool input = jinput;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->not_in_swift(input);
    return _result;
}
jfloat
Java_com_example_smoke_SkipProxyImpl_notInDart(JNIEnv* _jenv, jobject _jinstance, jfloat jinput)
{
    float input = jinput;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->not_in_dart(input);
    return _result;
}
jboolean
Java_com_example_smoke_SkipProxyImpl_isSkippedInSwift(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->is_skipped_in_swift();
    return _result;
}
void
Java_com_example_smoke_SkipProxyImpl_setSkippedInSwift(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)
{
    bool value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_skipped_in_swift(value);
}
jfloat
Java_com_example_smoke_SkipProxyImpl_getSkippedInDart(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->get_skipped_in_dart();
    return _result;
}
void
Java_com_example_smoke_SkipProxyImpl_setSkippedInDart(JNIEnv* _jenv, jobject _jinstance, jfloat jvalue)
{
    float value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_skipped_in_dart(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_SkipProxyImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SkipProxy>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
