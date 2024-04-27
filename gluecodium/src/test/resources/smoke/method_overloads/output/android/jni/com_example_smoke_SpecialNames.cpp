/*

 *
 */

#include "com_example_smoke_SpecialNames.h"
#include "com_example_smoke_SpecialNames__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_SpecialNames_create(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->create();

}

void
Java_com_example_smoke_SpecialNames_release(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->release();

}

void
Java_com_example_smoke_SpecialNames_createProxy(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->create_proxy();

}

void
Java_com_example_smoke_SpecialNames_Uppercase(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->_uppercase();

}

jlong
Java_com_example_smoke_SpecialNames_make(JNIEnv* _jenv, jobject _jinstance, jstring jresult)

{



    ::std::string result = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jresult),
            (::std::string*)nullptr);





    auto _result = ::smoke::SpecialNames::make(result);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::SpecialNames >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}



JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_cacheThisInstance(JNIEnv* _jenv, jobject _jinstance)
{
    auto jobj = ::gluecodium::jni::make_non_releasing_ref(_jinstance);
    auto long_ptr = ::gluecodium::jni::get_field_value(_jenv, jobj, "nativeHandle", (int64_t*)nullptr);
    auto nobj = *reinterpret_cast<std::shared_ptr<::smoke::SpecialNames>*>(long_ptr);

    ::gluecodium::jni::JniWrapperCache::cache_wrapper(_jenv, nobj, jobj);

}
}
