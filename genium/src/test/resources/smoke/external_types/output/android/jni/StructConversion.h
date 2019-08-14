#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_BazClass.h"
#include "com_example_smoke_FooClass.h"
#include "foo/Bar.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::foo::BarStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::foo::BarStruct* dummy);
::genium::optional<::foo::BarStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::foo::BarStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::foo::BarStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::foo::BarStruct> _ninput);
}
}
