/*

 *
 */

#include "com_example_smoke_TemperatureObserverImpl.h"
#include "com_example_smoke_TemperatureObserver__Conversion.h"
#include "com_example_smoke_Thermometer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_TemperatureObserverImpl_onTemperatureUpdate(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer)

{



    ::std::shared_ptr< ::smoke::Thermometer > thermometer = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jthermometer),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::Thermometer >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::TemperatureObserver>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->on_temperature_update(thermometer);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_TemperatureObserverImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::TemperatureObserver>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
