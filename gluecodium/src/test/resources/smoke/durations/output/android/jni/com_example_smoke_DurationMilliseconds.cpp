/*

 *
 */

#include "com_example_smoke_DurationMilliseconds.h"
#include "com_example_smoke_DurationMilliseconds__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_DurationMilliseconds_durationFunction(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::chrono::milliseconds input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<std::chrono::milliseconds>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationMilliseconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->duration_function(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_DurationMilliseconds_nullableDurationFunction(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< std::chrono::milliseconds > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<std::optional< std::chrono::milliseconds >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationMilliseconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->nullable_duration_function(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_DurationMilliseconds_getDurationProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationMilliseconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_duration_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_DurationMilliseconds_setDurationProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::chrono::milliseconds value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<std::chrono::milliseconds>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationMilliseconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_duration_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_DurationMilliseconds_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::DurationMilliseconds>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
