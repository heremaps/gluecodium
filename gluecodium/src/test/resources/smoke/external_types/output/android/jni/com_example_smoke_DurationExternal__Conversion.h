/*

 *
 */

#pragma once

#include "core/duration.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT std::chrono::duration<uint64_t, std::ratio<1,1000>> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::chrono::duration<uint64_t, std::ratio<1,1000>>>);
JNIEXPORT ::gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::chrono::duration<uint64_t, std::ratio<1,1000>>& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>> _ninput);
}
}
