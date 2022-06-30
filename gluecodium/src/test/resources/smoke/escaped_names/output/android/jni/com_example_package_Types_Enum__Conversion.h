/*
 *
 */
#pragma once
#include "package/Types.h"
#include "JniReference.h"
#include "gluecodium\Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Types::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Types::Enum*);
JNIEXPORT ::gluecodium::optional<::package::Types::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Types::Enum>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Types::Enum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Types::Enum> _ninput);
}
}
