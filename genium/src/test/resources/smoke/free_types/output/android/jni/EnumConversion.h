#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_FreePoint.h"
#include "com_example_smoke_UseFreeTypes.h"
#include "smoke/UseFreeTypes.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::smoke::FreeEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::FreeEnum* dummy);
::genium::optional<::smoke::FreeEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::FreeEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::FreeEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::FreeEnum> _ninput);
}
}
