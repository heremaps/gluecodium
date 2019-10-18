/*
 *
 */
#pragma once
#include "smoke/fooTypes.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::smoke::fooEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::fooEnum* dummy);
::gluecodium::optional<::smoke::fooEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::fooEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::fooEnum> _ninput);
}
}
