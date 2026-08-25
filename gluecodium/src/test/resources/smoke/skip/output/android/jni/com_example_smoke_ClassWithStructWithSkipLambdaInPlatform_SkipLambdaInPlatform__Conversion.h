/*

 *
 */

#pragma once

#include "smoke/ClassWithStructWithSkipLambdaInPlatform.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>);
JNIEXPORT ::gluecodium::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform> _ninput);
}
}
