/*
 *
 */
#pragma once
#include "package/Class.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <memory>
namespace gluecodium
{
namespace jni
{
std::shared_ptr<::package::Class> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::package::Class>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::package::Class>& _ninput);
}
}