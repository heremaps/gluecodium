/*

 *
 */

#pragma once

#include "kotlin_smoke/SerializableStructWithExternalField.h"
#include "com_here_android_test_AnExternalStruct__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::kotlin_smoke::SerializableStructWithExternalField convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::SerializableStructWithExternalField>);
JNIEXPORT std::optional<::kotlin_smoke::SerializableStructWithExternalField> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::SerializableStructWithExternalField>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::SerializableStructWithExternalField& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::SerializableStructWithExternalField> _ninput);
}
}
