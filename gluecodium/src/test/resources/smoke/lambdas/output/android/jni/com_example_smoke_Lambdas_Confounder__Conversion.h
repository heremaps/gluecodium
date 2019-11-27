/*
 *
 */
#pragma once
#include "smoke/Lambdas.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <functional>
#include <memory>
namespace gluecodium
{
namespace jni
{
::smoke::Lambdas::Confuser convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::Lambdas::Confuser* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Confuser& _ninput);
}
}
