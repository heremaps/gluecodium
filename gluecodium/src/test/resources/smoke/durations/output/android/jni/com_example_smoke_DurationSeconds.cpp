/*

 *
 */

#include "com_example_smoke_DurationSeconds.h"
#include "com_example_smoke_DurationSeconds__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_DurationSeconds_durationFunction(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::chrono::seconds input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::chrono::seconds>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationSeconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->duration_function(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_DurationSeconds_nullableDurationFunction(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::std::chrono::seconds > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<std::optional< ::std::chrono::seconds >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationSeconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->nullable_duration_function(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_DurationSeconds_getDurationProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationSeconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_duration_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_DurationSeconds_setDurationProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::chrono::seconds value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::chrono::seconds>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::DurationSeconds>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_duration_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_DurationSeconds_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::DurationSeconds>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
