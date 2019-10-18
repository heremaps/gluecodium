/*
 *
 */
#pragma once
#include "foo/Bar.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <functional>
#include <memory>
namespace gluecodium
{
namespace jni
{
std::shared_ptr<::smoke::ExternalInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::ExternalInterface>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ExternalInterface>& _ninput);
}
}
