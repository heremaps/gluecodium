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
::smoke::Enums::External_Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum*);
::gluecodium::optional<::smoke::Enums::External_Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Enums::External_Enum>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::External_Enum> _ninput);
}
}
