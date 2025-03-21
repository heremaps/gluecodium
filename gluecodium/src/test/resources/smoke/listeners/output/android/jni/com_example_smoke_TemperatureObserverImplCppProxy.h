/*

 *
 */

#pragma once

#include "smoke/TemperatureObserver.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_TemperatureObserver_CppProxy final : public CppProxyBase, public ::smoke::TemperatureObserver {
public:
    com_example_smoke_TemperatureObserver_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_TemperatureObserver_CppProxy( const com_example_smoke_TemperatureObserver_CppProxy& ) = delete;
    com_example_smoke_TemperatureObserver_CppProxy& operator=( const com_example_smoke_TemperatureObserver_CppProxy& ) = delete;


    void on_temperature_update( const ::std::shared_ptr< ::smoke::Thermometer >& nthermometer ) override;
};

}
}
