/*
 *
 */
#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_barStruct.h"
#include "smoke/fooTypes.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::smoke::fooEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::fooEnum* dummy);
::genium::optional<::smoke::fooEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::fooEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::fooEnum> _ninput);
}
}
