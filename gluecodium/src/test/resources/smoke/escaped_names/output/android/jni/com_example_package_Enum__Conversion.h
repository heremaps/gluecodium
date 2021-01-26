/*
 *
 */
#pragma once
#include "package/Types.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Enum*);
JNIEXPORT ::gluecodium::optional<::package::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Enum>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Enum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Enum> _ninput);
}
}
