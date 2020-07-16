/*
 *
 */
#pragma once
#include "smoke/Structs.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::smoke::Structs::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct*);
::gluecodium::optional<::smoke::Structs::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::AllTypesStruct>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::AllTypesStruct> _ninput);
}
}
