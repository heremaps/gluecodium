/*

 *
 */

#pragma once

#include "smoke/Currency.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Currency convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Currency>);
JNIEXPORT ::gluecodium::optional<::smoke::Currency> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::Currency>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Currency& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Currency> _ninput);
}
}
