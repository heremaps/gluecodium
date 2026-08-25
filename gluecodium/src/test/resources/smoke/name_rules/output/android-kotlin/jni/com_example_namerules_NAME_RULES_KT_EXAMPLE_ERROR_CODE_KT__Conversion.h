/*

 *
 */

#pragma once

#include "namerules/NameRules.h"
#include "Optional.h"
#include "JniReference.h"
#include "JniTypeId.h"

namespace jni
{
JNIEXPORT ::namerules::NameRules::ExampleErrorCode convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::namerules::NameRules::ExampleErrorCode>);
JNIEXPORT ::optional<::namerules::NameRules::ExampleErrorCode> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::optional<::namerules::NameRules::ExampleErrorCode>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleErrorCode _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::optional<::namerules::NameRules::ExampleErrorCode> _ninput);
}
