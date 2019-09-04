#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_FreePoint.h"
#include "smoke/FreePoint.h"
#include "smoke/UnusedTopLevelPoint.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::smoke::FreePoint convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::FreePoint* dummy);
::genium::optional<::smoke::FreePoint> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::FreePoint>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::FreePoint& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::FreePoint> _ninput);
::smoke::UnusedTopLevelPoint convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::UnusedTopLevelPoint* dummy);
::genium::optional<::smoke::UnusedTopLevelPoint> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::UnusedTopLevelPoint>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::UnusedTopLevelPoint& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::UnusedTopLevelPoint> _ninput);
}
}
