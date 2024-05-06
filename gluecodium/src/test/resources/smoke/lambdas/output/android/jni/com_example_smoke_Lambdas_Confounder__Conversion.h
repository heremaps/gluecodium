/*

 *
 */

#pragma once

#include "smoke/Lambdas.h"
#include <functional>
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT ::smoke::Lambdas::Confuser convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<::smoke::Lambdas::Confuser>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Lambdas::Confuser& _ninput);

}
}
