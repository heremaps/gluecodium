/*

 *
 */

#pragma once

#include "smoke/OuterStruct.h"
#include <functional>
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT ::smoke::OuterStruct::InnerLambda convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::OuterStruct::InnerLambda>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerLambda& _ninput);

}
}
