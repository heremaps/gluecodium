#pragma once
#include "smoke/fooInterface.h"
#include "com_example_smoke_barInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/fooTypes.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::smoke::fooStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::fooStruct* dummy);
::genium::optional<::smoke::fooStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::fooStruct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::fooStruct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::fooStruct> _ninput);
}
}
