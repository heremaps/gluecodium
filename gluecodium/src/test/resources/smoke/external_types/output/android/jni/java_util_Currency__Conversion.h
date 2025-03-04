/*

 *
 */

#pragma once

#include "smoke/Currency.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Currency convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Currency>);
JNIEXPORT std::optional<::smoke::Currency> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Currency>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Currency& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Currency> _ninput);
}
}
