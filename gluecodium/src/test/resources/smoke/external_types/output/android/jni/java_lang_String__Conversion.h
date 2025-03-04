/*

 *
 */

#pragma once

#include "smoke/Season.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Season convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Season>);
JNIEXPORT std::optional<::smoke::Season> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Season>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Season _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Season> _ninput);
}
}
