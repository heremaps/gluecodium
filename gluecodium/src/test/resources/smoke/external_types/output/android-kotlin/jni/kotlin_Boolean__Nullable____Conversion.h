/*

 *
 */

#pragma once

#include "kotlin_smoke/VeryBoolean.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::kotlin_smoke::VeryBoolean convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::VeryBoolean>);
JNIEXPORT std::optional<::kotlin_smoke::VeryBoolean> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::VeryBoolean>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::VeryBoolean& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni_internal(JNIEnv* _jenv, const ::kotlin_smoke::VeryBoolean& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::VeryBoolean> _ninput);
}
}
