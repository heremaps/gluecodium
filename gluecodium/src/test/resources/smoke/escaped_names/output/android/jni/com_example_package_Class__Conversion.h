/*

 *
 */

#pragma once

#include "package/Class.h"
#include "com_example_package_Types_Enum__Conversion.h"
#include "com_example_package_Types_Struct__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include <memory>
#include <optional>

namespace gluecodium
{
namespace jni
{

JNIEXPORT std::shared_ptr<::package::Class> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, TypeId<std::shared_ptr<::package::Class>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::package::Class>& _ninput);

}
}
