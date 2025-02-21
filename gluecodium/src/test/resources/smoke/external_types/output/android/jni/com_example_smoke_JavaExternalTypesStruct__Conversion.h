/*

 *
 */

#pragma once

#include "smoke/JavaExternalTypesStruct.h"
#include "java_lang_Integer__Conversion.h"
#include "java_lang_String__Conversion.h"
#include "java_time_Month__Conversion.h"
#include "java_util_Currency__Conversion.h"
#include "java_util_SimpleTimeZone__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::JavaExternalTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::JavaExternalTypesStruct>);
JNIEXPORT std::optional<::smoke::JavaExternalTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::JavaExternalTypesStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::JavaExternalTypesStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::JavaExternalTypesStruct> _ninput);
}
}
