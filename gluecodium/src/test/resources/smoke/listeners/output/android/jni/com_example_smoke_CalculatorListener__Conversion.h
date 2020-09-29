/*
 *
 */
#pragma once
#include "smoke/CalculatorListener.h"
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_CalculatorListener_ResultStruct__Conversion.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <functional>
#include <memory>
namespace gluecodium
{
namespace jni
{
std::shared_ptr<::smoke::CalculatorListener> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::CalculatorListener>*);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::CalculatorListener>& _ninput);
}
}