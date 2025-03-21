/*

 *
 */

#include "com_example_smoke_TemperatureObserverImplCppProxy.h"
#include "com_example_smoke_TemperatureObserver__Conversion.h"
#include "com_example_smoke_Thermometer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"

namespace gluecodium
{
namespace jni
{

com_example_smoke_TemperatureObserver_CppProxy::com_example_smoke_TemperatureObserver_CppProxy(JniReference<jobject> globalRef, jint _jHashCode) noexcept
    : CppProxyBase(std::move(globalRef), _jHashCode, "com_example_smoke_TemperatureObserver") {
}

void
com_example_smoke_TemperatureObserver_CppProxy::on_temperature_update( const ::std::shared_ptr< ::smoke::Thermometer >& nthermometer ) {

    JNIEnv* jniEnv = getJniEnvironment( );
    auto jthermometer = convert_to_jni( jniEnv, nthermometer );
    callJavaMethod<void>( "onTemperatureUpdate", "(Lcom/example/smoke/Thermometer;)V", jniEnv , jthermometer);

    checkExceptionAndReportIfAny(jniEnv);



}

}
}
