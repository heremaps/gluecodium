/*
 *
 */
#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "root/space/smoke/BasicTypes.h"
#include <jni.h>
#include <memory>
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::root::space::smoke::SomeStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct* dummy);
::gluecodium::optional<::root::space::smoke::SomeStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::root::space::smoke::SomeStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::root::space::smoke::SomeStruct> _ninput);
}
}
