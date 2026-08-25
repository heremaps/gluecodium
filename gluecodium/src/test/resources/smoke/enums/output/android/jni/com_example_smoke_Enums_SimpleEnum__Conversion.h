/*

 *
 */

#pragma once

#include "smoke/Enums.h"
#include "gluecodium/Optional.h"
#include "JniReference.h"
#include "JniTypeId.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Enums::SimpleEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Enums::SimpleEnum>);
JNIEXPORT ::gluecodium::optional<::smoke::Enums::SimpleEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::Enums::SimpleEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::SimpleEnum> _ninput);
}
}
