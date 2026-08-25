/*

 *
 */

#pragma once

#include "namerules/NameRules.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "Optional.h"

namespace jni
{
JNIEXPORT ::namerules::NameRules::ExampleStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::namerules::NameRules::ExampleStruct>);
JNIEXPORT ::optional<::namerules::NameRules::ExampleStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::optional<::namerules::NameRules::ExampleStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::optional<::namerules::NameRules::ExampleStruct> _ninput);
}
