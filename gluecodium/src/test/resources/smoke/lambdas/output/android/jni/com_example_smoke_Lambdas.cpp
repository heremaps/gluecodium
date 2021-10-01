/*
 *
 */
#include "com_example_smoke_Lambdas.h"
#include "com_example_smoke_Lambdas_Confounder__Conversion.h"
#include "com_example_smoke_Lambdas_Indexer__Conversion.h"
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "com_example_smoke_Lambdas__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_Lambdas_deconfuse(JNIEnv* _jenv, jobject _jinstance, jstring jvalue, jobject jconfuser)
{
    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);
    ::smoke::Lambdas::Confuser confuser = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jconfuser),
            (::smoke::Lambdas::Confuser*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Lambdas>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->deconfuse(value,confuser);
    return ::gluecodium::jni::com_example_smoke_Lambdas_00024Producer_convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_Lambdas_fuse(JNIEnv* _jenv, jobject _jinstance, jobject jitems, jobject jcallback)
{
    ::std::vector< ::std::string > items = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jitems),
            (::std::vector< ::std::string >*)nullptr);
    ::smoke::Lambdas::Indexer callback = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jcallback),
            (::smoke::Lambdas::Indexer*)nullptr);
    auto _result = ::smoke::Lambdas::fuse(items,callback);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Lambdas_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Lambdas>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
