/*
 *
 */
#pragma once
#include "smoke/EnumsInTypeCollection.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::EnumsInTypeCollection::TCEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::EnumsInTypeCollection::TCEnum*);
JNIEXPORT ::gluecodium::optional<::smoke::EnumsInTypeCollection::TCEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::EnumsInTypeCollection::TCEnum>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::EnumsInTypeCollection::TCEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::EnumsInTypeCollection::TCEnum> _ninput);
}
}
