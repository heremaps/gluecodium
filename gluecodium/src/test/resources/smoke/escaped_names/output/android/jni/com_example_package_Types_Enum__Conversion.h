/*
 *
 */
#pragma once
#include "package/Types.h"
#include "JniReference.h"
#include <optional>
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Types::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Types::Enum*);
JNIEXPORT std::optional<::package::Types::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::package::Types::Enum>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Types::Enum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::package::Types::Enum> _ninput);
}
}
