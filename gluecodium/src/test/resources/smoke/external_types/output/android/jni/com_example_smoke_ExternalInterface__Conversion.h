/*
 *
 */
#pragma once
#include "foo/Bar.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <memory>
namespace gluecodium
{
namespace jni
{
JNIEXPORT std::shared_ptr<::smoke::ExternalInterface> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::ExternalInterface>*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ExternalInterface>& _ninput);
}
}
