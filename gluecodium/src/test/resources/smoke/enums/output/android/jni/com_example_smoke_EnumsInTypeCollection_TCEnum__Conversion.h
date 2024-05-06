/*

 *
 */

#pragma once

#include "smoke/EnumsInTypeCollection.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <optional>

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::EnumsInTypeCollection::TCEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::EnumsInTypeCollection::TCEnum>);
JNIEXPORT std::optional<::smoke::EnumsInTypeCollection::TCEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::EnumsInTypeCollection::TCEnum>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::EnumsInTypeCollection::TCEnum _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::EnumsInTypeCollection::TCEnum> _ninput);
}
}
