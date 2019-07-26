#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_package_Class.h"
#include "com_example_package_InterfaceImpl.h"
#include "package/Class.h"
#include "package/Interface.h"
#include "package/Types.h"
#include <jni.h>
#include <memory>
#include "genium/Optional.h"
namespace genium
{
namespace jni
{
::package::Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Enum* dummy);
::genium::optional<::package::Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::package::Enum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::package::Enum> _ninput);
}
}
