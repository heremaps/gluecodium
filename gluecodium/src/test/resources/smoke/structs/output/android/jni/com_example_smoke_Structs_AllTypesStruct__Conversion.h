/*
 *
 */
#pragma once
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::smoke::Structs::AllTypesStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy);
::gluecodium::optional<::smoke::Structs::AllTypesStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::AllTypesStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::AllTypesStruct> _ninput);
}
}
