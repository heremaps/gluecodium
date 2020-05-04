/*
 *
 */
#pragma once
#include "smoke/EnumsInTypeCollection.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::smoke::TCEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::TCEnum*);
::gluecodium::optional<::smoke::TCEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::TCEnum>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::TCEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::TCEnum> _ninput);
}
}
