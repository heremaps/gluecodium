/*
 *
 */
#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "package/Types.h"
#include <jni.h>
#include <memory>
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::package::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Enum* dummy);
::gluecodium::optional<::package::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::package::Enum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::package::Enum> _ninput);
}
}
