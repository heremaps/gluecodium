/*
 *
 */
#pragma once
#include "package/Class.h"
#include "com_example_package_Enum__Conversion.h"
#include "com_example_package_Struct__Conversion.h"
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include <functional>
#include <memory>
namespace gluecodium
{
namespace jni
{
std::shared_ptr<::package::Class> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::package::Class>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::package::Class>& _ninput);
}
}