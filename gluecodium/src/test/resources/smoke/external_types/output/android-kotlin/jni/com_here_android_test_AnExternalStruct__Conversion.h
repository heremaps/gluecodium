/*

 *
 */

#pragma once

#include "kotlin_smoke/ExternalMarkedAsSerializable.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::kotlin_smoke::ExternalMarkedAsSerializable convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::ExternalMarkedAsSerializable>);
JNIEXPORT std::optional<::kotlin_smoke::ExternalMarkedAsSerializable> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::ExternalMarkedAsSerializable>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::ExternalMarkedAsSerializable& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::ExternalMarkedAsSerializable> _ninput);
}
}
