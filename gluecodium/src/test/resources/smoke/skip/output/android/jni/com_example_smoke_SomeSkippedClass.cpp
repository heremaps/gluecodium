/*
 *
 */
#include "com_example_dont_smoke_DontSmokeEnum__Conversion.h"
#include "com_example_smoke_SomeSkippedClass.h"
#include "com_example_smoke_SomeSkippedClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_SomeSkippedClass_doFoo(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SomeSkippedClass>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->do_foo();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_SomeSkippedClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SomeSkippedClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
