/*

 *
 */

#pragma once

#include "namerules/NameRules.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace jni
{
JNIEXPORT ::namerules::NameRules::ExampleStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::namerules::NameRules::ExampleStruct>);
JNIEXPORT std::optional<::namerules::NameRules::ExampleStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::namerules::NameRules::ExampleStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::namerules::NameRules::ExampleStruct> _ninput);
}
