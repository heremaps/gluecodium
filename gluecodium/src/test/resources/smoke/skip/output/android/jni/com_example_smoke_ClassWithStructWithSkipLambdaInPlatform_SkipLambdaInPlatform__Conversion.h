/*
 *
 */
#pragma once
#include "smoke\ClassWithStructWithSkipLambdaInPlatform.h"
#include "JniReference.h"
#include <optional>
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform*);
JNIEXPORT std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform> _ninput);
}
}