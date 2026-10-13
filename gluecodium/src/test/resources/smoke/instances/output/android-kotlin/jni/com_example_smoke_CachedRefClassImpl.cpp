/*

 *
 */

#include "com_example_smoke_CachedRefClassImpl.h"
#include "com_example_smoke_CachedRefClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_CachedRefClassImpl_getStringValue(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CachedRefClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_string_value();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_CachedRefClassImpl_getItems_1private(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::CachedRefClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_items();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}




JNIEXPORT void JNICALL
Java_com_example_smoke_CachedRefClassImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::CachedRefClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
