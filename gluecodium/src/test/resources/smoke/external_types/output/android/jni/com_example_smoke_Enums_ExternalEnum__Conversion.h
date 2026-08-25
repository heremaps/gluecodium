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
JNIEXPORT ::smoke::Enums::External_Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Enums::External_Enum>);
JNIEXPORT ::gluecodium::optional<::smoke::Enums::External_Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::Enums::External_Enum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::External_Enum> _ninput);
}
}
