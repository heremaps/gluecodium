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
::smoke::fooStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::fooStruct* dummy);
::gluecodium::optional<::smoke::fooStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::fooStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::fooStruct> _ninput);
}
}
