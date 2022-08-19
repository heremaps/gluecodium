/*
 *
 */
#pragma once
#include "smoke/OuterStruct.h"
#include <functional>
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <memory>
namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::OuterStruct::InnerLambda convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::smoke::OuterStruct::InnerLambda*);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerLambda& _ninput);
}
}
