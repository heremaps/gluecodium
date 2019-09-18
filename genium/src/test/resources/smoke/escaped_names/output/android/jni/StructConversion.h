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
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::package::Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Struct* dummy);
::genium::optional<::package::Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::package::Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::package::Struct> _ninput);
}
}
