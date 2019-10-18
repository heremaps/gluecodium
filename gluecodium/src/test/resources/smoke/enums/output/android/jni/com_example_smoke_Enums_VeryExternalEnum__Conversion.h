/*
 *
 */
#pragma once
#include "foo/Bar.h"
#include "smoke/Enums.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::fire::SomeVeryExternalEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum* dummy);
::gluecodium::optional<::fire::SomeVeryExternalEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::fire::SomeVeryExternalEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::fire::SomeVeryExternalEnum> _ninput);
}
}
