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
::smoke::Enums::SimpleEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum* dummy);
::gluecodium::optional<::smoke::Enums::SimpleEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Enums::SimpleEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::SimpleEnum> _ninput);
}
}
