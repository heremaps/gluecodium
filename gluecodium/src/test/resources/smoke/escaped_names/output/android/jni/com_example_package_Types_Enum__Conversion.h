/*

 *
 */

#pragma once

#include "package/Types.h"
#include "gluecodium/Optional.h"
#include "JniReference.h"
#include "JniTypeId.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Types::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::package::Types::Enum>);
JNIEXPORT ::gluecodium::optional<::package::Types::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::package::Types::Enum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Types::Enum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Types::Enum> _ninput);
}
}
