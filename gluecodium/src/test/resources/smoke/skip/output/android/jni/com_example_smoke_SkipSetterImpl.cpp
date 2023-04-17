/*
 *
 */
#include "com_example_smoke_SkipSetterImpl.h"
#include "com_example_smoke_SkipSetter__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jstring
Java_com_example_smoke_SkipSetterImpl_getFoo(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SkipSetter>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->get_foo();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_SkipSetterImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SkipSetter>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
