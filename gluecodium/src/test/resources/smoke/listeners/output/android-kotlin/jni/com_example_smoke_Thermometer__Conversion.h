/*

 *
 */

#pragma once

#include "smoke/Thermometer.h"
#include "com_example_smoke_TemperatureObserver__Conversion.h"
#include "com_example_smoke_Thermometer_SomeThermometerErrorCode__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::smoke::Thermometer> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::Thermometer>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Thermometer>& _ninput);

}
}
