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
::package::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Enum*);
::gluecodium::optional<::package::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Enum>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Enum> _ninput);
}
}
