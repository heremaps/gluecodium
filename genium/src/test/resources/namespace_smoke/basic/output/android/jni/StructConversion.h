#pragma once
#include "root/space/smoke/Basic.h"
#include "com_example_smoke_Basic.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "root/space/smoke/BasicTypes.h"
#include <jni.h>
#include <memory>
#include "Optional.h"
namespace genium
{
namespace jni
{
::root::space::smoke::SomeStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct* dummy);
genium::optional<::root::space::smoke::SomeStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, genium::optional<::root::space::smoke::SomeStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const genium::optional<::root::space::smoke::SomeStruct> _ninput);
}
}