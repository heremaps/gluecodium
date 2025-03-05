/*

 *
 */

#pragma once

#include "kotlin_smoke/SystemColor.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::kotlin_smoke::SystemColor convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::SystemColor>);
JNIEXPORT std::optional<::kotlin_smoke::SystemColor> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::SystemColor>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::SystemColor& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::SystemColor> _ninput);
}
}
