/*

 *
 */

#pragma once

#include "smoke/TimeZone.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::TimeZone convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::TimeZone>);
JNIEXPORT std::optional<::smoke::TimeZone> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::TimeZone>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::TimeZone& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::TimeZone> _ninput);
}
}
