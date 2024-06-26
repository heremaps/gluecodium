/*

 *
 */

#pragma once

#include "smoke/fooTypes.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::fooTypes::fooEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::fooTypes::fooEnum>);
JNIEXPORT std::optional<::smoke::fooTypes::fooEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::fooTypes::fooEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooTypes::fooEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::fooTypes::fooEnum> _ninput);
}
}
