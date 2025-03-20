/*

 *
 */

#pragma once

#include "smoke/TemperatureObserver.h"
#include "com_example_smoke_Thermometer__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::smoke::TemperatureObserver> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::TemperatureObserver>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::TemperatureObserver>& _ninput);

}
}
