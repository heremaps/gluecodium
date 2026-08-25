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
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::JavaExternalTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::JavaExternalTypesStruct>);
JNIEXPORT ::gluecodium::optional<::smoke::JavaExternalTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::JavaExternalTypesStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::JavaExternalTypesStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::JavaExternalTypesStruct> _ninput);
}
}
