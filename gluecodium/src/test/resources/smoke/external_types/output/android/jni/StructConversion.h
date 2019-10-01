/*
 *
 */
#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "foo/Bar.h"
#include <jni.h>
#include <memory>
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::foo::BarStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::foo::BarStruct* dummy);
::gluecodium::optional<::foo::BarStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::foo::BarStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::foo::BarStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::foo::BarStruct> _ninput);
}
}
