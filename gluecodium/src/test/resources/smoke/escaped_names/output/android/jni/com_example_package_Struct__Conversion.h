/*
 *
 */
#pragma once
#include "package/Types.h"
#include "com_example_package_Enum__Conversion.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Struct*);
JNIEXPORT ::gluecodium::optional<::package::Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Struct>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Struct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Struct> _ninput);
}
}