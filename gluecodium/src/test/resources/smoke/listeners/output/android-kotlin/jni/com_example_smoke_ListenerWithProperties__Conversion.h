/*

 *
 */

#pragma once

#include "smoke/ListenerWithProperties.h"
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenerWithProperties_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenerWithProperties_ResultStruct__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::smoke::ListenerWithProperties> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ListenerWithProperties>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ListenerWithProperties>& _ninput);

}
}
