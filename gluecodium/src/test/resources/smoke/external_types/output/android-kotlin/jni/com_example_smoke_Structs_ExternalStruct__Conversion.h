/*

 *
 */

#pragma once

#include "foo/Bar.h"
#include "com_example_smoke_Structs_AnotherExternalStruct__Conversion.h"
#include "JniReference.h"
#include "JniTypeId.h"
#include "gluecodium/Optional.h"

namespace gluecodium
{
namespace jni
{
JNIEXPORT ::smoke::Structs::ExternalStruct convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Structs::ExternalStruct>);
JNIEXPORT ::gluecodium::optional<::smoke::Structs::ExternalStruct> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::gluecodium::optional<::smoke::Structs::ExternalStruct>>);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput);
JNIEXPORT JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Structs::ExternalStruct> _ninput);
}
}
