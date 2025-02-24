/*

 *
 */

#pragma once

#include "foo/Bar.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::fire::SomeVeryExternalEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::fire::SomeVeryExternalEnum>);
JNIEXPORT std::optional<::fire::SomeVeryExternalEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::fire::SomeVeryExternalEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::fire::SomeVeryExternalEnum> _ninput);
}
}
