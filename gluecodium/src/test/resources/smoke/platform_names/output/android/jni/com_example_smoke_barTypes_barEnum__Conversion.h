/*

 *
 */

#pragma once

#include "smoke/fooTypes.h"
#include "gluecodium/Optional.h"
#include "JniReference.h"
#include "JniTypeId.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::fooTypes::fooEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::fooTypes::fooEnum>);
JNIEXPORT ::gluecodium::optional<::smoke::fooTypes::fooEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::fooTypes::fooEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooTypes::fooEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::fooTypes::fooEnum> _ninput);
}
}
