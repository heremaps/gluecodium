/*
 *
 */
#pragma once
#include "package/Types.h"
#include "com_example_package_Types_Enum__Conversion.h"
#include "JniReference.h"
#include <optional>
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::package::Types::Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Types::Struct*);
JNIEXPORT std::optional<::package::Types::Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::package::Types::Struct>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Types::Struct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::package::Types::Struct> _ninput);
}
}
