/*

 *
 */

#pragma once

#include "smoke/ListenersWithReturnValues.h"
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultEnum__Conversion.h"
#include "com_example_smoke_ListenersWithReturnValues_ResultStruct__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::smoke::ListenersWithReturnValues> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ListenersWithReturnValues>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ListenersWithReturnValues>& _ninput);

}
}
