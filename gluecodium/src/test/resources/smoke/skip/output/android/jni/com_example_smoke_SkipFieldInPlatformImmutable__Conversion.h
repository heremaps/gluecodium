/*

 *
 */

#pragma once

#include "smoke/SkipFieldInPlatformImmutable.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::SkipFieldInPlatformImmutable convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SkipFieldInPlatformImmutable>);
JNIEXPORT std::optional<::smoke::SkipFieldInPlatformImmutable> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::SkipFieldInPlatformImmutable>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::SkipFieldInPlatformImmutable& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::SkipFieldInPlatformImmutable> _ninput);
}
}
