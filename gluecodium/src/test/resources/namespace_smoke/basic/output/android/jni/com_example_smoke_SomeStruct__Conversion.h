/*
 *
 */
#pragma once
#include "root/space/smoke/BasicTypes.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::root::space::smoke::SomeStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct*);
JNIEXPORT ::gluecodium::optional<::root::space::smoke::SomeStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::root::space::smoke::SomeStruct>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::root::space::smoke::SomeStruct> _ninput);
}
}
