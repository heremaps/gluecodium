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
namespace genium
{
namespace jni
{
::root::space::smoke::SomeStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct* dummy);
std::shared_ptr<::root::space::smoke::SomeStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::root::space::smoke::SomeStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::root::space::smoke::SomeStruct> _ninput);
}
}
