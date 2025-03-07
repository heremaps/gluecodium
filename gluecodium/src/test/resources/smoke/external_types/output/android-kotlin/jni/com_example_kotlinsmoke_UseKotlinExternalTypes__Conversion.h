/*

 *
 */

#pragma once

#include "kotlin_smoke/UseKotlinExternalTypes.h"
#include "com_example_kotlinsmoke_KotlinExternalTypesStruct__Conversion.h"
#include "java_time_Month__Conversion.h"
#include "java_util_Currency__Conversion.h"
#include "java_util_SimpleTimeZone__Conversion.h"
#include "kotlin_Boolean__Nullable____Conversion.h"
#include "kotlin_Int__Nullable____Conversion.h"
#include "kotlin_String__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::kotlin_smoke::UseKotlinExternalTypes> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::kotlin_smoke::UseKotlinExternalTypes>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::kotlin_smoke::UseKotlinExternalTypes>& _ninput);

}
}
