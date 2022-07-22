/*
 *
 */
#pragma once
#include "foo/Bar.h"
#include "JniReference.h"
#include <memory>
#include <optional>
namespace gluecodium
{
namespace jni
{
JNIEXPORT std::shared_ptr<::fire::Baz> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::fire::Baz>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::Baz>& _ninput);
}
}
