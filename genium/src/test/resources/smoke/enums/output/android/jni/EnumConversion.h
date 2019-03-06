#pragma once
#include "smoke/Enums.h"
#include "foo/Bar.h"
#include "com_example_smoke_Enums.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/EnumsInTypeCollectionInterface.h"
#include "com_example_smoke_EnumsInTypeCollectionInterface.h"
#include "smoke/EnumsInTypeCollection.h"
#include <jni.h>
#include <memory>
namespace genium
{
namespace jni
{
::smoke::Enums::SimpleEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::SimpleEnum* dummy);
std::shared_ptr<::smoke::Enums::SimpleEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::SimpleEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::SimpleEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::SimpleEnum> _ninput);
::smoke::Enums::InternalError convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::InternalError* dummy);
std::shared_ptr<::smoke::Enums::InternalError> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::InternalError>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::InternalError _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::InternalError> _ninput);
::smoke::Enums::External_Enum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Enums::External_Enum* dummy);
std::shared_ptr<::smoke::Enums::External_Enum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Enums::External_Enum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::Enums::External_Enum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Enums::External_Enum> _ninput);
::fire::SomeVeryExternalEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalEnum* dummy);
std::shared_ptr<::fire::SomeVeryExternalEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::SomeVeryExternalEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::SomeVeryExternalEnum> _ninput);
::smoke::TCEnum convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::TCEnum* dummy);
std::shared_ptr<::smoke::TCEnum> convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::TCEnum>* dummy);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::smoke::TCEnum _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::TCEnum> _ninput);
}
}
