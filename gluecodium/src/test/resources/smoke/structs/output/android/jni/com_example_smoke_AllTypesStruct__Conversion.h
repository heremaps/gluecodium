/*
 *
 */
#pragma once
#include "smoke/TypeCollection.h"
#include "com_example_smoke_Point__Conversion.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct*);
JNIEXPORT ::gluecodium::optional<::smoke::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::AllTypesStruct>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::AllTypesStruct> _ninput);
}
}