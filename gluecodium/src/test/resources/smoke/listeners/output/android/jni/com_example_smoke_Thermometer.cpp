/*

 *
 */

#include "com_example_smoke_TemperatureObserver__Conversion.h"
#include "com_example_smoke_Thermometer.h"
#include "com_example_smoke_Thermometer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jlong
Java_com_example_smoke_Thermometer_make(JNIEnv* _jenv, jobject _jinstance, jobject jinterval, jobject jobservers)

{



    ::std::chrono::seconds interval = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinterval),
            ::gluecodium::jni::TypeId<::std::chrono::seconds>{});



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > observers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jobservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto _result = ::smoke::Thermometer::make(interval,observers);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

void
Java_com_example_smoke_Thermometer_forceUpdate(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->force_update();

}

jdouble
Java_com_example_smoke_Thermometer_getCelsius(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_celsius();

    return _result;
}

jdouble
Java_com_example_smoke_Thermometer_getKelvin(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_kelvin();

    return _result;
}

jdouble
Java_com_example_smoke_Thermometer_getFahrenheit(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_fahrenheit();

    return _result;
}



JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_cacheThisInstance(JNIEnv* _jenv, jobject _jinstance)
{
    auto jobj = ::gluecodium::jni::make_non_releasing_ref(_jinstance);
    auto long_ptr = ::gluecodium::jni::get_class_native_handle(_jenv, jobj);
    auto nobj = *reinterpret_cast<std::shared_ptr<::smoke::Thermometer>*>(long_ptr);

    ::gluecodium::jni::JniWrapperCache::cache_wrapper(_jenv, nobj, jobj);

}
}
