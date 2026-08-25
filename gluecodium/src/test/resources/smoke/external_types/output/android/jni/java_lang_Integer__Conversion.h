/*

 *
 */

#pragma once

#include "smoke/SystemColor.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::SystemColor convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::SystemColor>);
JNIEXPORT ::gluecodium::optional<::smoke::SystemColor> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::SystemColor>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::SystemColor& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::SystemColor> _ninput);
}
}
