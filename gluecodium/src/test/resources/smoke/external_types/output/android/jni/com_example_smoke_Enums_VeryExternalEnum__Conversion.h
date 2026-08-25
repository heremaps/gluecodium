/*

 *
 */

#pragma once

#include "foo/Bar.h"
#include "gluecodium/Optional.h"
#include "JniReference.h"
#include "JniTypeId.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::fire::SomeVeryExternalEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::fire::SomeVeryExternalEnum>);
JNIEXPORT ::gluecodium::optional<::fire::SomeVeryExternalEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::fire::SomeVeryExternalEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::fire::SomeVeryExternalEnum> _ninput);
}
}
