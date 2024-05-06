/*

 *
 */

#pragma once

#include "smoke/ClassWithStructWithSkipLambdaInPlatform.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::smoke::ClassWithStructWithSkipLambdaInPlatform> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::smoke::ClassWithStructWithSkipLambdaInPlatform>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ClassWithStructWithSkipLambdaInPlatform>& _ninput);

}
}
