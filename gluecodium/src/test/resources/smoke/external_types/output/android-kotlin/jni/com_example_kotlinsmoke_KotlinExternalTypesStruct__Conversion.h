/*

 *
 */

#pragma once

#include "kotlin_smoke/KotlinExternalTypesStruct.h"
#include "java_time_Month__Conversion.h"
#include "java_util_Currency__Conversion.h"
#include "java_util_SimpleTimeZone__Conversion.h"
#include "kotlin_Int__Nullable____Conversion.h"
#include "kotlin_String__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::kotlin_smoke::KotlinExternalTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::KotlinExternalTypesStruct>);
JNIEXPORT std::optional<::kotlin_smoke::KotlinExternalTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::KotlinExternalTypesStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::KotlinExternalTypesStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::KotlinExternalTypesStruct> _ninput);
}
}
