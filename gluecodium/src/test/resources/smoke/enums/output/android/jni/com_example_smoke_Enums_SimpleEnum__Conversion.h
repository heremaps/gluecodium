/*
 *
 */
#pragma once
#include "smoke/Enums.h"
#include "JniReference.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Enums::SimpleEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum*);
JNIEXPORT std::optional<::smoke::Enums::SimpleEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::Enums::SimpleEnum>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Enums::SimpleEnum> _ninput);
}
}
