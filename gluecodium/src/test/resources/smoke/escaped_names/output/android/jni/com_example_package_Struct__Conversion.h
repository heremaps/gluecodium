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
::package::Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Struct* dummy);
::gluecodium::optional<::package::Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Struct> _ninput);
}
}
