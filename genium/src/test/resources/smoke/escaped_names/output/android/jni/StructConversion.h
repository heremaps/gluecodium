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
::package::Struct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::package::Struct* dummy);
::genium::optional<::package::Struct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::package::Struct>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::package::Struct& _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::package::Struct> _ninput);
}
}
