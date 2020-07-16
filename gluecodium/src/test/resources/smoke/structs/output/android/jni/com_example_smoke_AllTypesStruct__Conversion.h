/*
 *
 */
#pragma once
#include "smoke/TypeCollection.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::smoke::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct*);
::gluecodium::optional<::smoke::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::AllTypesStruct>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::AllTypesStruct> _ninput);
}
}