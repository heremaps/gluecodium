/*

 *
 */

#include "com_example_smoke_TemperatureObserver__Conversion.h"
#include "com_example_smoke_Thermometer.h"
#include "com_example_smoke_Thermometer_SomeThermometerErrorCode__Conversion.h"
#include "com_example_smoke_Thermometer__Conversion.h"
#include "JniExceptionThrower.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jlong
Java_com_example_smoke_Thermometer_makeWithDuration(JNIEnv* _jenv, jobject _jinstance, jobject jinterval, jobject jobservers)

{



    ::std::chrono::seconds interval = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinterval),
            ::gluecodium::jni::TypeId<::std::chrono::seconds>{});



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > observers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jobservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto _result = ::smoke::Thermometer::make_with_duration(interval,observers);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Thermometer_makeWithoutDuration(JNIEnv* _jenv, jobject _jinstance, jobject jobservers)

{



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > observers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jobservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto _result = ::smoke::Thermometer::make_without_duration(observers);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Thermometer_throwingMake(JNIEnv* _jenv, jobject _jinstance, jint jid, jobject jobservers)

{

    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);



    int32_t id = jid;



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > observers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jobservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto nativeCallResult = ::smoke::Thermometer::throwing_make(id,observers);


    if (!nativeCallResult.has_value())
    {
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nativeCallResult.error());

        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Thermometer$NotificationException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Ljava/lang/String;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
        return 0;
    }
    auto _result = nativeCallResult.unsafe_value();


    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Thermometer_nothrowMake(JNIEnv* _jenv, jobject _jinstance, jstring jlabel, jobject jniceObservers)

{



    ::std::string label = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jlabel),
            ::gluecodium::jni::TypeId<::std::string>{});



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > niceObservers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jniceObservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto _result = ::smoke::Thermometer::nothrow_make(label,niceObservers);

    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

jlong
Java_com_example_smoke_Thermometer_anotherThrowingMake(JNIEnv* _jenv, jobject _jinstance, jboolean jdummy, jobject jobservers)

{

    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);



    bool dummy = jdummy;



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > observers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jobservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto nativeCallResult = ::smoke::Thermometer::another_throwing_make(dummy,observers);


    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nErrorValue = static_cast<::smoke::Thermometer::SomeThermometerErrorCode>(errorCode.value());
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nErrorValue);

        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Thermometer$AnotherNotificationException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/smoke/Thermometer$SomeThermometerErrorCode;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
        return 0;
    }
    auto _result = nativeCallResult.unsafe_value();


    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::Thermometer >(_result);
    if (nSharedPtr == nullptr)
    {
        ::gluecodium::jni::throw_new_out_of_memory_exception(_jenv);;
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}

void
Java_com_example_smoke_Thermometer_notifyObservers(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer, jobject jsomeObservers)

{



    ::std::shared_ptr< ::smoke::Thermometer > thermometer = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jthermometer),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::Thermometer >>{});



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > someObservers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jsomeObservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    ::smoke::Thermometer::notify_observers(thermometer,someObservers);

}

void
Java_com_example_smoke_Thermometer_throwingNotifyObservers(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer, jobject jsomeObservers)

{

    ::gluecodium::jni::JniExceptionThrower _throw_exception(_jenv);



    ::std::shared_ptr< ::smoke::Thermometer > thermometer = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jthermometer),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::Thermometer >>{});



    ::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > > someObservers = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jsomeObservers),
            ::gluecodium::jni::TypeId<::std::vector< ::std::shared_ptr< ::smoke::TemperatureObserver > >>{});





    auto nativeCallResult = ::smoke::Thermometer::throwing_notify_observers(thermometer,someObservers);


    if (!nativeCallResult.has_value())
    {
        auto jErrorValue = ::gluecodium::jni::convert_to_jni(_jenv, nativeCallResult.error());

        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "com/example/smoke/Thermometer$NotificationException");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Ljava/lang/String;)V");
        auto exception = ::gluecodium::jni::new_object(_jenv, exceptionClass, theConstructor, jErrorValue);
        _throw_exception.register_exception(std::move(exception));
    }


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
