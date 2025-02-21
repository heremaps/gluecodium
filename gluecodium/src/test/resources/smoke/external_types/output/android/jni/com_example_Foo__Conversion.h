/*

 *
 */

#pragma once

#include "smoke/JavaExternalCtor.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::JavaExternalCtor convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::JavaExternalCtor>);
JNIEXPORT std::optional<::smoke::JavaExternalCtor> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::JavaExternalCtor>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::JavaExternalCtor& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni_internal(JNIEnv* _jenv, const ::smoke::JavaExternalCtor& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::JavaExternalCtor> _ninput);
}
}
