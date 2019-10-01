/*
 *
 */
#pragma once
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_Enums.h"
#include "foo/Bar.h"
#include "smoke/Enums.h"
#include "smoke/EnumsInTypeCollection.h"
#include <jni.h>
#include <memory>
#include "gluecodium/Optional.h"
namespace gluecodium
{
namespace jni
{
::fire::SomeVeryExternalEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum* dummy);
::gluecodium::optional<::fire::SomeVeryExternalEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::fire::SomeVeryExternalEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::fire::SomeVeryExternalEnum> _ninput);
::smoke::Enums::External_Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum* dummy);
::gluecodium::optional<::smoke::Enums::External_Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Enums::External_Enum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::External_Enum> _ninput);
::smoke::Enums::InternalErrorCode convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::InternalErrorCode* dummy);
::gluecodium::optional<::smoke::Enums::InternalErrorCode> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Enums::InternalErrorCode>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::InternalErrorCode _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::InternalErrorCode> _ninput);
::smoke::Enums::SimpleEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum* dummy);
::gluecodium::optional<::smoke::Enums::SimpleEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::Enums::SimpleEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::Enums::SimpleEnum> _ninput);
::smoke::TCEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::TCEnum* dummy);
::gluecodium::optional<::smoke::TCEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::TCEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::TCEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::TCEnum> _ninput);
}
}
