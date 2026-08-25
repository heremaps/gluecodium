/*

 *
 */

#pragma once

#include "smoke/SkipFieldInPlatformImmutable.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::SkipFieldInPlatformImmutable convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SkipFieldInPlatformImmutable>);
JNIEXPORT ::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::SkipFieldInPlatformImmutable& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::SkipFieldInPlatformImmutable> _ninput);
}
}
