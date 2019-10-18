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
::smoke::Structs::ExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy);
::gluecodium::optional<::smoke::Structs::ExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Structs::ExternalStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::ExternalStruct> _ninput);
}
}
